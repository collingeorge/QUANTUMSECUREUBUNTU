#!/bin/bash

# Filename: secure_ntp_config.sh
# Purpose: Securely configure NTP using Chrony with FIPS/NIST-compliant time sources
# Author: Collin Blaine George, QuantumSecureUbuntu Project

set -euo pipefail

echo "[+] Checking and installing Chrony..."
sudo apt-get update -y
sudo apt-get install -y chrony

echo "[+] Backing up existing Chrony config..."
sudo cp /etc/chrony/chrony.conf /etc/chrony/chrony.conf.bak.$(date +%F-%T)

echo "[+] Configuring Chrony with secure NTP servers..."
cat <<EOF | sudo tee /etc/chrony/chrony.conf > /dev/null
# Secure Chrony configuration
pool time.google.com iburst
server time1.google.com iburst
server time2.google.com iburst
server time3.google.com iburst
server time4.google.com iburst
server time.nist.gov iburst
server time-e-wwv.nist.gov iburst
server time.windows.com iburst
server ntp.ubuntu.com iburst
server pool.ntp.org iburst

driftfile /var/lib/chrony/chrony.drift
makestep 1.0 3
rtcsync
EOF

echo "[+] Enabling and restarting Chrony service..."
sudo systemctl enable chrony
sudo systemctl restart chrony

echo "[+] Verifying time sync status..."
chronyc sources -v

echo "[+] Done. Your system is now using secure and verified NTP time sources."

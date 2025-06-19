#!/bin/bash
# 1_enable_fips.sh — Enable FIPS Mode on Ubuntu Pro 22.04

set -euo pipefail

echo "[*] Checking for Ubuntu Pro FIPS subscription..."
if ! command -v pro &>/dev/null; then
    echo "[!] Ubuntu Pro CLI not installed. Installing..."
    sudo apt install ubuntu-advantage-tools -y
fi

echo "[*] Attaching to Ubuntu Pro (make sure your token is set)..."
sudo pro attach

echo "[*] Enabling FIPS modules..."
sudo pro enable fips-updates -y
sudo pro enable fips -y

echo "[*] Updating GRUB to enable kernel FIPS mode..."
sudo sed -i 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="fips=1 /' /etc/default/grub
sudo update-grub

echo "[*] Reboot to apply FIPS kernel changes."

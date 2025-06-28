#!/bin/bash
# fix_pam_login_post_stig.sh
# Restores local password login after STIG disables it (PIV/cert auth enforced)

set -euo pipefail

echo "[*] Restoring PAM password login functionality..."

# 1. Restore common-auth to allow password login
sudo cp /etc/pam.d/common-auth /etc/pam.d/common-auth.bak
sudo bash -c 'cat > /etc/pam.d/common-auth' <<EOF
auth    required    pam_unix.so nullok_secure
EOF

# 2. Restore GUI login (gdm-password)
sudo cp /etc/pam.d/gdm-password /etc/pam.d/gdm-password.bak
sudo bash -c 'cat > /etc/pam.d/gdm-password' <<EOF
auth    requisite   pam_nologin.so
@include common-auth
auth    optional    pam_gnome_keyring.so
@include common-account
@include common-session
session optional    pam_gnome_keyring.so auto_start
@include common-password
EOF

# 3. Optional: SSH password login (if temporarily needed)
if grep -q "PasswordAuthentication no" /etc/ssh/sshd_config; then
    sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
    sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
    sudo systemctl restart sshd
fi

echo "[+] PAM login configuration restored. You may now login using passwords again."

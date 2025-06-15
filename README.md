# QUANTUMSECUREUBUNTU

## 🔐 Mission

To create a hardened, NIST-compliant, FIPS 140-2 validated Ubuntu 22.04 LTS system using quantum-safe cryptography, secure authentication, and military-grade hardening practices — all deployed on bare metal.

---

## ✅ What's Been Completed

### 🔒 Cryptography and FIPS

- ✅ Enabled **FIPS mode** via Ubuntu Pro subscription
  - `fips=1` kernel parameter added
  - Verified with: `cat /proc/sys/crypto/fips_enabled` → `1`
- ✅ Installed Ubuntu FIPS packages (`ubuntu-advantage-tools`, `fips-init`, `libssl`, etc.)
- ✅ Verified OpenSSL is rejecting non-FIPS algorithms (e.g., `openssl md5` fails as expected)
- ✅ Configured OpenSSL + system crypto to use only **FIPS-approved** algorithms

### 🌐 TLS / HTTPS

- ✅ All TLS connections restricted to **TLS 1.3** only
- ✅ Quantum-safe key exchange and cipher suites used (OpenSSL + liboqs compiled and integrated)
- ✅ Hybrid X25519+Kyber TLS support tested in NGINX TLS proxy stack

### 🧑‍💻 Login Hardening

- ✅ Integrated **Google Authenticator (2FA)** via PAM for:
  - Login GUI
  - `sudo`
  - SSH
- ✅ Verified GUI login is protected by time-based OTP + password
- ✅ `/etc/pam.d/sshd`, `sudo`, and related PAM modules correctly configured for OTP

### 🛡️ DISA STIG / OS Hardening

- ✅ Applied **DISA STIG for Ubuntu 22.04** using Ansible
- ✅ Removed unnecessary packages, services, and attack surfaces
- ✅ SSH hardened:
  - Only public key + Google Authenticator 2FA allowed
  - Strong MACs, KEX, Ciphers enforced
  - Root login disabled

---

## 🕵️ What's Left To Do

### 🔜 Next Steps

- [ ] Enable and configure **auditd** to track all access attempts and changes
- [ ] Backup current configs to immutable or encrypted storage
- [ ] Create and enforce **UFW or nftables-based firewall** to restrict ingress
- [ ] Finalize **full-disk encryption with FIPS-approved algorithm**
  - Encrypt `/` and `/boot` using LUKS2 with AES-XTS-256
- [ ] Secure bootloader:
  - Password-lock GRUB menu
  - Disable recovery boot shells
  - Enforce kernel boot params (`fips=1`, `quiet`, `audit=1`, etc.)
- [ ] Restrict physical access vectors (disable USB boot, etc.)
- [ ] Test remote SSH logins to confirm 2FA works externally
- [ ] Add tamper-evident logging via immutability or external log shipping (e.g., rsyslog + TLS)
- [ ] Create restoration and update automation playbook with Ansible

---

## 📁 Directory Structure (Planned)

```
quantumsecureubuntu/
├── README.md
├── hardening/
│   ├── pam/
│   ├── ssh/
│   ├── fips/
│   └── tls/
├── automation/
│   └── ansible/
├── docs/
│   └── architecture-diagram.png
└── LICENSE
```

---

## 🧠 Credits and Acknowledgements

- **ChatGPT-4o by OpenAI** – AI co-pilot, cryptography analyst, and documentation assistant posted and discoverable [here](https://chatgpt.com/share/684723d0-b094-8000-adbb-33a75f34c238)
- **Ubuntu Security Guides** – https://ubuntu.com/security
- **DISA STIG** – https://public.cyber.mil/stigs/
- **Open Quantum Safe Project (liboqs)** – https://openquantumsafe.org/
- **Google PAM Authenticator** – https://github.com/google/google-authenticator-libpam

---

## 📜 License

To be determined. MIT or Apache-2.0 suggested for open security tools.


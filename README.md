# QUANTUMSECUREUBUNTU

## 📚 Table of Contents

- [🔐 Mission](#-mission)
- [✅ What's Been Completed](#-whats-been-completed)
- [🕵️ What's Left To Do](#-whats-left-to-do)
- [📁 Directory Structure](#-directory-structure)
- [📄 Thesis Draft](#-thesis-draft)
- [🛡️ DISA STIG Automation (Ansible)](#-disa-stig-automation-ansible)
- [🧠 Credits and Acknowledgements](#-credits-and-acknowledgements)
- [📜 License](#-license)

---

## 🔐 Mission

To create a hardened, NIST-compliant, FIPS 140-2 validated Ubuntu 22.04 LTS system using quantum-safe cryptography, secure authentication, and military-grade hardening practices — all deployed on bare metal.

---

## ✅ What's Been Completed

### 🔒 Cryptography and FIPS

- ✅ Enabled **FIPS mode** via Ubuntu Pro subscription
- ✅ Verified OpenSSL FIPS enforcement (`openssl md5` fails)
- ✅ Configured for **FIPS-approved** algorithms only

### 🌐 TLS / HTTPS

- ✅ TLS 1.3 only
- ✅ Quantum-safe key exchange (X25519+Kyber via liboqs)
- ✅ Tested in NGINX TLS proxy

### 🧑‍💻 Login Hardening

- ✅ Integrated **Google Authenticator (2FA)** for:
  - GUI Login
  - `sudo`
  - SSH
- ✅ PAM modules configured and verified

### 🛡️ DISA STIG / OS Hardening

- ✅ DISA STIG applied via Ansible
- ✅ SSH hardened (2FA, strong ciphers, root login disabled)
- ✅ System locked down per NIST/DISA recommendations

---

## 🕵️ What's Left To Do

### 🔜 Next Steps

- [ ] Enable auditd, AIDE, and secure log forwarding
- [ ] Create full-disk LUKS2 encryption script (AES-XTS-256)
- [ ] Harden GRUB bootloader (done ✅ but pending ISO integration)
- [ ] Harden network stack and create nftables firewall script
- [ ] Package all scripts into an installable ISO build
- [ ] Write academic whitepaper / thesis documentation

---

## 📁 Directory Structure

```
quantumsecureubuntu/
├── README.md
├── docs/
│   └── quantum_secure_os_thesis.pdf
├── scripts/
│   └── fix_pam_login_post_stig.sh
├── automation/
│   └── ansible/
│       └── disa_stig_role/
└── LICENSE
```

---

## 📄 Thesis Draft

This project is part of an independent doctoral research initiative in secure operating system design, with a focus on national compliance standards (FIPS 140-2, NIST 800-53, DISA STIG) and quantum-resilient cryptographic infrastructure.

- ✅ [Download Thesis PDF](./docs/quantum_secure_os_thesis.pdf)
- 🔗 GitHub permalink: `docs/quantum_secure_os_thesis.pdf`
- ✍️ Authored by Collin George, Cybersecurity Researcher

> This document is a live, open contribution to the scientific and security communities and may evolve as additional scripts and ISO deliverables are developed.

---

## 🛡️ DISA STIG Automation (Ansible)

📁 [automation/ansible/disa_stig_role](./automation/ansible/disa_stig_role)

### 🛠️ Modifications:

- PAM hardening tasks removed to avoid credential lockout
- Validated against a FIPS-enabled system
- Intended to run *before* enabling hardened login

### ✅ Usage Instructions

```bash
# Step 1: Audit Mode
ansible-playbook -i inventory.ini site.yml --check

# Step 2: Enforcement Mode
ansible-playbook -i inventory.ini site.yml

# Step 3: Restore password login after STIG (important!)
bash ./scripts/fix_pam_login_post_stig.sh

# Step 4: Configure hardened login (Google Authenticator)
# Follow script/README instructions in login hardening module (TBD)
```

---

## 🧠 Credits and Acknowledgements

- **ChatGPT-4o by OpenAI** – Cryptography assistant and documentation partner ([chat link](https://chat.openai.com/share/684723d0-b094-8000-adbb-33a75f34c238))
- **Ubuntu Security Guides** – https://ubuntu.com/security
- **DISA STIG** – https://public.cyber.mil/stigs/
- **Open Quantum Safe Project (liboqs)** – https://openquantumsafe.org/
- **Google PAM Authenticator** – https://github.com/google/google-authenticator-libpam

---

## 📜 License

TBD. Recommendation: MIT or Apache-2.0 for open-source security tooling.

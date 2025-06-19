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

### 🔐 Bootloader Security

- ✅ Password-protected GRUB menu
- ✅ Disabled edit mode (`c` / `e`) and locked boot parameters
- ✅ Custom GRUB entries enforced via `40_custom`
- ✅ Recovery shell locked with `sulogin` override

### 📄 Thesis Progress (Live PDF)

- ✅ Public academic paper draft uploaded
- 📄 View: [Quantum Secure OS Thesis (PDF)](https://github.com/collingeorge/QUANTUMSECUREUBUNTU/blob/docs/quantum_secure_os_thesis.pdf)

---

## 🕵️ What's Left To Do

### 🔜 Next Steps

- [ ] Enable and configure **auditd** to track all access attempts and changes
- [ ] Backup current configs to immutable or encrypted storage
- [ ] Create and enforce **UFW or nftables-based firewall** to restrict ingress
- [ ] Finalize **full-disk encryption with FIPS-approved algorithm**
  - Encrypt `/` and `/boot` using LUKS2 with AES-XTS-256
- [ ] Restrict physical access vectors (disable USB boot, BIOS lock)
- [ ] Test remote SSH logins to confirm 2FA works externally
- [ ] Add tamper-evident logging via immutability or external log shipping (e.g., rsyslog + TLS)
- [ ] Create restoration and update automation playbook with Ansible
- [ ] Final deliverable: create downloadable hardened .ISO installer

---

## 📁 Directory Structure (Planned)

```
quantumsecureubuntu/
├── README.md
├── LICENSE
├── scripts/
│   ├── quantumsecure.tex
│   └── quantumsecure.pdf
├── hardening/
│   ├── pam/
│   ├── ssh/
│   ├── fips/
│   └── tls/
├── automation/
│   └── ansible/
├── docs/
│   └── architecture-diagram.png
└── proof/
    └── screenshots/, logs/, verification.txt
```

---

## 🧠 Credits and Acknowledgements

- **ChatGPT-4o by OpenAI** – AI co-pilot, cryptography analyst, and documentation assistant
- **Ubuntu Security Guides** – https://ubuntu.com/security
- **DISA STIG** – https://public.cyber.mil/stigs/
- **Open Quantum Safe Project (liboqs)** – https://openquantumsafe.org/
- **Google PAM Authenticator** – https://github.com/google/google-authenticator-libpam

---

## 📜 License

MIT License

```
MIT License

Copyright (c) 2025 Collin George

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

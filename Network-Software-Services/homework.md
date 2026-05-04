# M4 Lab: Network, Software, Services

## 📌 Overview

This lab demonstrates building a small Linux network environment using two virtual machines:

* **rila.lsa.lab** (Server)
* **pirin.lsa.lab** (Client)

The goal is to simulate:

* DHCP server
* NAT gateway
* SSH configuration
* Firewall management
* Basic Linux administration

---

# 🖥️ Environment Setup

## Rila VM

* Adapter 1: NAT (Internet access)
* Adapter 2: Internal Network (lsa-lab)

## Pirin VM

* Adapter 1: Internal Network (lsa-lab)

---

# 🔧 Rila Configuration (Server)

## Set hostname

```bash
sudo hostnamectl set-hostname rila.lsa.lab
```

Sets system hostname.

---

## Configure static IP (internal network)

```bash
nmcli con show
```

Lists network connections.

```bash
sudo nmcli con mod "Wired connection 2" ipv4.addresses 192.168.148.1/24
sudo nmcli con mod "Wired connection 2" ipv4.method manual
sudo nmcli con up "Wired connection 2"
```

Sets static IP for internal interface.

---

## Install DHCP server

```bash
sudo dnf install -y dhcp-server
```

---

## Configure DHCP

```bash
sudo vi /etc/dhcp/dhcpd.conf
```

```conf
subnet 192.168.148.0 netmask 255.255.255.0 {
    range 192.168.148.50 192.168.148.59;
    option routers 192.168.148.1;
    option domain-name-servers 8.8.8.8;
}
```

---

## Start DHCP service

```bash
sudo systemctl enable --now dhcpd
```

---

## Install SSH

```bash
sudo dnf install -y openssh-server
sudo systemctl enable --now sshd
```

---

## Configure firewall

```bash
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

---

## Enable IP forwarding

```bash
echo "net.ipv4.ip_forward=1" | sudo tee /etc/sysctl.d/99-forward.conf
sudo sysctl --system
```

---

## Enable NAT

```bash
sudo firewall-cmd --permanent --add-masquerade
sudo firewall-cmd --reload
```

---

## Install repository and package

```bash
curl -s https://repos.zahariev.pro/install.sh | sudo bash
sudo dnf install -y hello-lsa
```

---

# 🖥️ Pirin Configuration (Client)

## Set hostname

```bash
sudo hostnamectl set-hostname pirin.lsa.lab
```

---

## Enable DHCP

```bash
sudo nmcli con mod "Wired connection 1" ipv4.method auto
sudo nmcli con up "Wired connection 1"
```

---

## Create user

```bash
sudo useradd homework
sudo passwd homework
```

Password:

```
Parolka3
```

---

## Add to sudo

```bash
sudo usermod -aG wheel homework
```

---

## Install SSH

```bash
sudo dnf install -y openssh-server
```

---

## Change SSH port

```bash
sudo vi /etc/ssh/sshd_config
```

Change:

```
Port 50022
```

---

## SELinux fix

```bash
sudo dnf install -y policycoreutils-python-utils
sudo semanage port -a -t ssh_port_t -p tcp 50022
```

---

## Firewall

```bash
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-port=50022/tcp
sudo firewall-cmd --reload
```

---

## Start SSH

```bash
sudo systemctl enable --now sshd
sudo systemctl restart sshd
```

---

# ✅ Tests

## Connectivity

```bash
ping 192.168.148.1
ping 8.8.8.8
```

---

## SSH test

```bash
ssh -p 50022 homework@192.168.148.X
```

---

# 🧪 SoftUni Validation

## Rila

```bash
curl -s https://courses.zahariev.pro/m4.sh | sudo vm=1 bash
```

## Pirin

```bash
curl -s https://courses.zahariev.pro/m4.sh | sudo vm=2 bash
```

---

# 🚀 Conclusion

This lab demonstrates:

* Network configuration
* DHCP setup
* NAT and routing
* Firewall management
* SSH configuration

This is a fundamental step toward becoming a Linux System Administrator.


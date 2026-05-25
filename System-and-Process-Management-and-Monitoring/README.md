# Homework – System Startup and Processes Management

## Student: Georgi Raykov

---

# 1. Boot Procedure Modifications

## Goal
Apply permanent changes to the system boot process:
- Set boot timeout to 60 seconds
- Enable full diagnostic boot messages

---

## Step 1 – Edit GRUB configuration

sudo nano /etc/default/grub

Step 2 – Set boot timeout

GRUB_TIMEOUT=60

Step 3 – Enable full boot messages

Remove the following parameters if present:

quiet rhgb splash

Before:

GRUB_CMDLINE_LINUX="quiet rhgb"

After:

GRUB_CMDLINE_LINUX=""

Step 4 – Apply changes

sudo grub2-mkconfig -o /boot/efi/EFI/almalinux/grub.cfg

sudo reboot



2. Boot Logs Extraction

Extract kernel boot messages

sudo dmesg -T | tac > boot-extract.txt

3. Process Monitoring

sudo dnf install sysstat -y

Save report to file

pidstat 2 5 > pidstat-report.txt


4. Summary

In this lab exercise I:

Configured GRUB boot parameters
Increased boot timeout to 60 seconds
Enabled full diagnostic boot messages
Analyzed system boot performance using systemd tools
Extracted kernel boot logs using dmesg
Monitored running processes using pidstat
Generated performance reports for system analysis

Tools Used:

GRUB2 bootloader
dmesg
pidstat (sysstat package)

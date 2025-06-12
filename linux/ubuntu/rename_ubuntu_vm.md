
# Rename Ubuntu 24.04 VM Internally

This guide covers how to rename an Ubuntu 24.04 LTS virtual machine **from within the server**, updating its hostname and internal network identity.

---

## 1. Update the Hostname File

Edit the `/etc/hostname` file:
```bash
sudo nano /etc/hostname
```
Replace the current hostname with the new name, e.g.:
```
webserver-template
```

---

## 2. Update the Hosts File

Edit the `/etc/hosts` file:
```bash
sudo nano /etc/hosts
```
Find and change the line that looks like:
```
127.0.1.1    oldname
```
to:
```
127.0.1.1    webserver-template
```

---

## 3. Apply the New Hostname

Run the following command to immediately apply the new hostname:
```bash
sudo hostnamectl set-hostname webserver-template
```

---

## 4. Reboot the Server

To ensure all services recognize the new hostname:
```bash
sudo reboot
```

After reboot, your shell prompt and system identity should reflect the new hostname.

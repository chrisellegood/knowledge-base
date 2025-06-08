
# Local Web Server Setup on Ubuntu 24.04 LTS VM

This guide walks you through the initial configuration of a secure, production-ready local web server using a virtual machine running Ubuntu 24.04 LTS.

---

## Prerequisites
- A working Ubuntu 24.04 LTS server VM.
- Access via SSH or terminal.
- Basic Linux command-line knowledge.

---

## 1. Create a Non-Root User with Sudo Access
```bash
adduser deploy
usermod -aG sudo deploy
```

---

## 2. Configure SSH Key Authentication
### On your local/host machine:
```bash
ssh-keygen -t ed25519
ssh-copy-id deploy@<vm-ip>
```

### On the VM:
```bash
sudo nano /etc/ssh/sshd_config
```
Update these settings:
```text
PasswordAuthentication no
PermitRootLogin no
```
Then restart SSH:
```bash
sudo systemctl restart ssh
```

---

## 3. Enable Firewall (UFW)
```bash
sudo apt update
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw enable
```

---

## 4. Install and Enable Fail2Ban
```bash
sudo apt install fail2ban
sudo systemctl enable fail2ban --now
```

---

## 5. Enable Time Synchronization
```bash
timedatectl status
sudo apt install systemd-timesyncd
sudo systemctl enable systemd-timesyncd --now
```

---

## 6. Install Nginx Web Server
```bash
sudo apt install nginx
sudo systemctl enable nginx --now
```

(Optional, for real domains with HTTPS support)
```bash
sudo apt install certbot python3-certbot-nginx
```

---

## 7. Set Up Directory Structure for a Site
Example for domain `local.example.test`:
```bash
sudo mkdir -p /var/www/local.example.test/{public_html,logs,config}
sudo chown -R deploy:www-data /var/www/local.example.test
```

---

## 8. Configure Nginx Server Block
```bash
sudo nano /etc/nginx/sites-available/local.example.test
```
Add the following configuration:
```nginx
server {
    listen 80;
    server_name local.example.test;

    root /var/www/local.example.test/public_html;
    index index.html index.htm;

    access_log /var/www/local.example.test/logs/access.log;
    error_log /var/www/local.example.test/logs/error.log;

    location / {
        try_files $uri $uri/ =404;
    }
}
```
Enable the site and reload Nginx:
```bash
sudo ln -s /etc/nginx/sites-available/local.example.test /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

---

## 9. Add Local Domain Mapping
On your **host machine**:
```bash
sudo nano /etc/hosts
```
Add this line:
```text
<vm-ip>    local.example.test
```

---

## Next Steps
Would you like to:
- Add PHP and a database (MariaDB/PostgreSQL)?
- Deploy a specific app stack (e.g., WordPress, Laravel, Node.js)?
- Set up local SSL (self-signed or internal CA)?

Let me know and I can guide you further.

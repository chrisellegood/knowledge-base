# 🔐 Setting Up SSH Access to GitHub on Fedora

This guide walks you through generating an SSH key, configuring it with GitHub, and testing your setup — the secure and password-free way to use `git push`.

---

## 🧰 1. Generate an SSH Key

Open a terminal and run:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- Press **Enter** to accept the default location or enter a custom filename (e.g., `chris_ellegood_ed25519`)
- Optionally enter a passphrase

This will create two files:
- Your private key: `~/.ssh/chris_ellegood_ed25519`
- Your public key: `~/.ssh/chris_ellegood_ed25519.pub`

---

## 📁 2. Move the Key to the SSH Folder (if needed)

```bash
mkdir -p ~/.ssh
mv ~/chris_ellegood_ed25519 ~/.ssh/
mv ~/chris_ellegood_ed25519.pub ~/.ssh/
chmod 600 ~/.ssh/chris_ellegood_ed25519
chmod 644 ~/.ssh/chris_ellegood_ed25519.pub
```

---

## 🚀 3. Add the Key to the SSH Agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/chris_ellegood_ed25519
```

---

## 🌐 4. Add Your Public Key to GitHub

1. Run:
   ```bash
   cat ~/.ssh/chris_ellegood_ed25519.pub
   ```
2. Copy the entire output
3. Go to: [https://github.com/settings/keys](https://github.com/settings/keys)
4. Click **"New SSH key"**
5. Paste your key, give it a name (e.g., `fedora-laptop`), and click **"Add SSH key"**

---

## ✅ 5. Test the Connection

```bash
ssh -T git@github.com
```

Expected output:

```
Hi your-username! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## 🧩 6. Optional: Configure Git to Use the SSH Key

If you want Git to always use your custom-named key:

```bash
git config --global core.sshCommand "ssh -i ~/.ssh/chris_ellegood_ed25519"
```

---

## 🎉 Done!

You can now clone, push, and pull from GitHub using SSH without entering your username or password every time.

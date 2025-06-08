# 🚀 How to Push a File to GitHub Using SSH

This tutorial explains how to add and push a new file to a GitHub repository using SSH from your terminal on Fedora.

---

## ✅ Prerequisites

- You have a GitHub account.
- You created a GitHub repository (e.g., `knowledge-base`).
- You’ve set up SSH access to GitHub (see `github-ssh-setup-fedora.md`).

---

## 🧱 1. Clone the Repository (if not already)

```bash
git clone git@github.com:your-username/knowledge-base.git
cd knowledge-base
```

Replace `your-username` with your actual GitHub username.

---

## 📄 2. Move the File into Your Repo

Move your file (e.g., a script or `.md` file) into the repo folder:

```bash
mv ~/Downloads/github-ssh-setup-fedora.md .
```

---

## ➕ 3. Stage and Commit the File

```bash
git add github-ssh-setup-fedora.md
git commit -m "Add SSH setup tutorial"
```

---

## 🚀 4. Push to GitHub

```bash
git push
```

If SSH is set up correctly, it will push without asking for username or password.

---

## ✅ 5. Verify on GitHub

Go to your repository URL:  
`https://github.com/your-username/knowledge-base`

You should now see the new file listed.

---

## 🧩 Tip: Check Remote URL

If you cloned with HTTPS and want to switch to SSH:

```bash
git remote set-url origin git@github.com:your-username/knowledge-base.git
```

Then push again using SSH.

---

You're all set!

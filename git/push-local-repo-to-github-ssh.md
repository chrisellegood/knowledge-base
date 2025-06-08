# 🚀 Pushing a Locally Created Git Repo to GitHub Using SSH

This guide walks you through taking a local Git repo and publishing it to GitHub over SSH.

---

## ✅ Prerequisites

- You have a GitHub account
- You created an SSH key and added it to GitHub ([see SSH setup guide](github-ssh-setup-fedora.md))
- You’ve created a **local Git repository** (e.g., `knowledge-base`)

---

## 🧱 1. Create a Repository on GitHub

1. Go to [https://github.com/new](https://github.com/new)
2. Name it exactly like your local folder (e.g., `knowledge-base`)
3. **Do NOT initialize with a README**
4. Click **“Create repository”**

---

## 💻 2. Navigate to Your Local Repo

If you already have a folder with Git initialized:

```bash
cd ~/knowledge-base
```

Otherwise, create and initialize it:

```bash
mkdir ~/knowledge-base
cd ~/knowledge-base
git init
```

---

## 📄 3. Add Your Files and Make a Commit

```bash
echo "# Knowledge Base" > README.md
git add .
git commit -m "Initial commit"
```

---

## 🌐 4. Add the GitHub Remote Using SSH

```bash
git remote add origin git@github.com:your-username/knowledge-base.git
```

Replace `your-username` with your GitHub username.

---

## 🚀 5. Push to GitHub

```bash
git branch -M main
git push -u origin main
```

✅ This will upload your local repo to GitHub under the `main` branch.

---

## 🧪 6. Verify It

Visit:  
`https://github.com/your-username/knowledge-base`

You should now see your repo live with all files.

---

You're done! You can now continue to add, commit, and push as usual.

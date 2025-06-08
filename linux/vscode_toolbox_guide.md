# Running Visual Studio Code from a Non-Default Toolbox on Fedora Silverblue

This guide explains how to install and run **Visual Studio Code (VS Code)** inside a non-default [Toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/) container on Fedora Silverblue, and integrate it into your desktop environment with a launcher icon.

---

## Prerequisites
- Fedora Silverblue (or Kinoite/Sericea)
- Flatpak support (optional, but not used here)
- Toolbox installed (default on Silverblue)

---

## 1. Create a Custom Toolbox
```bash
toolbox create --container dev
```

Replace `dev` with any name you prefer. Then enter it:

```bash
toolbox enter dev
```

---

## 2. Install VS Code in the Toolbox
Inside the toolbox:

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf check-update
sudo dnf install code
```

Test it:
```bash
code
```

---

## 3. Create a Desktop Launcher (on Host)
On the **host system**, create a `.desktop` file:

```bash
nano ~/.local/share/applications/code-toolbox.desktop
```

Paste the following (adjust container name if needed):

```ini
[Desktop Entry]
Name=VS Code (Toolbox)
Comment=Run VS Code inside toolbox container
Exec=toolbox run -c dev code
Icon=code
Type=Application
StartupNotify=true
Categories=Development;IDE;
Terminal=false
```

Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`).

---

## 4. Make the Launcher Executable
```bash
chmod +x ~/.local/share/applications/code-toolbox.desktop
update-desktop-database ~/.local/share/applications
```

---

## 5. Add to Dash / Favorites
- Press the **Super** key (Windows key)
- Search for "VS Code (Toolbox)"
- Right-click the icon → **Add to Favorites**

---

## Notes
- The `toolbox run -c dev code` ensures it uses the **non-default** container.
- You can install any dev tools inside the container without affecting the immutable host.
- To make this container the default (optional):

```bash
toolbox set-default dev
```

---

## Troubleshooting
- If the icon doesn’t launch, test the command in terminal:
  ```bash
  toolbox run -c dev code
  ```
- If the icon doesn't appear, verify the `.desktop` file and run:
  ```bash
  update-desktop-database ~/.local/share/applications
  ```

---

Enjoy a clean and powerful dev setup on Fedora Silverblue!

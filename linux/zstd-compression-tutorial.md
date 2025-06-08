# 📦 Fast Compression with `zstd`

`zstd` (Zstandard) is a fast, efficient compression tool developed by Facebook. It offers better performance and flexibility than traditional tools like `gzip` or `xz`.

---

## 🔧 Installing `zstd`

### On Fedora Workstation:
```bash
sudo dnf install zstd
```

### On Fedora Silverblue (immutable):
#### System-wide (requires reboot):
```bash
sudo rpm-ostree install zstd
```

#### Or use a Toolbox:
```bash
toolbox create --release $(rpm -E %fedora)
toolbox enter
sudo dnf install zstd
```

---

## 🚀 Basic Usage

### Compress a file:
```bash
zstd myfile.img
```

This creates `myfile.img.zst`.

### Decompress a file:
```bash
unzstd myfile.img.zst
# or
zstd -d myfile.img.zst
```

---

## 🎯 Advanced Options

### Use maximum compression:
```bash
zstd -19 myfile.img
```

### Use multiple CPU cores:
```bash
zstd -T0 myfile.img
```
- `-T0` uses all available cores.

### Combine both:
```bash
zstd -T0 -19 myfile.img -o myfile.img.zst
```

---

## 🧪 Check compression stats

After completion, `zstd` shows:
```
myfile.img : 5000000000 -> 800000000 (15.98%)   ==> Compression successful
```

This tells you the input size, output size, and the compression ratio.

---

## 📝 Tips

- Works well on **sparse files** and files with lots of zeros.
- Ideal for **disk images**, **logs**, and **backups**.
- Use with `tar` for directories:
```bash
tar -cf - mydir | zstd -T0 -19 -o mydir.tar.zst
```

---

## 🧹 Decompress in one go:
```bash
zstd -d -c myfile.img.zst > myfile.img
```

Or with `tar`:
```bash
unzstd -c mydir.tar.zst | tar -xf -
```

---

## 📚 More info
- Official site: https://facebook.github.io/zstd/
- Man page: `man zstd`


# 🛡️ Creating a Clean Disk Image Using a Fedora Live USB

This tutorial walks you through creating a consistent, reliable disk or partition image using a Fedora Live USB environment. This is the safest way to image a running system.

---

## 🧰 Requirements

- Fedora Live USB (Workstation or Silverblue ISO).
- External drive with enough space to hold the image.
- Terminal access.

---

## 🧭 Steps

### 1. Boot from the Live USB

- Choose "Try Fedora" when booting.
- Open a terminal.

---

### 2. Identify the Partition to Image

List all drives and partitions:

```bash
lsblk
```

Find the partition you want to image, e.g., `/dev/sda3`, `/dev/nvme0n1p3`.

Make sure it is **not mounted**:

```bash
sudo umount /dev/sdXn
```

Replace `sdXn` with the actual device name.

---

### 3. Mount Your External Drive

Usually mounted automatically, or you can mount it manually:

```bash
udisksctl mount -b /dev/sdXn
cd /run/media/liveuser/YourExternalDriveName
```

---

### 4. Create and Compress the Image

Use `dd` and `zstd` to create a compressed image:

```bash
sudo dd if=/dev/sdXn bs=1M status=progress | zstd -T0 -19 -o my-partition.img.zst
```

- `sdXn`: the target partition (e.g., `nvme0n1p3`)
- `bs=1M`: efficient block size
- `zstd -T0 -19`: fast and effective compression

To image without compression:

```bash
sudo dd if=/dev/sdXn of=my-partition.img bs=1M status=progress
```

---

## ✅ Verifying the Image

You can check image integrity later using:

```bash
zstd -t my-partition.img.zst
```

---

## 💡 Notes

- Works best for read-mostly partitions like root on Silverblue.
- Avoid imaging a mounted, changing filesystem unless necessary.
- You can later mount the image or restore it using `dd` or `gnome-disks`.

---

## 📚 Restore Later (Optional)

To restore the image:

```bash
zstd -d my-partition.img.zst -o my-partition.img
sudo dd if=my-partition.img of=/dev/sdXn bs=1M status=progress
```

**Make sure `/dev/sdXn` is the correct target!**

---


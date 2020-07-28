#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:07dc769cd007b79a8ffec4f928d71db0156d2ffa; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:ee7aa3cf6eced500926be19821e8789616508dcb \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:07dc769cd007b79a8ffec4f928d71db0156d2ffa && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

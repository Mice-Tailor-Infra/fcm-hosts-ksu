#!/system/bin/sh

# 定义要铲除的数据区
DATA_DIR="/data/adb/fcm-hosts"

# 1. 彻底删除持久化目录
if [ -d "$DATA_DIR" ]; then
    rm -rf "$DATA_DIR"
fi

# 2. 这里的 /system/etc/hosts 软链不需要手动删
# Magisk/KSU 在卸载模块后，OverlayFS 会自动撤销挂载，系统会回滚到原版 hosts

exit 0
#!/system/bin/sh
set -e

MODPATH="${0%/*}"
WORKSPACE="/data/adb/fcm-hosts"

# 环境准备
mkdir -p "$WORKSPACE"

# 基底初始化
if [ ! -f "$WORKSPACE/hosts" ]; then
    cp /system/etc/hosts "$WORKSPACE/hosts"
    chcon --reference /system/etc/hosts "$WORKSPACE/hosts"
fi

# 建立软链
mkdir -p "$MODPATH/system/etc"
rm -f "$MODPATH/system/etc/hosts"
ln -sf "$WORKSPACE/hosts" "$MODPATH/system/etc/hosts"

# 部署脚本
mkdir -p "$MODPATH/system/bin"
cp "$MODPATH/../system/bin/fcm-update" "$MODPATH/system/bin/fcm-update"
chmod 755 "$MODPATH/system/bin/fcm-update"

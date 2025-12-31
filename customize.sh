#!/system/bin/sh
set -e

MODPATH=${0%/*}
WORKSPACE="/data/adb/fcm-hosts"

ui_print "- 开始安装 FCM Hosts Optimizer..."

# 环境准备
mkdir -p "$WORKSPACE"

# 基底初始化
if [ ! -f "$WORKSPACE/hosts" ]; then
    ui_print "- 初始化 hosts 数据..."
    cat /system/etc/hosts > "$WORKSPACE/hosts"
    chcon --reference /system/etc/hosts "$WORKSPACE/hosts"
fi

# 建立软链
ui_print "- 建立系统映射..."
mkdir -p "$MODPATH/system/etc"
ln -sf "$WORKSPACE/hosts" "$MODPATH/system/etc/hosts"

# 设置权限
ui_print "- 设置权限..."
chmod 755 "$MODPATH/system/bin/fcm-update"
chmod 755 "$MODPATH/service.sh"

ui_print "安装完成！请重启手机。"

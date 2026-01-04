#!/system/bin/sh
# 此模块的调度已由 MiceTimer 接管
# 配置文件位于 /data/adb/timers.d/fcm-hosts.toml
MODDIR=${0%/*}
# 1. 确保目标文件存在 (如果是新建/升级的情况)
if [ ! -f "/data/adb/fcm-hosts/hosts" ]; then
    echo "127.0.0.1 localhost" > /data/adb/fcm-hosts/hosts
    chmod 644 /data/adb/fcm-hosts/hosts
fi

# 2. 执行 Bind Mount (覆盖系统 hosts)
# 注意：我们挂载到 /system/etc/hosts。如果它原本是此模块的软链接，Magisk 会处理；
# 如果它是系统原文件，我们需要覆盖它。为了稳妥，先尝试创建个哑文件防止挂载到空处（虽然 system 是 ro）
# Magisk/KSU 环境下，直接挂载即可，Magic Mount 会处理。

mount --bind /data/adb/fcm-hosts/hosts /system/etc/hosts

echo "[$(date)] FCM Hosts (Bind Mount) is active." > /data/adb/fcm-hosts/service.log
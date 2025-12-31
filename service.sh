#!/system/bin/sh
set -e

WORKSPACE="/data/adb/fcm-hosts"
UPDATE_SCRIPT="$WORKSPACE/bin/fcm-update"

# 创建 bin 目录
mkdir -p "$WORKSPACE/bin"

# 复制更新脚本到 workspace
if [ -f "/data/adb/modules/fcm-hosts-optimizer/system/bin/fcm-update" ]; then
    cp /data/adb/modules/fcm-hosts-optimizer/system/bin/fcm-update "$UPDATE_SCRIPT"
    chmod 755 "$UPDATE_SCRIPT"
fi

# 等待网络就绪
sleep 60

# 首次更新
"$UPDATE_SCRIPT" || true

# 定时更新循环 (3小时一次)
while true; do
    # 检查网络连通性
    if curl -sf --connect-timeout 10 https://google.com > /dev/null 2>&1; then
        "$UPDATE_SCRIPT" || true
    fi
    sleep 10800  # 3小时
done

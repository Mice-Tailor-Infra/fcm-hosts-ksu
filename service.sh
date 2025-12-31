#!/system/bin/sh
# FCM Hosts Autopilot

UPDATE_CMD="/system/bin/fcm-update"
INTERVAL=21600 # 6小时更新一次

(
    # A. 等待系统完全启动
    until [ "$(getprop sys.boot_completed)" = "1" ]; do
        sleep 5
    done
    
    # B. 额外宽限 30s 确保网络栈就绪
    sleep 30

    while true; do
        # 直接执行，fcm-update 内部自带网络校验和错误处理
        if [ -x "$UPDATE_CMD" ]; then
            "$UPDATE_CMD" >/dev/null 2>&1
        fi
        sleep "$INTERVAL"
    done
) &
#!/system/bin/sh
# FCM Hosts Autopilot

UPDATE_CMD="/system/bin/fcm-update"
LOG_FILE="/data/adb/fcm-hosts/service.log"
INTERVAL=21600 # 6小时更新一次

log_msg() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

(
    # A. 等待系统完全启动
    until [ "$(getprop sys.boot_completed)" = "1" ]; do
        sleep 5
    done
    
    # B. 额外宽限 30s 确保网络栈就绪
    sleep 30

    log_msg "Service started. Loop interval: $INTERVAL seconds."

    while true; do
        # 直接执行，fcm-update 内部自带网络校验和错误处理
        if [ -x "$UPDATE_CMD" ]; then
            log_msg "Executing update..."
            "$UPDATE_CMD" >> "$LOG_FILE" 2>&1
            EXIT_CODE=$?
            log_msg "Update finished with exit code $EXIT_CODE"
        else
            log_msg "ERROR: $UPDATE_CMD not found or not executable!"
        fi
        sleep "$INTERVAL"
    done
) &

#!/system/bin/sh

# 定义持久化物理路径
DATA_DIR="/data/adb/fcm-hosts"
DATA_BIN="$DATA_DIR/bin"
DATA_HOSTS="$DATA_DIR/hosts"

ui_print "- 正在初始化 Mjolnir 物理地基..."
mkdir -p "$DATA_BIN"

# 1. 搬运物理二进制
if [ -f "$MODPATH/bin/fcm-update" ]; then
    mv -f "$MODPATH/bin/fcm-update" "$DATA_BIN/fcm-update"
    chmod 755 "$DATA_BIN/fcm-update"
    # 彻底销毁模块内的物理 bin 目录，因为 system/bin 已经是软链了
    rm -rf "$MODPATH/bin"
else
    ui_print "❌ 错误: 缺少 bin/fcm-update 源文件"
    abort
fi

# 2. 初始化数据文件 (保底 localhost)
if [ ! -f "$DATA_HOSTS" ]; then
    ui_print "- 正在生成初始 Hosts 映像..."
    echo "127.0.0.1 localhost" > "$DATA_HOSTS"
    echo "::1 localhost ip6-localhost" >> "$DATA_HOSTS"
    # 尝试读取系统原版内容作为保底 (排除 localhost 冲突)
    grep -v "localhost" /system/etc/hosts >> "$DATA_HOSTS" 2>/dev/null || true
fi

# 3. 关键：SELinux 穿透修复
if [ -x "$(command -v chcon)" ]; then
    ui_print "- 正在同步安全上下文 (SELinux)..."
    chcon --reference /system/etc/hosts "$DATA_HOSTS" 2>/dev/null || true
    chcon --reference /system/etc/hosts "$DATA_BIN/fcm-update" 2>/dev/null || true
fi

ui_print "✅ 架构挂载成功：/etc/hosts -> $DATA_HOSTS"
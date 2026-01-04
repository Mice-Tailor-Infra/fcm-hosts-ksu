# FCM Hosts KSU 模块

通过 Bind Mount（动态挂载）技术实现的 Systemless Hosts 模块。自动同步云端优质 IP 库。

## ✨ 核心特性

- **动态挂载 (Bind Mount)**：直接挂载覆盖 `/system/etc/hosts`，彻底解决软链接导致的权限问题。
- **云端同步**：自动从 FCM 双栈 IP 池同步最新数据。
- **定时更新**：每 3 小时自动检查更新。
- **本地保护**：强制保留 localhost 定义，防止回环异常。
- **SELinux 兼容**：自动维持正确的安全上下文。

## 📥 安装指南

1. 通过 Magisk Manager 或 KernelSU 安装本模块。
2. **重启设备**。
3. 模块将自动启动挂载服务并开始更新（若有网络）。

## 🛠 常用命令

```bash
# 手动强制更新
/data/adb/fcm-hosts/bin/fcm-update
```

## ⚙️ 配置说明

- **工作区**: `/data/adb/fcm-hosts/`
- **更新脚本**: `/data/adb/fcm-hosts/bin/fcm-update`
- **远程源**: `https://miceworld.top/fcm-hosts-next/fcm_dual.hosts`

## ⏱ 更新策略

- **默认间隔**: 3 小时 (10800 秒)
- **首次延迟**: 开机后 60 秒

## ❤️ 致谢

- [FCM Hosts](https://miceworld.top/fcm-hosts-next/)
- [Magisk](https://github.com/topjohnwu/Magisk)
- [KernelSU](https://github.com/tiann/KernelSU)

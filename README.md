# FCM Hosts KSU Module

Systemless hosts via symlink strategy. Auto-syncs with cloud IP pool.

## Features

- **Soft Link Strategy**: `/system/etc/hosts` → `/data/adb/fcm-hosts/hosts`
- **Cloud Sync**: Automatically syncs with FCM dual IP pool
- **Scheduled Update**: Updates every 3 hours
- **Localhost Protection**: Preserves localhost definitions
- **SELinux Compatible**: Maintains proper context

## Installation

1. Install via Magisk Manager or KernelSU
2. Reboot your device
3. The module will automatically create the symlink and start updating

## Commands

```bash
# Manual update
/data/adb/fcm-hosts/bin/fcm-update
```

## Configuration

- **Workspace**: `/data/adb/fcm-hosts/`
- **Update Script**: `/data/adb/fcm-hosts/bin/fcm-update`
- **Remote Source**: `https://miceworld.top/fcm-hosts-next/fcm_dual.hosts`

## Update Interval

- **Default**: 3 hours (10800 seconds)
- First update: 60 seconds after boot

## Credits

- [FCM Hosts](https://miceworld.top/fcm-hosts-next/)
- [Magisk](https://github.com/topjohnwu/Magisk)
- [KernelSU](https://github.com/tiann/KernelSU)

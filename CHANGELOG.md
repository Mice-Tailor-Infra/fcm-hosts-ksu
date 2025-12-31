# Changelog

All notable changes to this project will be documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.0] - 2026-01-01

### Added
- Initial release
- Systemless hosts via symlink strategy
- Auto-sync with cloud IP pool
- 3-hour scheduled update
- SELinux context support
- GitHub Actions CI/CD

### Features
- Soft link: /system/etc/hosts -> /data/adb/fcm-hosts/hosts
- Remote hosts from https://miceworld.top/fcm-hosts-next/fcm_dual.hosts
- Localhost protection (127.0.0.1 and ::1)
- Atomic file updates with temp files

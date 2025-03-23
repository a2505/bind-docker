#!/bin/sh
set -e  # 开启“遇到错误退出”模式

# 仅在挂载目录为空时复制默认配置
if [ ! -f /etc/bind/named.conf ]; then
  echo "Initializing /etc/bind from default configuration..."
  cp -a /etc/bind_default/* /etc/bind/
fi

# 以 root 身份修复目录权限
chown -R named:named /etc/bind /var/bind

exec "$@"
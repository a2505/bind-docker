FROM alpine:3.21.3

RUN apk add --no-cache bind bind-dnssec-tools

# 创建配置目录（非挂载路径）
RUN mkdir -p /etc/bind_default

# 复制默认配置文件到非挂载路径
COPY named.conf /etc/bind_default/
COPY named.conf.options /etc/bind_default/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# 声明挂载目录
VOLUME ["/etc/bind", "/var/bind"]
EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/named", "-g", "-u", "named"]
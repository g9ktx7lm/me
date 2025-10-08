#!/bin/bash

hosting="https://raw.githubusercontent.com/g9ktx7lm/me/main/quota"

wget -q -O /usr/sbin/usqu "${hosting}/usqu"
chmod +x /usr/sbin/usqu

#wget -q -O /etc/systemd/system/usqu.service "${hosting}/usqu.service"

cat > /etc/systemd/system/usqu.service <<-EOF
[Unit]
Description=Xray Quota Monitoring Service
Documentation=https://t.me/xdtunnell
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/sbin/usqu
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

systemctl enable usqu
systemctl restart usqu

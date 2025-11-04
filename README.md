# VPS Secure Script

Script otomatis untuk mengamankan VPS secara cepat dengan hanya satu baris perintah.

## Fitur

- Ganti password root (default: `ZeroKu9$`)
- Nonaktifkan login root via SSH
- Hapus SSH key yang tertanam (authorized_keys)
- Bersihkan cron job mencurigakan
- Atur firewall dasar (ufw)
- Hapus user mencurigakan (opsional, bisa kamu atur)

## Cara Pakai (1 Baris Command)

Buka terminal VPS kamu, lalu jalankan:

```bash
bash <(curl -s https://raw.githubusercontent.com/triadzyu/securevps/master/amankan.sh)
```
## Cara Pakai (1 Baris Command)

Buka terminal VPS kamu, lalu jalankan:
```bash
bash <(curl -s https://raw.githubusercontent.com/triadzyu/securevps/master/rootvps.sh)

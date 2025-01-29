```
🚀 Set IP Address di Linux dengan Netplan

Dibuat oleh: Syahrul Ramadhan | [C-Tech.id](https://c-tech.id)
> 🔗 Proyek GitHub: [https://github.com/syahrullrmdhn/set-ip-linux](https://github.com/syahrullrmdhn/set-ip-linux)

---

📝 Tentang Proyek
Skrip ini membantu pengguna mengatur IP Address statis di Linux menggunakan Netplan dengan cara yang mudah dan interaktif.  
Tersedia animasi efek ketikan, emoji, warna, serta validasi otomatis untuk memeriksa path Netplan dan nama interface.  

🎯 Fitur
✅ Interaktif – Pengguna diminta mengisi konfigurasi melalui input CLI  
✅ Cek Path Netplan – Jika path tidak ditemukan, skrip memberi opsi untuk mengubahnya  
✅ Cek Nama Interface – Menyediakan perintah untuk menemukan interface jaringan  
✅ Tampilan Menarik – Menggunakan warna, emoji, dan animasi efek ketikan  
✅ Mudah Digunakan – Tidak perlu mengedit file konfigurasi secara manual  

---

🚀 Cara Menggunakan Skrip
1️⃣ Download Skrip
Clone repository ini atau download skripnya:
```sh
git clone https://github.com/syahrullrmdhn/set-ip-linux.git
cd set-ip-linux
```

2️⃣ Jalankan Skrip
```sh
chmod +x set-ip.sh
sudo ./set-ip.sh
```

3️⃣ Masukkan Detail Konfigurasi
Kamu akan diminta memasukkan informasi berikut:  
- Interface (contoh: `enp0s3`, `eth0`, `wlan0`)  
- IP Address (contoh: `192.168.1.100/24`)  
- Gateway (contoh: `192.168.1.1`)  
- DNS Servers (contoh: `8.8.8.8 8.8.4.4`)  

💡 Note: Jika tidak tahu nama interfacenya, jalankan:
```sh
ip link show
```

---

📌 Contoh Output Skrip
```sh
========================================
       🚀 Set IP Address - C-Tech.id
   Dibuat oleh: Syahrul Ramadhan
========================================

🔍 REMINDER: Pastikan file Netplan sesuai dengan sistem kamu!
📁 Path default: /etc/netplan/00-installer-config.yaml
⚠️ Jika path berbeda, cek dengan perintah: ls /etc/netplan/

🔍 REMINDER: Setiap Linux bisa punya nama interface yang berbeda!
🔹 Cek nama interface dengan perintah: ip link show
🔹 Contoh interface: enp0s3, eth0, wlan0

🖧  Interface (contoh: enp0s3): enp0s3
🌐  IP Address (contoh: 192.168.1.100/24): 192.168.1.100/24
🚪  Gateway (contoh: 192.168.1.1): 192.168.1.1
🔎  DNS Servers (pisahkan dengan spasi, contoh: 8.8.8.8 8.8.4.4): 8.8.8.8 8.8.4.4

⏳ Sedang membuat konfigurasi Netplan di /etc/netplan/00-installer-config.yaml...
✅ Konfigurasi Netplan telah dibuat:
----------------------------------------
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.1.100/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
----------------------------------------

⚙️  Menerapkan konfigurasi Netplan...
🎉 Konfigurasi selesai!
🔗 Cek proyek di: https://github.com/syahrullrmdhn/set-ip-linux
🚀 Dibuat oleh Syahrul Ramadhan | C-Tech.id
```

---

❓ Troubleshooting
🔹 1. File Netplan Tidak Ditemukan
Pesan Error:  
```sh
PERINGATAN: File konfigurasi Netplan tidak ditemukan!
Cek file yang tersedia dengan: ls /etc/netplan/
```
Solusi:  
Jalankan:
```sh
ls /etc/netplan/
```
Jika ada file lain, jalankan skrip lagi dan masukkan path yang benar.  

---

 🔹 2. Interface Tidak Ditemukan
Pesan Error:  
Jika setelah menjalankan `netplan apply` koneksi tidak aktif, mungkin nama interface salah.  
Solusi:  
Jalankan:
```sh
ip link show
```
Pastikan interface yang dimasukkan sesuai dengan yang terdeteksi oleh sistem.  

---

 🔹 3. Tidak Bisa Akses Internet Setelah Mengatur IP Statis
Solusi:  
- Cek apakah IP, Gateway, dan DNS sudah benar.  
- Coba restart jaringan dengan:
```sh
sudo systemctl restart systemd-networkd
```
- Jika masih tidak bisa, ubah konfigurasi Netplan dan jalankan ulang:
```sh
sudo netplan apply
```

---

 📜 Lisensi
Skrip ini tersedia secara open-source di bawah lisensi MIT.  
Silakan gunakan dan modifikasi sesuai kebutuhan! 🎉  

---

 📢 Kontribusi
🔹 Jika ingin berkontribusi atau melaporkan bug, silakan buat issue atau pull request di repository ini.  
🔹 Jangan lupa ⭐ Star repository ini jika skrip ini bermanfaat untukmu!  

🚀 Dibuat dengan ❤️ oleh Syahrul Ramadhan | C-Tech.id  
🔗 GitHub: [https://github.com/syahrullrmdhn/set-ip-linux](https://github.com/syahrullrmdhn/set-ip-linux)  
```

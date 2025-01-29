#!/bin/bash

# Fungsi untuk menampilkan teks dengan efek ketikan
type_text() {
  local text="$1"
  for ((i = 0; i < ${#text}; i++)); do
    echo -n "${text:$i:1}"
    sleep 0.03
  done
  echo ""
}

# Tampilkan banner
clear
echo -e "\e[1;34m========================================\e[0m"
type_text "       🚀 Set IP Address - C-Tech.id"
type_text "   Dibuat oleh: Syahrul Ramadhan"
echo -e "\e[1;34m========================================\e[0m"

# Reminder untuk cek path Netplan
echo -e "\n🔍 \e[1;33mREMINDER:\e[0m Pastikan file Netplan sesuai dengan sistem kamu!"
echo -e "📁 Path default: \e[1;36m/etc/netplan/00-installer-config.yaml\e[0m"
echo -e "⚠️ Jika path berbeda, cek dengan perintah: \e[1;32mls /etc/netplan/\e[0m"

# Path file konfigurasi Netplan (default)
netplan_file="/etc/netplan/00-installer-config.yaml"

# Cek apakah file ada, jika tidak tampilkan warning
if [ ! -f "$netplan_file" ]; then
    echo -e "\n❗ \e[1;31mPERINGATAN:\e[0m File konfigurasi Netplan tidak ditemukan!"
    echo -e "🔹 Cek file yang tersedia dengan: \e[1;32mls /etc/netplan/\e[0m"
    echo -e "🔹 Jika ada file lain, gunakan path yang sesuai!\n"
    read -p "Masukkan path file Netplan yang benar: " netplan_file
fi

# Reminder untuk cek nama interface
echo -e "\n🔍 \e[1;33mREMINDER:\e[0m Setiap Linux bisa punya nama interface yang berbeda!"
echo -e "🔹 Cek nama interface jaringan dengan perintah: \e[1;32mip link show\e[0m"
echo -e "🔹 Contoh interface: \e[1;36menp0s3, eth0, wlan0\e[0m\n"

# Meminta input dari pengguna
echo -e "\n🔹 Masukkan detail konfigurasi jaringan:"
read -p "🖧  Interface (contoh: enp0s3): " interface
read -p "🌐  IP Address (contoh: 192.168.1.100/24): " ip_address
read -p "🚪  Gateway (contoh: 192.168.1.1): " gateway
read -p "🔎  DNS Servers (pisahkan dengan spasi, contoh: 8.8.8.8 8.8.4.4): " dns_servers

# Menampilkan proses pembuatan konfigurasi
echo -e "\n⏳ Sedang membuat konfigurasi Netplan di \e[1;33m$netplan_file\e[0m..."
sleep 1

# Membuat konfigurasi Netplan
sudo bash -c "cat > $netplan_file" <<EOL
network:
  version: 2
  renderer: networkd
  ethernets:
    $interface:
      dhcp4: no
      addresses:
        - $ip_address
      routes:
        - to: default
          via: $gateway
      nameservers:
        addresses:
          - ${dns_servers// / }
EOL

# Menampilkan konfigurasi yang dibuat
echo -e "\n✅ Konfigurasi Netplan telah dibuat:"
echo -e "\e[1;32m----------------------------------------\e[0m"
cat $netplan_file
echo -e "\e[1;32m----------------------------------------\e[0m"

# Menerapkan konfigurasi Netplan dengan animasi
echo -e "\n⚙️  Menerapkan konfigurasi Netplan..."
sleep 1
sudo netplan apply

# Konfirmasi akhir dengan animasi
echo -e "\n🎉 \e[1;32mKonfigurasi selesai!\e[0m"
echo -e "🔗 Cek proyek di: \e[1;34mhttps://github.com/syahrullrmdhn/set-ip-linux\e[0m"
echo -e "\n🚀 \e[1;35mDibuat oleh Syahrul Ramadhan | C-Tech.id\e[0m"

#!/bin/bash
sudo systemctl stop usbguard
sudo apt-get remove --purge -y usbguard
sudo rm /etc/udev/rules.d/99-block-digispark.rules
sudo rm /etc/modprobe.d/block-hid.conf # Ajouté
sudo udevadm control --reload-rules
echo "[+] Sécurités retirées."
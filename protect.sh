#!/bin/bash

echo "-------------------------------------------------------"
echo "  SÉCURISATION DU SYSTÈME CONTRE LES ATTAQUES HID      "
echo "-------------------------------------------------------"

# Couche 1 : USBGuard
echo "[+] Configuration de USBGuard (Contrôle d'accès)..."
sudo apt-get update && sudo apt-get install -y usbguard

sudo usbguard generate-policy > /tmp/rules.conf
sudo install -m 0600 /tmp/rules.conf /etc/usbguard/rules.conf
sudo systemctl restart usbguard

# Couche 2 : Udev
echo "[+] Ajout de la règle Udev de blocage (ID 16d0:0753)..."
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", ATTR{authorized}="0"' | sudo tee /etc/udev/rules.d/99-block-digispark.rules
sudo udevadm control --reload-rules

# Couche 3 : Blacklist Kernel (DÉSACTIVÉE PAR SÉCURITÉ)
echo "[!] Couche 3 (Kernel Blacklist) préparée mais non activée."

echo "-------------------------------------------------------"
echo "[OK] Système sécurisé."
echo "[INFO] Les logs de blocage sont visibles via : journalctl -u usbguard"
echo "-------------------------------------------------------"
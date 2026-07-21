#!/bin/bash
echo "=== Uninstalling SafeSign A3 Token Driver ==="

echo "[*] Removing SafeSign Driver..."
sudo apt-get remove --purge -y safesignidentityclient

echo "[*] Removing legacy libraries (if no other software depends on them)..."
sudo apt-get remove -y libgdbm-compat4t64 libgdk-pixbuf-xlib-2.0-0 libtiff5 libwxbase3.0-0v5 libwxgtk3.0-gtk3-0v5 libwebp6

echo "[*] Removing NSS Database entry for Chrome/Edge..."
REAL_USER=${SUDO_USER:-$USER}
su - "$REAL_USER" -c 'modutil -dbdir sql:$HOME/.pki/nssdb -delete "SafeSign PKCS11" -force 2>/dev/null'

echo "[*] Cleaning up unused dependencies..."
sudo apt-get autoremove -y

echo "=== Uninstallation Complete ==="

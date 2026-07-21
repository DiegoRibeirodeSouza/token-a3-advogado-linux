#!/bin/bash

echo "=== Installing SafeSign A3 Token Driver for Debian 13 ==="

# 1. Install system dependency if available (gdk-pixbuf-xlib and libnss3-tools)
echo "[*] Installing system dependencies..."
sudo apt-get update
sudo apt-get install -y libgdbm-compat4t64 libgdk-pixbuf-xlib-2.0-0 libnss3-tools

# 2. Install legacy libraries from 'libs' folder
echo "[*] Installing legacy libraries..."
cd libs
sudo dpkg -i *.deb
cd ..

# 3. Install the modified driver
echo "[*] Installing SafeSign driver..."
sudo dpkg -i SafeSign-3.8.0-debian13-fixed.deb

# 4. Fix any potential broken dependencies
echo "[*] Checking for missing dependencies..."
sudo apt-get install -f -y

echo "=== Installation Verification ==="
if [ -f "/usr/lib/safesign-private/libaetpkss.so.3" ]; then
    echo "[OK] Driver library found at /usr/lib/safesign-private/libaetpkss.so.3"
    
    echo "[*] Configuring Google Chrome / Edge / Brave (NSS Database)..."
    REAL_USER=${SUDO_USER:-$USER}
    su - "$REAL_USER" -c 'mkdir -p ~/.pki/nssdb && modutil -dbdir sql:$HOME/.pki/nssdb -add "SafeSign PKCS11" -libfile /usr/lib/safesign-private/libaetpkss.so.3 -force 2>/dev/null'
    echo "[OK] Chrome/Edge configured for user: $REAL_USER"
else
    echo "[FAIL] Driver library NOT found!"
fi

echo "[*] Ensuring smartcard service (pcscd) is running..."
sudo systemctl enable --now pcscd

echo "=== Done! ==="
echo "Please restart your PJeOffice using: killall java pjeoffice-pro"

# SafeSign A3 Driver Kit for Debian 13 (Trixie)

This repository contains a complete "kit" to install the G&D StarSign A3 Token (SafeSign) on Debian 13 "Trixie" (and possibly Debian 12/Testing).

## The Problem
The official drivers provided by authorities (built for Ubuntu 22.04) fail to install on modern Debian systems because:
1.  They depend on `libtiff5` and `libwxgtk3.0`, which have been removed from Debian 13.
2.  They conflict with the newer `libgdbm` versions.

## The Solution
This kit includes:
1.  **`libs/`**: A collection of necessary legacy libraries taken from Debian 11/12 repositories (`libtiff5`, `libwxgtk3.0`, `libwebp6`, etc.).
2.  **`SafeSign-3.8.0-debian13-fixed.deb`**: The original driver, patched to accept `libgdbm-compat4t64` instead of the obsolete compatibility layer.

## Installation

1.  Clone this repository:
    ```bash
    git clone https://github.com/DiegoRibeirodeSouza/safesign-debian13.git
    cd safesign-debian13
    ```

2.  Make the script executable:
    ```bash
    chmod +x install.sh
    ```

3.  Run the installer:
    ```bash
    ./install.sh
    ```
    (You will need to enter your sudo password).

## Configuration

For **PJeOffice**, ensure your configuration points to the correct library:
*   File: `~/.pjeoffice-pro/pjeoffice-pro.config`
*   Setting: `list.a3=/usr/lib/libaetpkss.so`

## Disclaimer
SafeSign Identity Client is proprietary software of A.E.T. Europe B.V. This repository is for educational and interoperability purposes only, helping users run the software on their specific operating system.

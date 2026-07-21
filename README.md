# ⚖️ Configuração do Token A3 (SafeSign) para Advogados no Linux

**[English Version Below]**

Este repositório é um "Kit de Sobrevivência" para advogados e usuários de Linux (Debian 13 / Ubuntu 24.04+) que precisam acessar tribunais (PJe, eSAJ) usando o token A3 **G&D StarSign CUT S** (SafeSign).

![Status](https://img.shields.io/badge/status-funcional-green) ![Debian](https://img.shields.io/badge/debian-13-red) ![License](https://img.shields.io/badge/license-MIT-blue)

## 😟 O Problema
Os drivers oficiais (como o do site da autoridade certificadora) geralmente são antigos e não instalam em sistemas Linux modernos porque:
1.  Faltam dependências antigas (`libtiff5`, `libwxgtk3.0`, etc.) que foram removidas do Debian 13.
2.  Existem conflitos com bibliotecas novas (`libgdbm`).

## 🚀 A Solução
Este kit contém tudo o que você precisa em um só lugar:
*   📂 **`libs/`**: Todas as bibliotecas legadas necessárias (resgatadas do Debian 11/12).
*   🔧 **Driver Corrigido**: O arquivo `SafeSign-3.8.0-debian13-fixed.deb` foi modificado para aceitar as bibliotecas modernas do sistema.
*   ⚡ **Script de Instalação**: Faz todo o trabalho sujo para você.

## 📦 Como Instalar

### Método 1: Clonando (Recomendado)
Abra seu terminal e rode:

```bash
# 1. Baixe o kit
git clone https://github.com/DiegoRibeirodeSouza/token-a3-advogado-linux.git
cd token-a3-advogado-linux

# 2. Dê permissão de execução
chmod +x install.sh

# 3. Instale
./install.sh
```

### Método 2: Baixando a Release
1.  Vá em **Releases** aqui no lado direito.
2.  Baixe o arquivo `token-a3-kit-debian13.zip`.
3.  Descompacte, entre na pasta e rode `./install.sh` pelo terminal.

## ⚙️ Configuração no PJeOffice
Após instalar, configure o PJeOffice para usar o driver correto:
1.  Abra o PJeOffice.
2.  Vá em **Configuração de Certificado** (ou PKCS#11).
3.  Aponte para a biblioteca:
    *   `/usr/lib/safesign-private/libaetpkss.so.3`

## 🌐 Configuração para Navegadores (eproc, e-CAC)

Para utilizar o token em portais da web (como **eproc** e **e-CAC da Receita Federal**), o seu navegador precisa estar configurado.

*   **Google Chrome, Edge e Brave:**
    O script de instalação `install.sh` **já configura automaticamente** o banco de dados de segurança desses navegadores. Você só precisa reiniciar o navegador completamente após a instalação (digitando `chrome://restart` na barra de endereços).
*   **Mozilla Firefox:**
    O Firefox precisa ser configurado manualmente.
    1. Abra o Firefox e vá em **Configurações > Privacidade e Segurança**.
    2. Role até o final e clique em **Dispositivos de Segurança...**.
    3. Clique em **Carregar**, dê o nome de "SafeSign" e cole o caminho: `/usr/lib/safesign-private/libaetpkss.so.3`.
    4. Clique em OK e reinicie o Firefox.

---

# 🇬🇧 SafeSign A3 Token Kit for Linux

A complete kit to install G&D StarSign A3 Tokens on modern Debian 13 / Ubuntu systems, resolving dependency hell.

## Includes
*   **Legacy Dependencies**: Pre-packaged `libtiff5`, `wxWidgets`, etc.
*   **Patched Driver**: `SafeSign-3.8.0` modified for Debian 13 compatibility.
*   **Auto-Installer**: Simple `install.sh` script.

## Quick Start
```bash
git clone https://github.com/DiegoRibeirodeSouza/token-a3-advogado-linux.git
cd token-a3-advogado-linux
chmod +x install.sh
./install.sh
```

---
**Disclaimer:** SafeSign is a trademark of A.E.T. Europe B.V. This repository provides compatibility fixes for educational purposes and is not affiliated with the vendor.

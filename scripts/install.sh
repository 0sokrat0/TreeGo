#!/bin/bash
set -e

BIN_NAME="treego"
INSTALL_DIR="/usr/local/bin"
REPO_URL="https://github.com/0sokrat0/TreeGo"

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

# Преобразование архитектуры
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="amd64"
elif [[ "$ARCH" == "aarch64" || "$ARCH" == "armv8" ]]; then
    ARCH="arm64"
else
    echo "❌ Unsupported architecture: $ARCH"
    exit 1
fi

DOWNLOAD_URL="$REPO_URL/releases/latest/download/treego-$OS-$ARCH"

echo "🚀 Installing TreeGo..."
curl -L -o $BIN_NAME $DOWNLOAD_URL
chmod +x $BIN_NAME
sudo mv $BIN_NAME $INSTALL_DIR/

echo "✅ Installed in: $INSTALL_DIR/$BIN_NAME"
echo "🔎 Try running: treego --help"

#!/bin/bash
set -e

BIN_NAME="treego"
REPO_URL="https://github.com/0sokrat0/TreeGo"

# Detect OS and Arch
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/')

# Download URL
DOWNLOAD_URL="$REPO_URL/releases/latest/download/treego-$OS-$ARCH"

echo "🚀 Installing TreeGo..."
curl -L -o $BIN_NAME $DOWNLOAD_URL
chmod +x $BIN_NAME
sudo mv $BIN_NAME /usr/local/bin/

echo "✅ Installed: $(which $BIN_NAME)"
echo "Try: treego --help"
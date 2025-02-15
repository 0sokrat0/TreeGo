$BIN_NAME = "treego.exe"
$INSTALL_DIR = "$env:USERPROFILE\bin"
$URL = "https://github.com/0sokrat0/TreeGo/releases/latest/download/treego-windows-amd64.exe"

Write-Host "🚀 Installing TreeGo..."

# Проверяем наличие curl (если нет, используем Invoke-WebRequest)
if (Get-Command curl -ErrorAction SilentlyContinue) {
    curl -L -o $BIN_NAME $URL
} else {
    Invoke-WebRequest -Uri $URL -OutFile $BIN_NAME
}

# Проверяем, скачался ли файл
if (!(Test-Path $BIN_NAME)) {
    Write-Host "❌ Download failed! Check your internet connection or try again later."
    exit 1
}

# Создаём папку bin, если её нет
if (!(Test-Path -Path $INSTALL_DIR)) {
    New-Item -ItemType Directory -Path $INSTALL_DIR -Force | Out-Null
}

# Перемещаем бинарник
Move-Item -Path $BIN_NAME -Destination "$INSTALL_DIR\$BIN_NAME" -Force

Write-Host "✅ Installed in: $INSTALL_DIR\$BIN_NAME"

# Добавляем в PATH (если нет)
$ENV_PATH = [System.Environment]::GetEnvironmentVariable("Path", "User")
if ($ENV_PATH -notlike "*$INSTALL_DIR*") {
    [System.Environment]::SetEnvironmentVariable("Path", "$INSTALL_DIR;$ENV_PATH", "User")
    Write-Host "✅ Added to PATH: $INSTALL_DIR"
    
    # Применяем изменения в PATH сразу, без перезапуска
    $env:Path += ";$INSTALL_DIR"
} else {
    Write-Host "✅ Already in PATH: $INSTALL_DIR"
}

# Проверяем, работает ли treego
if (Get-Command treego -ErrorAction SilentlyContinue) {
    Write-Host "🎉 Installation successful! Run 'treego --help' to test."
} else {
    Write-Host "⚠️ Installation completed, but you may need to restart PowerShell to apply changes."
}

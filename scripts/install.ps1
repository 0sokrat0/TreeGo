$BIN_NAME = "treego.exe"
$INSTALL_DIR = "$env:USERPROFILE\bin"
$URL = "https://github.com/0sokrat0/TreeGo/releases/latest/download/treego-windows-amd64.exe"

Write-Host "🚀 Installing TreeGo..."
Invoke-WebRequest -Uri $URL -OutFile $BIN_NAME

if (!(Test-Path -Path $INSTALL_DIR)) {
    New-Item -ItemType Directory -Path $INSTALL_DIR -Force | Out-Null
}

Move-Item -Path $BIN_NAME -Destination "$INSTALL_DIR\$BIN_NAME" -Force

Write-Host "✅ Installed in: $INSTALL_DIR\$BIN_NAME"

$ENV_PATH = [System.Environment]::GetEnvironmentVariable("Path", "User")
if ($ENV_PATH -notlike "*$INSTALL_DIR*") {
    [System.Environment]::SetEnvironmentVariable("Path", "$ENV_PATH;$INSTALL_DIR", "User")
    Write-Host "✅ Added to PATH: $INSTALL_DIR (Restart terminal to apply)"
} else {
    Write-Host "✅ Already in PATH: $INSTALL_DIR"
}

Write-Host "🔎 Try running: treego --help"

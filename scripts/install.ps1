$BIN_NAME = "treego.exe"
$INSTALL_DIR = Join-Path $env:USERPROFILE "bin"
$URL = "https://github.com/0sokrat0/TreeGo/releases/latest/download/treego-windows-amd64.exe"

Write-Host "🚀 Starting TreeGo installation..."

if (-not (Test-Path -Path $INSTALL_DIR)) {
    New-Item -ItemType Directory -Path $INSTALL_DIR -Force | Out-Null
    Write-Host "📁 Created installation directory: $INSTALL_DIR"
}

$tempFile = Join-Path $env:TEMP $BIN_NAME

try {
    Write-Host "⏳ Downloading latest release..."
    if (Get-Command curl.exe -ErrorAction SilentlyContinue) {
        curl.exe -L -s -o $tempFile $URL
    }
    else {
        Invoke-WebRequest -Uri $URL -OutFile $tempFile -UseBasicParsing
    }
    
    if (-not (Test-Path -Path $tempFile)) {
        throw "Download failed. File not found: $tempFile"
    }
    Write-Host "✅ Downloaded successfully!"
}
catch {
    Write-Host "❌ Error downloading binary: $_"
    exit 1
}

try {
    Move-Item -Path $tempFile -Destination (Join-Path $INSTALL_DIR $BIN_NAME) -Force
    Write-Host "✅ Binary installed to: $(Join-Path $INSTALL_DIR $BIN_NAME)"
}
catch {
    Write-Host "❌ Error moving binary: $_"
    exit 1
}

$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User')
if ($currentPath -split ';' -notcontains $INSTALL_DIR) {
    try {
        [Environment]::SetEnvironmentVariable('Path', "$INSTALL_DIR;$currentPath", 'User')
        Write-Host "🔧 Added to PATH: $INSTALL_DIR"
        $env:Path = "$INSTALL_DIR;" + $env:Path
    }
    catch {
        Write-Host "❌ Failed to update PATH: $_"
        exit 1
    }
}
else {
    Write-Host "ℹ️ Installation directory already in PATH"
}

try {
    $version = & (Join-Path $INSTALL_DIR $BIN_NAME) --version
    Write-Host "🎉 Successfully installed TreeGo $version"
    Write-Host "`n📌 Usage example:"
    Write-Host "  treego --help"
    Write-Host "  treego ./your-project"
}
catch {
    Write-Host "⚠️ Installation complete, but verification failed!"
    Write-Host "Please try restarting your terminal or run manually:"
    Write-Host "  $((Join-Path $INSTALL_DIR $BIN_NAME)) --help"
}

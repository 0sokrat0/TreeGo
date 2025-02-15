$BIN_NAME = "treego.exe"
$URL = "https://github.com/0sokrat0/TreeGo/releases/latest/download/treego-windows-amd64.exe"

Write-Host "🚀 Installing TreeGo..."
Invoke-WebRequest -Uri $URL -OutFile $BIN_NAME
New-Item -ItemType Directory -Path "$env:USERPROFILE\bin" -Force | Out-Null
Move-Item -Path $BIN_NAME -Destination "$env:USERPROFILE\bin\$BIN_NAME" -Force
Write-Host "✅ Added to PATH: $env:USERPROFILE\bin"
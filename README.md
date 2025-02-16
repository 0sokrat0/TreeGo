## 🌳 **GoTree**

[![Go Version](https://img.shields.io/badge/Go-1.21%2B-blue)](https://golang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Telegram](https://img.shields.io/badge/Telegram-Contact-blue)](https://t.me/SOKRAT_00)

**A project structure visualizer with advanced statistics**  
🚀 **Analyze and visualize your project directory with useful insights!**

---

## ✨ Features

✅ **Colorized directory tree with icons**  
✅ **Counts lines of code, files, and folders**  
✅ **Multithreaded data processing**  
✅ **Supports hidden files (`-hidden`)**  
✅ **Limits recursion depth (`-depth`)**  

---

## ⚙️ Installation

**Requirements**: `Go 1.21+`

### 🏗️ **1. Install via Go (recommended)**
```sh
go install github.com/0sokrat0/TreeGo@latest
```
📌 This installs the latest version directly from the source.

---

### 💾 **2. Install from pre-built binaries**  
If you don’t have Go installed, download a pre-built binary:

#### 🖥️ **Automatic Installation**
Run this command based on your OS:

#### **Linux/macOS:**
```sh
curl -fsSL https://raw.githubusercontent.com/0sokrat0/TreeGo/master/scripts/install.sh | bash
```
### ✅ **Обновлённая инструкция для установки GoTree на Windows (README)**  
Теперь установка **максимально простая** 🚀  

---

## ⚙️ **Installation (Windows)**
### **1️⃣ Automatic Installation (PowerShell)**
Simply run this command in **PowerShell (as Administrator)**:
```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest "https://github.com/0sokrat0/TreeGo/releases/latest/download/treego-windows-amd64.exe" -OutFile "$env:USERPROFILE\bin\treego.exe"
$env:Path += ";$env:USERPROFILE\bin"
```
✅ **Now test it:**
```powershell
treego --help
```
🚀 **GoTree is installed!** 🎉  

---

### **2️⃣ Manual Installation (If PowerShell doesn’t work)**  
1️⃣ **Go to [GoTree Releases](https://github.com/0sokrat0/TreeGo/releases/latest)**  
2️⃣ **Download** `treego-windows-amd64.exe`  
3️⃣ **Rename it to `treego.exe`**  
4️⃣ **Move it to** `C:\Users\YourUser\bin`  
5️⃣ **If the command doesn't work, add to PATH:**
```powershell
[System.Environment]::SetEnvironmentVariable("Path", "$env:USERPROFILE\bin;$env:Path", "User")
```
6️⃣ **Try again:**
```powershell
treego --help
```

---

✅ **Now the Windows installation is as easy as Linux!** 🚀🎉
📌 This automatically downloads and installs the correct binary for your OS.

---

### 📂 **3. Manual Installation**
If the automatic script doesn't work, follow these steps:

1️⃣ **Go to the [latest release](https://github.com/0sokrat0/TreeGo/releases/latest)**  
2️⃣ **Download the correct binary for your OS:**
   - **Linux:** `treego-linux-amd64`
   - **macOS (Apple Silicon):** `treego-macos-arm64`
   - **Windows:** `treego-windows-amd64.exe`
3️⃣ **Move the file to a system-wide location:**  
   - Linux/macOS: `/usr/local/bin/`
   - Windows: `C:\Users\YourUser\bin\`
4️⃣ **Make it executable (Linux/macOS only):**
   ```sh
   chmod +x treego
   ```
5️⃣ **Add to PATH if necessary**  
   - **Windows:**
     ```powershell
     [System.Environment]::SetEnvironmentVariable("Path", "$env:USERPROFILE\bin;$env:Path", "User")
     ```
   - **Linux/macOS:**  
     Add this to `~/.bashrc` or `~/.zshrc`:
     ```sh
     export PATH=$HOME/bin:$PATH
     ```

---

## 🚀 **Usage**

```sh
treego [options]
```

### 🔹 **Examples**
```sh
treego -hidden   # Show hidden files
treego -depth=3  # Limit depth to 3 levels
```

### 📌 **Sample Output**
```
📁 project
 ├── 📁 src
 │   ├── 📄 main.go
 │   ├── 📄 utils.go
 ├── 📁 assets
 │   ├── 📄 icon.png
 ├── 📄 README.md
```

---

## 📚 **Dependencies**
- [`fatih/color`](https://github.com/fatih/color) — Colored terminal output

---

## 🔗 **Contacts**
📬 **Author**: [@SOKRAT_00](https://t.me/SOKRAT_00)  
📂 **Source Code**: [GitHub](https://github.com/0sokrat0/TreeGo)

---

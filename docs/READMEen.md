# 🌳 GoTree

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

### 1️⃣ Install via Go:

```sh
go install github.com/0sokrat0/TreeGo@latest
```

### 2️⃣ Install from pre-built binaries:

#### 🐧 Linux:

```sh
wget https://github.com/0sokrat0/TreeGo/releases/latest/download/treego-linux-amd64 -O treego
chmod +x treego
sudo mv treego /usr/local/bin/
```

#### 🍏 macOS:

```sh
curl -L https://github.com/0sokrat0/TreeGo/releases/latest/download/treego-macos-amd64 -o treego
chmod +x treego
sudo mv treego /usr/local/bin/
```

#### 🖥️ Windows:
Download **`treego.exe`** from the [releases](https://github.com/0sokrat0/TreeGo/releases/latest/).

---

## 🚀 Usage

```sh
treego [options]
```

### 🔹 Examples:
```sh
treego -hidden   # Show hidden files
treego -depth=3  # Limit depth to 3 levels
```

### 📌 Sample Output:

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

## 📚 Dependencies

- [`fatih/color`](https://github.com/fatih/color) — Colored terminal output

---

## 🔗 Contacts

📬 **Author**: [@SOKRAT_00](https://t.me/SOKRAT_00)  
📂 **Source Code**: [GitHub](https://github.com/0sokrat0/TreeGo)

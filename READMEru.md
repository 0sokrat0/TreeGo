# 🌳 GoTree

[![Go Version](https://img.shields.io/badge/Go-1.21%2B-blue)](https://golang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Telegram](https://img.shields.io/badge/Telegram-Contact-blue)](https://t.me/SOKRAT_00)

**Утилита для визуализации структуры проектов с продвинутой статистикой**  
**Project structure visualizer with advanced stats**

---

## ✨ Особенности

✅ **Цветное дерево директорий с иконками**  
✅ **Подсчёт строк кода, файлов и папок**  
✅ **Многопоточная обработка данных**  
✅ **Поддержка скрытых файлов (`-hidden`)**  
✅ **Ограничение глубины рекурсии (`-depth`)**  

---

## ⚙️ Установка

**Требования**: `Go 1.21+`

### 1️⃣ Установка через Go:

```sh
go install github.com/0sokrat0/TreeGo@latest
```

### 2️⃣ Установка бинарника

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
Скачать **`treego.exe`** из [релизов](https://github.com/0sokrat0/TreeGo/releases/latest/).

---

## 🚀 Использование

```sh
treego [опции]
```

### 🔹 Примеры:
```sh
treego -hidden   # Показать скрытые файлы
treego -depth=3  # Ограничить глубину дерева
```

### 📌 Пример вывода:

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

## 📚 Зависимости

- [`fatih/color`](https://github.com/fatih/color) — Цветной вывод в терминале

---

## 🔗 Контакты

📬 **Автор**: [@SOKRAT_00](https://t.me/SOKRAT_00)  
📂 **Исходный код**: [GitHub](https://github.com/0sokrat0/TreeGo)

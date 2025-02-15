## 🌳 GoTree 

[![Go Version](https://img.shields.io/badge/Go-1.21%2B-blue)](https://golang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Telegram](https://img.shields.io/badge/Telegram-Contact-blue)](https://t.me/your_profile)

**Утилита для визуализации структуры проектов с продвинутой статистикой**  
**Project structure visualizer with advanced stats**

---


### ✨ Особенности
- 🎨 Цветное дерево директорий с иконками
- 📊 Подсчёт строк кода, файлов и папок
- ⚡ Многопоточная обработка данных
- 🕵️ Поддержка скрытых файлов (через `-hidden`)
- 📏 Ограничение глубины рекурсии (через `-depth`)

### ⚙️ Установка

#### Требования:
- [Go 1.21+](https://golang.org/dl/)

#### Способ 1: Через Go
```bash
go install github.com/yourusername/gotree@latest
```

#### Способ 2: Скачать бинарник
- **Linux**: 
  ```bash
  wget https://github.com/yourusername/gotree/releases/latest/download/gotree-linux-amd64 -O gotree
  chmod +x gotree
  ```
- **macOS**:
  ```bash
  curl -L https://github.com/yourusername/gotree/releases/latest/download/gotree-macos-amd64 -o gotree
  chmod +x gotree
  ```
- **Windows**:  
  [Скачать .exe](https://github.com/yourusername/gotree/releases/latest)

### 🚀 Использование
```bash
gotree [опции]

# Примеры:
gotree -hidden      # Показать скрытые файлы
gotree -depth=3     # Ограничить глубину
```

### 📚 Зависимости
- [fatih/color](https://github.com/fatih/color) — Цветной вывод

---

## 🇺🇸 English Version

### ✨ Features
- 🎨 Colored directory tree with icons
- 📊 Code lines, files and folders counting
- ⚡ Multithreaded processing
- 🕵️ Hidden files support (via `-hidden`)
- 📏 Recursion depth limit (via `-depth`)

### ⚙️ Installation

#### Requirements:
- [Go 1.21+](https://golang.org/dl/)

#### Method 1: Via Go
```bash
go install github.com/yourusername/gotree@latest
```

#### Method 2: Download Binary
- **Linux**: 
  ```bash
  wget https://github.com/yourusername/gotree/releases/latest/download/gotree-linux-amd64 -O gotree
  chmod +x gotree
  ```
- **macOS**:
  ```bash
  curl -L https://github.com/yourusername/gotree/releases/latest/download/gotree-macos-amd64 -o gotree
  chmod +x gotree
  ```
- **Windows**:  
  [Download .exe](https://github.com/yourusername/gotree/releases/latest)

### 🚀 Usage
```bash
gotree [options]

# Examples:
gotree -hidden      # Show hidden files
gotree -depth=3     # Limit recursion depth
```

### 📚 Dependencies
- [fatih/color](https://github.com/fatih/color) — Colorized output

---

## 📞 Контакты | Contacts
- [💬 Telegram](https://t.me/your_profile)
- [🐙 GitHub Issues](https://github.com/yourusername/gotree/issues)

---

![Demo](demo.gif) <!-- Добавьте реальный gif позже -->
```

Чтобы сделать README полностью готовым:
1. Замените `yourusername` на ваш GitHub логин.
2. Добавьте реальные ссылки на бинарники в релизах.
3. Создайте файл `demo.gif` с демонстрацией работы.
4. Обновите Telegram-ссылку.
# 837LinuxAdmin

**Author:** Se4aMSF  
**Version:** 8.3.7  
**WoW Client:** Battle for Azeroth 8.3.7

## Description
Simple Admin addon for WoW 8.3.7 (Battle for Azeroth) - Based on MoveAnything architecture

## Features

### 🎮 **Core Admin Functions**
- **GM Mode Toggle**: Checkbox to enable/disable Game Master mode
- **Automatic Commands**: Sends `.gm on` when checked, `.gm off` when unchecked
- **Settings Persistence**: GM mode state is saved between sessions

### 🔗 **Item Linkifier System**
- **Automatic [Add] Buttons**: Appears next to item links in chat
- **One-Click Item Addition**: Click [Add] button to execute `.additem <ID>` command
- **Smart Link Detection**: Automatically finds and processes all item links
- **Works in All Chat Frames**: Supports ChatFrame1 through ChatFrame10

### 📚 **Spell Linkifier System**
- **Shift+Click to Learn**: Hold Shift and left-click on spell/mount links
- **Automatic Learning**: Executes `.learn <SpellID>` command
- **Mount Support**: Works with mount links from mount collection
- **Spell Support**: Works with spell links from spellbook

### 🗺️ **User Interface**
- **Minimap Icon**: Gear icon on minimap for easy access
- **Draggable Window**: Main window can be moved around screen
- **Clean Design**: Modern, non-transparent interface
- **Responsive Controls**: Smooth checkbox and button interactions

### ⚡ **Slash Commands**
- `/linuxadmin` or `/la` - Toggle main window
- `/linuxadmin gm` - Toggle GM mode directly
- `/linuxadmin testlink` - Test item and spell linkifier
- `/linuxadmin additem <ID>` - Add specific item to bag
- `/linuxadmin learn <SpellID>` - Learn specific spell

## Installation

1. **Download**: Clone or download this repository
2. **Extract**: Place `837LinuxAdmin` folder in `World of Warcraft/_retail_/Interface/AddOns/`
3. **Restart**: Restart WoW or reload UI (`/reload`)
4. **Access**: Use `/linuxadmin` or click minimap icon

## Usage

### **GM Mode Management**
1. Open interface with `/linuxadmin`
2. Check/uncheck "GM Mode" checkbox
3. Commands are automatically sent to chat

### **Adding Items**
1. Link an item in chat (Shift+Click on item)
2. [Add] button appears next to item link
3. Click [Add] button to add item to bag

### **Learning Spells/Mounts**
1. Link a spell or mount in chat
2. Hold **Shift** and **Left-Click** on the link
3. Spell/mount is automatically learned

### **Interface Navigation**
- **Minimap Icon**: Left-click to open/close window
- **Window**: Drag by any part to move
- **Close Button**: X button in top-right corner

## Technical Details

- **WoW Version**: 8.3.7 (Battle for Azeroth)
- **API Compatibility**: Modern WoW 8.3.7 APIs
- **Architecture**: Based on MoveAnything framework
- **Performance**: Lightweight, minimal impact on FPS
- **Memory Usage**: Low memory footprint

## File Structure

---

# 837LinuxAdmin

**Автор:** Se4aMSF  
**Версия:** 8.3.7  
**Клиент WoW:** Battle for Azeroth 8.3.7

## Описание
Простой админ-аддон для WoW 8.3.7 (Battle for Azeroth) - Основан на архитектуре MoveAnything

## Возможности

### 🎮 **Основные админ-функции**
- **Переключатель режима GM**: Чекбокс для включения/выключения режима Game Master
- **Автоматические команды**: Отправляет `.gm on` при включении, `.gm off` при выключении
- **Сохранение настроек**: Состояние GM режима сохраняется между сессиями

### 🔗 **Система линков предметов**
- **Автоматические кнопки [Add]**: Появляются рядом со ссылками на предметы в чате
- **Добавление предметов одним кликом**: Нажмите кнопку [Add] для выполнения команды `.additem <ID>`
- **Умное обнаружение ссылок**: Автоматически находит и обрабатывает все ссылки на предметы
- **Работает во всех чат-фреймах**: Поддерживает ChatFrame1 через ChatFrame10

### 📚 **Система линков заклинаний**
- **Shift+клик для изучения**: Удерживайте Shift и левый клик по ссылкам на заклинания/маунты
- **Автоматическое изучение**: Выполняет команду `.learn <SpellID>`
- **Поддержка маунтов**: Работает со ссылками на маунты из коллекции
- **Поддержка заклинаний**: Работает со ссылками на заклинания из книги заклинаний

### 🗺️ **Пользовательский интерфейс**
- **Иконка на миникарте**: Иконка шестеренки на миникарте для легкого доступа
- **Перемещаемое окно**: Главное окно можно перемещать по экрану
- **Чистый дизайн**: Современный, непрозрачный интерфейс
- **Отзывчивые элементы управления**: Плавные взаимодействия с чекбоксами и кнопками

### ⚡ **Слэш-команды**
- `/linuxadmin` или `/la` - Переключение главного окна
- `/linuxadmin gm` - Прямое переключение GM режима
- `/linuxadmin testlink` - Тест линков предметов и заклинаний
- `/linuxadmin additem <ID>` - Добавление конкретного предмета в сумку
- `/linuxadmin learn <SpellID>` - Изучение конкретного заклинания

## Установка

1. **Скачивание**: Клонируйте или скачайте этот репозиторий
2. **Извлечение**: Поместите папку `837LinuxAdmin` в `World of Warcraft/_retail_/Interface/AddOns/`
3. **Перезапуск**: Перезапустите WoW или перезагрузите UI (`/reload`)
4. **Доступ**: Используйте `/linuxadmin` или нажмите на иконку миникарты

## Использование

### **Управление GM режимом**
1. Откройте интерфейс командой `/linuxadmin`
2. Поставьте/снимите галочку "GM Mode"
3. Команды автоматически отправляются в чат

### **Добавление предметов**
1. Ссылка на предмет в чате (Shift+клик по предмету)
2. Кнопка [Add] появляется рядом со ссылкой на предмет
3. Нажмите кнопку [Add] для добавления предмета в сумку

### **Изучение заклинаний/маунтов**
1. Ссылка на заклинание или маунт в чате
2. Удерживайте **Shift** и **Левый клик** по ссылке
3. Заклинание/маунт автоматически изучается

### **Навигация по интерфейсу**
- **Иконка миникарты**: Левый клик для открытия/закрытия окна
- **Окно**: Перетаскивайте за любую часть для перемещения
- **Кнопка закрытия**: Кнопка X в правом верхнем углу

## Технические детали

- **Версия WoW**: 8.3.7 (Battle for Azeroth)
- **Совместимость API**: Современные API WoW 8.3.7
- **Архитектура**: Основана на фреймворке MoveAnything
- **Производительность**: Легковесный, минимальное влияние на FPS
- **Использование памяти**: Низкое потребление памяти

## Структура файлов

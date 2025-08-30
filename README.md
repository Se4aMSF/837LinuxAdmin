# 837LinuxAdmin

**Author:** Se4aMSF  
**Version:** 8.3.7  
**WoW Client:** Battle for Azeroth 8.3.7

## Description
Simple Admin addon for WoW 8.3.7 (Battle for Azeroth) - Based on MoveAnything architecture

## Features
- GM Mode toggle (.gm on/off)
- Item linkifier with [Add] buttons
- Spell linkifier with Shift+Click to learn
- Minimap icon
- Clean, modern interface

## Commands
- `/linuxadmin` or `/la` - toggle window
- `/linuxadmin gm` - toggle GM mode
- `/linuxadmin testlink` - test item and spell linkifier

## Installation
1. Copy `837LinuxAdmin` folder to `World of Warcraft/_retail_/Interface/AddOns/`
2. Restart WoW or reload UI
3. Use `/linuxadmin` to open the interface

## License
GPLv3

Простой аддон для администратора WoW 8.3.7 (Battle for Azeroth)

## Описание

837LinuxAdmin - это простой аддон, созданный на основе архитектуры MoveAnything для управления базовыми GM командами.

## Функции

- **GM Mode Checkbox**: Галочка для включения/выключения GM режима
- **Автоматические команды**: При установке галочки отправляется `.gm on`, при снятии `.gm off`
- **Простой интерфейс**: Одно окно с минимальным функционалом
- **Современная архитектура**: Использует современные WoW API

## Установка

1. Скопируйте папку `837LinuxAdmin` в `World of Warcraft/_retail_/Interface/AddOns/`
2. Перезапустите WoW
3. Аддон автоматически загрузится

## Использование

### Команды чата:
- `/linuxadmin` или `/la` - открыть/закрыть окно
- `/linuxadmin gm` - переключить GM режим

### Интерфейс:
- **Галочка "GM Mode"**: 
  - ✅ Включена = отправляется команда `.gm on`
  - ❌ Выключена = отправляется команда `.gm off`
- **Перетаскивание**: Окно можно перемещать мышью
- **Закрытие**: Кнопка "X" в правом верхнем углу

## Технические детали

- **Версия WoW**: 8.3.7 (Battle for Azeroth)
- **Архитектура**: Основана на MoveAnything
- **Сохранение настроек**: Состояние галочки сохраняется между сессиями
- **Совместимость**: Только WoW 8.3.7

## Автор

Linux

## Лицензия

GPLv3

﻿
#language: ru

@tree
@SmokeTest

Функциональность: Дымовые тесты - Регистры накопления - ФормаСписка
# Конфигурация: Управление холдингом, редакция 3.2
# Версия: 3.2.9.68

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Я закрыл все окна клиентского приложения

Сценарий: Открытие формы списка регистра накопления "Операции бюджетов" (ОперацииБюджетов)

	Дано Я открываю основную форму списка регистра накопления "ОперацииБюджетов"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка регистра накопления ОперацииБюджетов"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка регистра накопления ОперацииБюджетов"
	И Я закрываю текущее окно

Сценарий: Открытие формы списка регистра накопления "Планирование потребностей" (ПланированиеПотребностей)

	Дано Я открываю основную форму списка регистра накопления "ПланированиеПотребностей"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка регистра накопления ПланированиеПотребностей"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка регистра накопления ПланированиеПотребностей"
	И Я закрываю текущее окно

﻿
#language: ru

@tree
@SmokeTest

Функциональность: Дымовые тесты - Планы видов характеристик - ФормаСписка
# Конфигурация: Управление холдингом, редакция 3.3
# Версия: 3.3.1.85

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Я закрыл все окна клиентского приложения

Сценарий: Открытие формы списка плана видов характеристик "Виды бюджетов" (ВидыБюджетов)

	Дано Я открываю основную форму списка плана видов характеристик "ВидыБюджетов"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ВидыБюджетов"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ВидыБюджетов"
	И Я закрываю текущее окно

Сценарий: Открытие формы списка плана видов характеристик "Виды контроля документов" (ВидыКонтроляДокументов)

	Дано Я открываю основную форму списка плана видов характеристик "ВидыКонтроляДокументов"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ВидыКонтроляДокументов"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ВидыКонтроляДокументов"
	И Я закрываю текущее окно

Сценарий: Открытие формы списка плана видов характеристик "Виды аналитик (корпоративные)" (ВидыСубконтоКорпоративные)

	Дано Я открываю основную форму списка плана видов характеристик "ВидыСубконтоКорпоративные"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ВидыСубконтоКорпоративные"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ВидыСубконтоКорпоративные"
	И Я закрываю текущее окно

Сценарий: Открытие формы списка плана видов характеристик "Дополнительные реквизиты и сведения" (ДополнительныеРеквизитыИСведения)

	Дано Я открываю основную форму списка плана видов характеристик "ДополнительныеРеквизитыИСведения"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ДополнительныеРеквизитыИСведения"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ДополнительныеРеквизитыИСведения"
	И Я закрываю текущее окно

Сценарий: Открытие формы списка плана видов характеристик "Объекты адресации задач" (ОбъектыАдресацииЗадач)

	Дано Я открываю основную форму списка плана видов характеристик "ОбъектыАдресацииЗадач"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ОбъектыАдресацииЗадач"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть форму списка плана видов характеристик ОбъектыАдресацииЗадач"
	И Я закрываю текущее окно

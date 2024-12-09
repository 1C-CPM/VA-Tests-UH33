﻿
#language: ru

@tree
@SmokeTest

Функциональность: Дымовые тесты - Планы счетов - ФормаОбъекта
# Конфигурация: Управление холдингом, редакция 3.2
# Версия: 3.2.9.68

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Я закрыл все окна клиентского приложения

Сценарий: Открытие формы плана счетов "План счетов МСФО" (МСФО)

	Дано Я открываю основную форму плана счетов "МСФО"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму плана счетов МСФО"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму плана счетов МСФО"
	И Я закрываю текущее окно

Сценарий: Открытие формы плана счетов "План счетов бухгалтерского учета" (Хозрасчетный)

	Дано Я открываю основную форму плана счетов "Хозрасчетный"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму плана счетов Хозрасчетный"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму плана счетов Хозрасчетный"
	И Я закрываю текущее окно

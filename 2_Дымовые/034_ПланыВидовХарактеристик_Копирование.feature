﻿
#language: ru

@tree
@SmokeTest

Функциональность: Дымовые тесты - Планы видов характеристик - Копирование
# Конфигурация: Управление холдингом, редакция 3.3
# Версия: 3.3.1.85

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Я закрыл все окна клиентского приложения

Сценарий: Копирование элемента плана видов характеристик "Виды аналитик (корпоративные)" (ВидыСубконтоКорпоративные)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	ПланВидовХарактеристик.ВидыСубконтоКорпоративные КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И НЕ ТекДанныеИсточник.Предопределенный");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Создаем новый элемент копированием
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаСкопировать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаСкопировать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось скопировать существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось скопировать существующий элемент плана видов характеристик ВидыСубконтоКорпоративные"
				И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Записываем новый элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать новый элемент плана видов характеристик ВидыСубконтоКорпоративные"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать новый элемент плана видов характеристик ВидыСубконтоКорпоративные"

Сценарий: Копирование элемента плана видов характеристик "Дополнительные реквизиты и сведения" (ДополнительныеРеквизитыИСведения)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	ПланВидовХарактеристик.ДополнительныеРеквизитыИСведения КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И НЕ ТекДанныеИсточник.Предопределенный");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик ДополнительныеРеквизитыИСведения"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент плана видов характеристик ДополнительныеРеквизитыИСведения"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Создаем новый элемент копированием
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаСкопировать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаСкопировать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось скопировать существующий элемент плана видов характеристик ДополнительныеРеквизитыИСведения"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось скопировать существующий элемент плана видов характеристик ДополнительныеРеквизитыИСведения"
				И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Записываем новый элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать новый элемент плана видов характеристик ДополнительныеРеквизитыИСведения"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать новый элемент плана видов характеристик ДополнительныеРеквизитыИСведения"

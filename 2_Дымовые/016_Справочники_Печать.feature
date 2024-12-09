﻿
#language: ru

@tree
@SmokeTest

Функциональность: Дымовые тесты - Справочники - Печать
# Конфигурация: Управление холдингом, редакция 3.2
# Версия: 3.2.9.68

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Я закрыл все окна клиентского приложения

Сценарий: Печать элемента справочника "Договоры" (ДоговорыКонтрагентов)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Справочник.ДоговорыКонтрагентов КАК ТекДанныеИсточник
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника ДоговорыКонтрагентов"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника ДоговорыКонтрагентов"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Вывод на печать формы "Договор"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_Договор' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_Договор'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Договор"" справочника ДоговорыКонтрагентов
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Договор"" справочника ДоговорыКонтрагентов
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Конверт"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_Конверт' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_Конверт'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Конверт"" справочника ДоговорыКонтрагентов
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Конверт"" справочника ДоговорыКонтрагентов
				Тогда открылось окно '*'
				И Я закрываю окно '*'

Сценарий: Печать элемента справочника "Контрагенты" (Контрагенты)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Справочник.Контрагенты КАК ТекДанныеИсточник
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Контрагенты"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Контрагенты"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Вывод на печать формы "Конверт"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_Конверт' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_Конверт'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Конверт"" справочника Контрагенты
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Конверт"" справочника Контрагенты
				Тогда открылось окно '*'
				И Я закрываю окно '*'

Сценарий: Печать элемента справочника "Номенклатура" (Номенклатура)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Справочник.Номенклатура КАК ТекДанныеИсточник
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Номенклатура"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Номенклатура"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Вывод на печать формы "Этикетка"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_Ценники' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_Ценники'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Этикетка"" справочника Номенклатура
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Этикетка"" справочника Номенклатура
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Ценник"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_Ценники' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_Ценники'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Ценник"" справочника Номенклатура
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Ценник"" справочника Номенклатура
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Спецификация"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_Спецификация' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_Спецификация'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Спецификация"" справочника Номенклатура
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Спецификация"" справочника Номенклатура
				Тогда открылось окно '*'
				И Я закрываю окно '*'

Сценарий: Печать элемента справочника "Организационные единицы" (Организации)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Справочник.Организации КАК ТекДанныеИсточник
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Организации"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Организации"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

Сценарий: Печать элемента справочника "Основные средства" (ОсновныеСредства)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Справочник.ОсновныеСредства КАК ТекДанныеИсточник
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника ОсновныеСредства"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника ОсновныеСредства"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Вывод на печать формы "Инвентарная карточка ОС (ОС-6)"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ОС6' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ОС6'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Инвентарная карточка ОС (ОС-6)"" справочника ОсновныеСредства
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Инвентарная карточка ОС (ОС-6)"" справочника ОсновныеСредства
				Тогда открылось окно '*'
				И Я закрываю окно '*'

Сценарий: Печать элемента справочника "Сотрудники" (Сотрудники)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Справочник.Сотрудники КАК ТекДанныеИсточник
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
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Сотрудники"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Сотрудники"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Вывод на печать формы "Личная карточка (Т-2)"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ПФ_MXL_Т2' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ПФ_MXL_Т2'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Личная карточка (Т-2)"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Личная карточка (Т-2)"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Трудовой договор (микропредприятий)"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ПФ_MXL_ТрудовойДоговорМикропредприятий' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ПФ_MXL_ТрудовойДоговорМикропредприятий'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Трудовой договор (микропредприятий)"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Трудовой договор (микропредприятий)"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Приказ о приеме"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ПФ_MXL_Т1' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ПФ_MXL_Т1'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Приказ о приеме"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Приказ о приеме"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Приказ о переводе"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ПФ_MXL_Т5' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ПФ_MXL_Т5'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Приказ о переводе"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Приказ о переводе"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Приказ об увольнении"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ПФ_MXL_Т8' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ПФ_MXL_Т8'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Приказ об увольнении"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Приказ об увольнении"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Справка для пособия по безработице"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ПФ_MXL_СправкаОСреднемЗаработке2023' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ПФ_MXL_СправкаОСреднемЗаработке2023'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Справка для пособия по безработице"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Справка для пособия по безработице"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Справка о доходах для доплаты детям-сиротам"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ПФ_MXL_СправкаОДоходахДетямСиротамДляНазначенияДоплаты' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ПФ_MXL_СправкаОДоходахДетямСиротамДляНазначенияДоплаты'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Справка о доходах для доплаты детям-сиротам"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Справка о доходах для доплаты детям-сиротам"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Карточка учета страховых взносов"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_КарточкаУчетаПоСтраховымВзносам' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_КарточкаУчетаПоСтраховымВзносам'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Карточка учета страховых взносов"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Карточка учета страховых взносов"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Регистр налогового учета по НДФЛ"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_ПечатьРегистрНалоговогоУчетаПоНДФЛПоСотруднику' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_ПечатьРегистрНалоговогоУчетаПоНДФЛПоСотруднику'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Регистр налогового учета по НДФЛ"" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Регистр налогового учета по НДФЛ"" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

		* Вывод на печать формы "Согласие на обработку ПДн..."
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_СогласиеНаОбработкуПерсональныхДанных' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_СогласиеНаОбработкуПерсональныхДанных'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Согласие на обработку ПДн..."" справочника Сотрудники
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Согласие на обработку ПДн..."" справочника Сотрудники
				Тогда открылось окно '*'
				И Я закрываю окно '*'

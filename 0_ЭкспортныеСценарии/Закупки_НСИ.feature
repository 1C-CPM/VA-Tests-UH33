﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild
 
Функционал: Экспортные сценарии

Как бизнес-аналитик я хочу
упростить создание спрвочников и документов
чтобы упростить поддержку сценарных тестов

Сценарий: Я создаю НоваяОрганизация "ТекНаименование", ИНН = "ТекИНН", КПП = "ТекКПП", ОГРН = "ТекОГРН", дата регистрации = "ТекДатаРегистрации"

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Организационные единицы'
		Тогда открылось окно 'Организационные единицы'
		
		И я нажимаю на кнопку с именем 'СоздатьНовуюОрганизацию'
		Тогда открылось окно 'Тип организации'
		И я нажимаю на кнопку с именем 'ВыбратьРФ'
		Тогда открылось окно 'Вид организации'
		И я нажимаю на кнопку с именем 'ВыбратьЮЛ'
		Тогда открылось окно 'Юридическое лицо'
		И я нажимаю на кнопку с именем 'СистемаНалогообложенияОбщаяЮЛ'
		
		И в поле с именем 'НаименованиеСокращенное' я ввожу текст '[ТекНаименование]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'ИНН' я ввожу текст '[ТекИНН]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'КПП' я ввожу текст '[ТекКПП]'
		И я перехожу к следующему реквизиту
		И в поле 'ОГРН' я ввожу текст '[ТекОГРН]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'ДатаРегистрации' я ввожу текст '[ТекДатаРегистрации]'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку 'Записать'
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна '[ТекНаименование] *' в течение 20 секунд

		И я закрываю все окна клиентского приложения

Сценарий: Я создаю НоваяОрганизация223 "ТекНаименование", ИНН = "ТекИНН", КПП = "ТекКПП", ОГРН = "ТекОГРН", дата регистрации = "ТекДатаРегистрации"

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Организационные единицы'
		Тогда открылось окно 'Организационные единицы'
		
		И я нажимаю на кнопку с именем 'СоздатьНовуюОрганизацию'
		Тогда открылось окно 'Тип организации'
		И я нажимаю на кнопку с именем 'ВыбратьРФ'
		Тогда открылось окно 'Вид организации'
		И я нажимаю на кнопку с именем 'ВыбратьЮЛ'
		Тогда открылось окно 'Юридическое лицо'
		И я нажимаю на кнопку с именем 'СистемаНалогообложенияОбщаяЮЛ'
		
		И в поле с именем 'НаименованиеСокращенное' я ввожу текст '[ТекНаименование]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'ИНН' я ввожу текст '[ТекИНН]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'КПП' я ввожу текст '[ТекКПП]'
		И я перехожу к следующему реквизиту
		И в поле 'ОГРН' я ввожу текст '[ТекОГРН]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'ДатаРегистрации' я ввожу текст '[ТекДатаРегистрации]'
		И я перехожу к следующему реквизиту
		И я устанавливаю флаг 'Учет закупок по 223-ФЗ'
		И из выпадающего списка "Сумма малых закупок" я выбираю точное значение '500 000'
		И я нажимаю на кнопку 'Записать'
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна '[ТекНаименование] *' в течение 20 секунд

		И я закрываю все окна клиентского приложения

Сценарий: Я создаю НоваяОрганизацияИП "ТекФамилия", Имя = "ТекИмя", ИНН = "ТекИНН", ОГРНИП = "ТекОГРНИП", дата регистрации = "ТекДатаРегистрации"

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Организационные единицы'
		Тогда открылось окно 'Организационные единицы'

		И я нажимаю на кнопку с именем 'СоздатьНовуюОрганизацию'
		Тогда открылось окно 'Тип организации'
		И я нажимаю на кнопку с именем 'ВыбратьРФ'
		Тогда открылось окно 'Вид организации'
		И я нажимаю на кнопку с именем 'ВыбратьИП'
		Тогда открылось окно 'Индивидуальный предприниматель'
		И я нажимаю на кнопку с именем 'СистемаНалогообложенияНалогНаПрофессиональныйДоходИП'
		
		И из выпадающего списка с именем "СтатусФизическогоЛица" я выбираю точное значение 'Самозанятый'
		И из выпадающего списка с именем "СтатусФизическогоЛица" я выбираю точное значение 'Индивидуальный предприниматель'
		
		И в поле 'Фамилия' я ввожу текст '[ТекФамилия]'
		И в поле 'Имя' я ввожу текст '[ТекИмя]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'ИНН' я ввожу текст '[ТекИНН]'
		И я перехожу к следующему реквизиту
		И в поле 'ОГРНИП' я ввожу текст '[ТекОГРНИП]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'ДатаРегистрации' я ввожу текст '[ТекДатаРегистрации]'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку 'Записать'
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Организационная единица*' в течение 20 секунд

		И я закрываю все окна клиентского приложения

Сценарий: Я создаю НовоеЦФО "ТекНаименование", Группа = "ТекГруппа"

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Организационные единицы'
		Тогда открылось окно 'Организационные единицы'
		
		И я нажимаю на кнопку с именем 'СоздатьНовуюОрганизацию'
		Тогда открылось окно 'Тип организации'
		И я нажимаю на кнопку с именем 'ВыбратьЦФО'
		Тогда открылось окно 'Организационная единица (создание)'
		И в поле с именем 'НаименованиеСокращенное' я ввожу текст '[ТекНаименование]'
		И я перехожу к следующему реквизиту

		И я разворачиваю группу "Параметры регламента по умолчанию"
		И я нажимаю кнопку выбора у поля "Консолидирующая организация"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' | 
			| '[ТекГруппа]' | 
		И в таблице "Список" я выбираю текущую строку
		
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Организационная единица *' в течение 20 секунд

		И я закрываю все окна клиентского приложения

Сценарий: Я создаю Склад "ТекСклад"

		И В командном интерфейсе я выбираю 'Справочники' 'Склады'
		Тогда открылось окно 'Склады'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Склад (создание)'
		И в поле 'Наименование' я ввожу текст '[ТекСклад]'
		И я нажимаю кнопку выбора у поля "Тип цен"
		Тогда открылось окно 'Типы цен номенклатуры'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'  | 'Валюта' |
			| 'Цена поставки' | 'RUB'    |
		И в таблице "Список" я выбираю текущую строку
		И я нажимаю на кнопку 'Записать и закрыть'

		И я закрываю все окна клиентского приложения

Сценарий: Я устанавливаю УстановкаЦенНоменклатуры "ТекНоменклатура", цена = "ТекЦена"

		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'      |
			| '[ТекНоменклатура]' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		
		И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '[ТекЦена]'
		И в таблице "Товары" я завершаю редактирование строки

Сценарий: Я создаю ОКПД2 "ТекКод", Наименование = "ТекНаименование"

		Дано Я открываю основную форму списка справочника 'КлассификаторОКПД2'
		Тогда открылось окно "Классификатор ОКПД2"
								
		И я нажимаю на кнопку с именем 'СоздатьОКПД2'
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button1'
		Тогда открылось окно "Классификатор ОКПД2 (создание)"
		И в поле с именем 'Код' я ввожу текст '[ТекКод]'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Наименование' я ввожу текст '[ТекНаименование]'
		И в поле с именем 'НаименованиеПолное' я ввожу текст '[ТекНаименование]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Классификатор ОКПД2 (создание) *" в течение 20 секунд

		И я закрываю окно "Классификатор ОКПД2"
		
Сценарий: Я создаю Аналитику "ТекНаименование", Значение1 = "ТекЗначение1", Значение2 = "ТекЗначение2", Значение3 = "ТекЗначение3"

		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Виды аналитик (корпоративные) (создание)"

		И в поле с именем 'Наименование' я ввожу текст '[ТекНаименование]'
		И в таблице 'ТабличноеПолеРеквизиты' я перехожу к строке:
			| "Ключ" | "Макет" | "Реквизит"     |
			| "Нет"  | "Нет"   | "Наименование" |
		И в таблице 'ТабличноеПолеРеквизиты' я активизирую поле с именем 'ТаблицаРеквизитовКлюч'
		И в таблице 'ТабличноеПолеРеквизиты' я изменяю флаг с именем 'ТаблицаРеквизитовКлюч'
		И в таблице 'ТабличноеПолеРеквизиты' я завершаю редактирование строки
		
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно "[ТекНаименование] (Виды аналитик (корпоративные))"
		И В текущем окне я нажимаю кнопку командного интерфейса "Произвольный классификатор"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Произвольный классификатор (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[ТекЗначение1]'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно "[ТекЗначение1] (Произвольный классификатор)"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

		Тогда открылось окно "[ТекНаименование] (Виды аналитик (корпоративные))"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Произвольный классификатор (создание)"
		И в поле с именем 'Наименование' я ввожу текст "[ТекЗначение2]"
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно "[ТекЗначение2] (Произвольный классификатор)"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		
		Тогда открылось окно "[ТекНаименование] (Виды аналитик (корпоративные))"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Произвольный классификатор (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[ТекЗначение3]'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно "[ТекЗначение3] (Произвольный классификатор)"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

		И В текущем окне я нажимаю кнопку командного интерфейса "Значения аналитик по умолчанию"

		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Значения аналитик по умолчанию (создание)"
		И я нажимаю кнопку выбора у поля с именем 'ЗначениеПоУмолчанию'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"   |
			| '[ТекЗначение1]' |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Значения аналитик по умолчанию (создание)"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Значения аналитик по умолчанию (создание)" в течение 20 секунд
		Тогда открылось окно "[ТекНаименование] (Виды аналитик (корпоративные))"
		И Я закрываю окно "[ТекНаименование] (Виды аналитик (корпоративные))"

Сценарий: Я добавляю Статью БДДС в ТЧ "ТекТЧ", Статья = "ТекСтатья", А1 = "ТекА1", А2 = "ТекА2", А3 = "ТекА3", А4 = "ТекА4", А5 = "ТекА5", А6 = "ТекА6"

		* Статья БДДС

//		И в таблице '[ТекТЧ]' я активизирую поле 'Статья БДДС'
//		И в таблице '[ТекТЧ]' я выбираю текущую строку
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита 'Статья БДДС'
		//И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаНоменклатураСтатьяБюджета'
		Тогда открылось окно "Статьи движения денежных средств"
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование'  |
			| '[ТекСтатья]'   |
		И в таблице 'Список' я выбираю текущую строку
	
		* Аналитика1

//		И я перехожу к следующему реквизиту
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитика1'
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитика1'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА1]'      |
		И в таблице 'Список' я выбираю текущую строку

		* Аналитика2

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитика2'
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитика2'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА2]'      |
		И в таблице 'Список' я выбираю текущую строку

		* Аналитика3

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитика3'
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитика3'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА3]'      |
		И в таблице 'Список' я выбираю текущую строку

		* Аналитика4

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитика4'
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитика4'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА4]'      |
		И в таблице 'Список' я выбираю текущую строку

		* Аналитика5

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитика5'
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитика5'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА5]'      |
		И в таблице 'Список' я выбираю текущую строку

		* Аналитика6

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитика6'
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитика6'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА6]'      |
		И в таблице 'Список' я выбираю текущую строку

Сценарий: Я добавляю Статью БДР в ТЧ "ТекТЧ", Статья = "ТекСтатья", А1 = "ТекА1", А2 = "ТекА2", А3 = "ТекА3", А4 = "ТекА4", А5 = "ТекА5", А6 = "ТекА6"

		* Статья БДР

		И я делаю 2 раз
	//		И в таблице '[ТекТЧ]' я активизирую поле 'Статья БДР'
	//		И в таблице '[ТекТЧ]' я выбираю текущую строку
			И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита 'Статья БДР'
			Тогда открылось окно "Статьи доходов и расходов"
			И я нажимаю на кнопку с именем 'ФормаСписок'
			И в таблице 'Список' я перехожу к строке:
				| "Наименование" |
				| '[ТекСтатья]'  |
			И в таблице 'Список' я выбираю текущую строку

		* Аналитика1 

//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитикаБДР1'
//		И в таблице '[ТекТЧ]' я выбираю текущую строку
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитикаБДР1'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА1]'      |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице '[ТекТЧ]' я завершаю редактирование строки

		* Аналитика2 

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитикаБДР2'
//		И в таблице '[ТекТЧ]' я выбираю текущую строку
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитикаБДР2'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА2]'      |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице '[ТекТЧ]' я завершаю редактирование строки

		* Аналитика3 

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитикаБДР3'
//		И в таблице '[ТекТЧ]' я выбираю текущую строку
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитикаБДР3'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА3]'      |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице '[ТекТЧ]' я завершаю редактирование строки

		* Аналитика4 

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитикаБДР4'
//		И в таблице '[ТекТЧ]' я выбираю текущую строку
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитикаБДР4'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА4]'      |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице '[ТекТЧ]' я завершаю редактирование строки

		* Аналитика5 

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитикаБДР5'
//		И в таблице '[ТекТЧ]' я выбираю текущую строку
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитикаБДР5'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА5]'      |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице '[ТекТЧ]' я завершаю редактирование строки

		* Аналитика6 

//		И в таблице '[ТекТЧ]' я перехожу к следующей ячейке
//		И в таблице '[ТекТЧ]' я активизирую поле с именем 'ПланыДокументаАналитикаБДР6'
//		И в таблице '[ТекТЧ]' я выбираю текущую строку
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаАналитикаБДР6'
		Тогда открылось окно "Произвольный классификатор"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекА6]'      |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице '[ТекТЧ]' я завершаю редактирование строки

Сценарий: Я добавляю Номенклатуру в ТЧ ="ТекТЧ", Номенклатура = "ТекНоменклатура", ЦФО = "ТекЦФО", МестоПоставки = "ТекМестоПоставки", ДатаПоставки = "ТекДатаПоставки", Колво = "ТекКолво", Цена = "ТекЦена", СтавкаНДС = "ТекСтавка", Проект = "ТекПроект"

	* Номенклатура

		И в таблице '[ТекТЧ]' я нажимаю на кнопку с именем 'НоменклатураДобавить'
		И в таблице '[ТекТЧ]' я выбираю текущую строку

//		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем "НоменклатураНоменклатура"
//		Тогда открылось окно 'Выбор типа данных'
//		И в таблице "TypeTree" я перехожу к строке:
//			| 'Колонка1'           |
//			| 'Номенклатура'       |
//		И в таблице "TypeTree" я выбираю текущую строку
//		Тогда открылось окно 'Номенклатура'

		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураНоменклатура'
		Тогда открылось окно 'Номенклатура'
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование'      |
			| '[ТекНоменклатура]' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Строка плана закупок (создание) *'

	* ЦФО
		
		И я перехожу к следующему реквизиту
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем "НоменклатураЦФО"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| '[ТекЦФО]'                 |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Строка плана закупок (создание) *'
		
	* Место поставки
		
		И в таблице '[ТекТЧ]' я активизирую поле с именем "НоменклатураМестоПоставки"
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем "НоменклатураМестоПоставки"
		Тогда открылось окно 'Места поставки товаров (оказания услуг)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'       |
			| '[ТекМестоПоставки]' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Строка плана закупок (создание) *'

//	* Период
//
//		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураПериодПотребности'
//		И я нажимаю на кнопку с именем 'ФормаСписок'
//		И в таблице 'Список' я перехожу к строке:
//			| "Наименование" |
//			| "Март 2025 г." |
//		И в таблице 'Список' я выбираю текущую строку
//		И я перехожу к следующему реквизиту
	
	* Дата поставки

		И в таблице '[ТекТЧ]' в поле с именем 'НоменклатураДатаПоставки' я ввожу текст '[ТекДатаПоставки]'
		И я перехожу к следующему реквизиту

	* Количество

		И в таблице '[ТекТЧ]' в поле с именем 'НоменклатураКоличество' я ввожу текст '[ТекКолво]'

	* Ставка НДС
		
		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураСтавкаНДС'
		И в таблице '[ТекТЧ]' из выпадающего списка с именем 'НоменклатураСтавкаНДС' я выбираю по строке '[ТекСтавкаНДС]'
		И я перехожу к следующему реквизиту

	* Цена

		И в таблице '[ТекТЧ]' в поле с именем 'НоменклатураЦена' я ввожу текст '[ТекЦена]'
		И я перехожу к следующему реквизиту

	* Проект

		И в таблице '[ТекТЧ]' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураПроект'
		Тогда открылось окно "Проекты и этапы"
		И в таблице 'Список' я перехожу к строке:
			| 'Наименование' |
			| '[ТекПроект]'  |
		И в таблице 'Список' я выбираю текущую строку
		И я перехожу к следующему реквизиту
		
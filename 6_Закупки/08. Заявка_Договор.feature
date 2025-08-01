﻿#language: ru
@tree

@UH33_Purchases

Функционал: 08. Проверка добавления потребности из заявки в договор

	СПЗ (многолетняя) - ЛОТ - Протокол - ПТУ

Контекст:

	И я подключаю TestClient "УХ - Закупки" логин "МенеджерПоЗакупкам1" пароль ""
	И я закрыл все окна клиентского приложения

Сценарий: 08.00. Ограниченные права: инициализация

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоЕРПУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ВерсияУправлениеХолдингом()' в переменную "$$ВерсияУХ$$"
	И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "$$ТекущаяДата$$"	
	
Сценарий: 08.01. [ЗАЯВКА -> ДОГОВОР] Заявка на обеспечение Королевство Гор и Долин

	* Запоминаем текущую дату + 30 дней
		
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата()+30*24*60*60)' в переменную "ТекущаяДата30"

	* Открываем список заявок на обеспечение
	
		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Заявки на обеспечение'
		Тогда открылось окно 'Заявки на обеспечение'
		
	* Создаем документ	
	
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Заявка на обеспечение (создание)'
		
	* Организация	
	
		И я нажимаю кнопку выбора у поля с именем "Организация"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Скал'         |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на обеспечение (создание) *'
		
	* ЦФО	
		
		И я нажимаю кнопку выбора у поля с именем "ЦФО"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'ЦФО2 Королевство Скал'    |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на обеспечение (создание) *'

	* Проект
	
		И я нажимаю кнопку выбора у поля с именем "Проект"
		Тогда открылось окно 'Проекты и этапы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Проект2'      |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на обеспечение (создание) *'
		
	* Дата поставки	
		
		И я устанавливаю флаг с именем 'ЕдинаяДатаОперации'
		И в поле с именем 'ДатаОперации' я ввожу текст "22.07.2025"
		И я перехожу к следующему реквизиту
//		И в поле с именем 'ДатаОперации' я ввожу значение переменной "ТекущаяДата30"

	* Место поставки	
		
		И я устанавливаю флаг с именем 'ЕдиноеМестоПоставки'
		И я нажимаю кнопку выбора у поля с именем "МестоПоставки"
		Тогда открылось окно 'Места поставки товаров (оказания услуг)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'   |
			| 'МестоПоставки2' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на обеспечение (создание) *'

	* Закладка потребности
	
		И я перехожу к закладке с именем "Потребности"
		
	* Фиксируем тип Номенклатура	
	
		И в таблице "ПланыДокумента" я нажимаю на кнопку с именем 'ПланыДокументаЗафиксироватьТипНоменклатуры'
		Тогда открылось окно 'Выбор типа номенклатуры'
		И в таблице "" я перехожу к строке:
			| 'Колонка1'           |
			| 'Товарные категории' |
		И в таблице "" я перехожу к строке:
			| 'Колонка1'     |
			| 'Номенклатура' |
		И в таблице "" я выбираю текущую строку
		Тогда открылось окно 'Заявка на обеспечение (создание) *'

	* Товар5 
	
		И в таблице "ПланыДокумента" я нажимаю на кнопку с именем 'ПланыДокументаДобавить'
		И в таблице "ПланыДокумента" я нажимаю кнопку выбора у реквизита с именем "ПланыДокументаНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'| '% НДС' | 'Единица'  |
			| 'Товар5'      | '20%'   | 'шт'       |
		И в таблице "Список" я выбираю текущую строку
		И я перехожу к следующему реквизиту
		И в таблице "ПланыДокумента" я активизирую поле с именем "ПланыДокументаКоличество"
		И в таблице "ПланыДокумента" в поле с именем 'ПланыДокументаКоличество' я ввожу текст '22,000'
		И я перехожу к следующему реквизиту		
		И в таблице "ПланыДокумента" я завершаю редактирование строки

	* Условия оплаты

		И в таблице 'ПланыДокумента' я нажимаю кнопку выбора у реквизита с именем 'ПланыДокументаУсловиеОплаты'
		Тогда открылось окно "Условия оплаты"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"          |
			| "Аванс 100% за 10 к.д." |
		И в таблице 'Список' я выбираю текущую строку
		И в таблице "ПланыДокумента" я завершаю редактирование строки

	* Статьи БДДС и БДР

		И Я добавляю Статью БДДС в ТЧ "ПланыДокумента", Статья = "Статья БДДС 1", А1 = "AAA1", А2 = "BBB1", А3 = "CCC1", А4 = "DDD1", А5 = "EEE1", А6 = "FFF1"
		И Я добавляю Статью БДР в ТЧ "ПланыДокумента", Статья = "Статья БДР 1", А1 = "XXX1", А2 = "YYY1", А3 = "ZZZ1", А4 = "SSS1", А5 = "RRR1", А6 = "WWW1"

	* Проводим и закрываем открытые формы 
	
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно 'Заявка на обеспечение *'
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Заявка на обеспечение * от *' в течение 20 секунд
		Тогда открылось окно 'Заявки на обеспечение'
		И Я закрываю окно 'Заявки на обеспечение'

Сценарий: 08.02. [ЗАЯВКА -> ДОГОВОР] Договор ДД5 Королевство Гор и Долин

	* Переменные ТекущаяДата, КонецСледующегоГода
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И Я запоминаю значение выражения 'СокрЛП(КонецГода(ТекущаяДата()+365*24*60*60))' в переменную "КонецСледующегоГода"
		
	* Открываем список договоров

		И В командном интерфейсе я выбираю 'Управление обязательствами' 'Договоры'
		Тогда открылось окно 'Договоры'
		
	* Создаем договор
	
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Выберите вид договора'
		И в таблице "ВидыДоговоров" я перехожу к строке:
			| 'Вид договора'  |
			| 'С поставщиком' |
		И в таблице "ВидыДоговоров" я выбираю текущую строку
		Тогда открылось окно 'С поставщиком (создание)'
		
	* Номер и Дата
	
		И в поле с именем 'Номер' я ввожу текст 'ДД5'
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'Дата' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		
	* Организация
	
		И я нажимаю кнопку выбора у поля с именем "Организация"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Скал'         |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'С поставщиком (создание) *'
		
	* Поставщик6	
		
		И я нажимаю кнопку выбора у поля с именем "Контрагент"
		Тогда открылось окно 'Контрагенты'

		И я нажимаю на кнопку с именем 'ФормаСписок'
		
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Поставщик6'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'С поставщиком (создание) *'
	
	* Срок действия договора
		
		И в поле с именем 'НачалоДействия' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'СрокДействия' я ввожу значение переменной "КонецСледующегоГода"
		И я перехожу к следующему реквизиту
	
	* Сумма, валюта, ставка ндс
	
		И из выпадающего списка с именем "ВалютаВзаиморасчетов" я выбираю точное значение 'RUB'
		И в поле с именем 'СуммаДоговора' я ввожу текст '550 000,00'
		И я перехожу к следующему реквизиту
		И я меняю значение переключателя с именем 'СуммаВключаетНДС' на "В сумме"
		И из выпадающего списка с именем "СтавкаНДС" я выбираю точное значение '20%'

	* Условия оплаты
		
		И я перехожу к закладке с именем "ГруппаРасчеты"
		И я нажимаю кнопку выбора у поля с именем "УсловиеОплаты"
		Тогда открылось окно 'Условия оплаты'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                                       |
			| 'Аванс 50% за 30 к.д., Постоплата 50% через 30 к.д.' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'С поставщиком (создание) *'
		
	* Использование графика 
	
		И я перехожу к закладке с именем "СтраницаАналитикиПланирования"
		И я меняю значение переключателя с именем 'ГрафикДоговора' на 'Поставок и расчетов'
	
	* Подбирем потребность из заявок
	
		И я перехожу к закладке с именем "СтраницаПланЗакупок"
		И в таблице 'Номенклатура' я нажимаю на кнопку с именем 'НоменклатураПодборПотребностей'
		Тогда открылось окно "Форма выбора потребностей"
		И в таблице 'СписокПотребностей' я выделяю все строки
		И в таблице "СписокПотребностей" я нажимаю на кнопку с именем 'СписокПотребностейПеренестиПотребность'
		И я нажимаю на кнопку с именем 'ФормаОтправитьИЗакрыть'

	* Проверяем подобранные данные

		Тогда таблица 'Номенклатура' стала равной:
				| 'Цена'      | 'Единица измерения' |  'Номенклатура' | 'Количество' | 'Место поставки' | 'Дата поставки' | 'ЦФО'                   | 'Ставка НДС' | 'Сумма без НДС' | 'Сумма НДС' | 'Сумма с НДС' | 'Проект'  | 'Статья БДДС'   | 'Статья БДР'   |
				| '25 000,00' | 'шт'                |  'Товар5'       | '22,000'     | 'МестоПоставки2' | '22.07.2025'    | 'ЦФО2 Королевство Скал' | '20%'        | '458 333,33'    | '91 666,67' | '550 000,00'  | 'Проект2' | 'Статья БДДС 1' | 'Статья БДР 1' |

	* Дописываем страны

		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураСтраныПроисхождения'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "С поставщиком (создание) *"
		И в таблице 'Номенклатура' я завершаю редактирование строки

		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураСтранаПроизводителя'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "С поставщиком (создание) *"
		И в таблице 'Номенклатура' я завершаю редактирование строки

	* Заполняем график расчетов

		Когда открылось окно "С поставщиком (создание) *"
		И я перехожу к закладке с именем 'ГруппаГрафик'
		И в таблице 'ГрафикРасчетов' я нажимаю на кнопку с именем 'ГрафикРассчитатьПоГрафикуПоставок'

	* Записываем договор 

		И я нажимаю на кнопку с именем 'ФормаЗаписать'

	* Добавляем товар вручную 
	
		И в таблице 'Номенклатура' я нажимаю на кнопку с именем 'НоменклатураДобавить'

		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураНоменклатура'
		Тогда открылось окно "Выбор типа данных"
		И в таблице '' я перехожу к строке:
			| "Колонка1"     |
			| "Номенклатура" |
		И в таблице '' я выбираю текущую строку
		Тогда открылось окно "Номенклатура"
		И в таблице 'Список' я перехожу к строке:
			| "% НДС" | "Единица" | "Наименование" |
			| "20%"   | "л"       | "Топливо1"     |
		И в таблице 'Список' я выбираю текущую строку
//		Тогда открылось окно "ДД5 от * (С поставщиком) вер. * от * *"
//		И в таблице 'Номенклатура' я завершаю редактирование строки

//		И в таблице 'Номенклатура' я активизирую поле с именем 'НоменклатураХарактеристика'
//		И в таблице 'Номенклатура' я выбираю текущую строку
		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураХарактеристика'
		Тогда открылось окно "Характеристики номенклатуры"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "АИ-95"        |
		И в таблице 'Список' я выбираю текущую строку
//		Тогда открылось окно "ДД5 от * (С поставщиком) вер. * от * *"
//		И в таблице 'Номенклатура' я завершаю редактирование строки
//		И в таблице 'Номенклатура' я выбираю текущую строку
		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураОрганизация'
		Тогда открылось окно "Организационные единицы"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование в программе" |
			| "ЦФО2 Королевство Скал"    |
		И в таблице 'Список' я выбираю текущую строку
//		Тогда открылось окно "ДД5 от * (С поставщиком) вер. * от * *"
//		И в таблице 'Номенклатура' я завершаю редактирование строки

		//И в таблице 'Номенклатура' я активизирую поле с именем 'НоменклатураМестоПоставки'
		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураМестоПоставки'
		Тогда открылось окно "Места поставки товаров (оказания услуг)"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"   |
			| "МестоПоставки2" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "ДД5 от * (С поставщиком) вер. * от * *"
		И в таблице 'Номенклатура' я завершаю редактирование строки
			
//		И в таблице 'Номенклатура' я активизирую поле с именем 'НоменклатураДатаПоставки'
//		И в таблице 'Номенклатура' я выбираю текущую строку
		И в таблице 'Номенклатура' в поле с именем 'НоменклатураДатаПоставки' я ввожу текст "31.07.2025"
		И я перехожу к следующему реквизиту
//		И в таблице 'Номенклатура' я завершаю редактирование строки

//		И в таблице 'Номенклатура' я выбираю текущую строку
		И в таблице 'Номенклатура' в поле с именем 'НоменклатураЦена' я ввожу текст "59,00"
		И я перехожу к следующему реквизиту
//		И в таблице 'Номенклатура' я завершаю редактирование строки

//		И в таблице 'Номенклатура' я активизирую поле с именем 'НоменклатураКоличество'
//		И в таблице 'Номенклатура' я выбираю текущую строку
		И в таблице 'Номенклатура' в поле с именем 'НоменклатураКоличество' я ввожу текст "100,000"
		И я перехожу к следующему реквизиту
//		И в таблице 'Номенклатура' я завершаю редактирование строки

		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураСтраныПроисхождения'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице 'Номенклатура' я завершаю редактирование строки

		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураСтранаПроизводителя'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице 'Номенклатура' я завершаю редактирование строки

		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураПроект'
		Тогда открылось окно "Проекты и этапы"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "Проект2"      |
		И в таблице 'Список' я выбираю текущую строку
//		И в таблице 'Номенклатура' я завершаю редактирование строки

		И Я добавляю Статью БДДС в ТЧ "Номенклатура", Статья = "Статья БДДС 1", А1 = "AAA1", А2 = "BBB1", А3 = "CCC1", А4 = "DDD1", А5 = "EEE1", А6 = "FFF1"
		И Я добавляю Статью БДР в ТЧ "Номенклатура", Статья = "Статья БДР 1", А1 = "XXX1", А2 = "YYY1", А3 = "ZZZ1", А4 = "SSS1", А5 = "RRR1", А6 = "WWW1"

	* Пересчитываем график расчетов и проводим

		И я перехожу к закладке с именем 'ГруппаГрафик'
		И в таблице 'ГрафикРасчетов' я нажимаю на кнопку с именем 'ГрафикРассчитатьПоГрафикуПоставок'

	* Записываем и закрываем
	
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'
			
		Тогда открылось окно "ДД5 от * (С поставщиком) вер. * от *"
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна "ДД5 от * (С поставщиком) вер. * от *" в течение 20 секунд

		Тогда открылось окно 'Договоры'
		И Я закрываю окно 'Договоры'
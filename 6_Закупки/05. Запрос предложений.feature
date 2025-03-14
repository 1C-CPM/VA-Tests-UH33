﻿#language: ru
@tree

@UH33_Purchases

Функционал: 04. Под профилем "Корпоративные закупки"

	Как бизнес-аналитик я хочу
	проверить создание документов подситемы и закрытие регистров
	чтобы исключить ошибки

Контекст:

	И я подключаю TestClient "УХ - Закупки" логин "МенеджерПоЗакупкам1" пароль ""
	И я закрыл все окна клиентского приложения

Сценарий: 04.00. Ограниченные права: инициализация

	//И я закрываю TestClient "УХ - Закупки"

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоЕРПУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ВерсияУправлениеХолдингом()' в переменную "$$ВерсияУХ$$"
	И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "$$ТекущаяДата$$"	

Сценарий: 04.02. [ЗАПРОС ПРЕДЛОЖЕНИЙ] СПЗ 2

	* Запоминаем ТекущаяДата, НачалоГода, КонецГода
		
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И Я запоминаю значение выражения 'СокрЛП(НачалоГода(ТекущаяДата()))' в переменную "НачалоГода"
		И Я запоминаю значение выражения 'СокрЛП(КонецГода(ТекущаяДата()))' в переменную "КонецГода"

	* Открываем список СПЗ
	
		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Строки планов закупок'
		Тогда открылось окно 'Строки планов закупок'
	
	* Создаем СПЗ
	
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Строка плана закупок (создание)'
		
	* Период закупок
	
		И я нажимаю кнопку выбора у поля с именем "ПериодЗакупок"
		Тогда открылось окно 'Периоды'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| '2025 г.'      |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Строка плана закупок (создание)'
	
	* Способ выбора	
	
		И я нажимаю кнопку выбора у поля с именем "СпособВыбораПоставщика"
		И из выпадающего списка с именем "СпособВыбораПоставщика" я выбираю точное значение 'Запрос предложений'
		
	* Заказчик	
	
		И я нажимаю кнопку выбора у поля с именем "ОрганизацияДляЗаключенияДоговора"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Севера [223]' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Строка плана закупок (создание) *'
	
	* ОрганизаторЗакупки	
	
		И я нажимаю кнопку выбора у поля с именем "ОрганизаторЗакупки"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Семь королевств'          |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Строка плана закупок (создание) *'
	
	* Вариант оплаты	
	
		И я нажимаю кнопку выбора у поля с именем "ВариантОплаты"
		Тогда открылось окно 'Условия оплаты'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                                       |
			| 'Аванс 50% за 30 к.д., Постоплата 50% через 30 к.д.' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Строка плана закупок (создание) *'
		
	* Валюта закупок	
		
		И из выпадающего списка с именем "ВалютаДокумента" я выбираю точное значение 'RUB'
		
	* Предмет договора	
		
		И я нажимаю кнопку выбора у поля с именем "ПредметДоговора"
		Тогда открылось окно 'Предмет договора'
		И в поле с именем 'InputFld' я ввожу текст 'Приобретение материалов, тест 2'
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно 'Строка плана закупок (создание) *'
	
	* Общие требования
	
		И я перехожу к следующему реквизиту
		И я нажимаю кнопку выбора у поля с именем "ОбщиеТребования"
		Тогда открылось окно 'Общие требования'
		И в поле с именем 'InputFld' я ввожу текст 'Нет, тест 2'
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно 'Строка плана закупок (создание) *'
		
	* Даты 
	
		И в поле с именем 'ДатаНачалаПодготовкиЗакупки' я ввожу значение переменной "НачалоГода"
		И я перехожу к следующему реквизиту
		И в поле с именем 'ДатаОфициальногоОбъявленияЗакупки' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле с именем 'ДатаИсполненияДоговора' я ввожу значение переменной "КонецГода"
		И я перехожу к следующему реквизиту
		
	* Закладка ЕИС
	
		И я перехожу к закладке с именем "ГруппаЕИС"
		И в поле с именем 'ПорядокФормированияЦеныДоговора' я ввожу текст 'Цена включает НДС'
	
	* Закладка Потребности
	
		И я перехожу к закладке с именем "ГруппаПотребности"

//	* Материал 2
//
//		И в таблице "Номенклатура" я нажимаю на кнопку с именем 'НоменклатураДобавить'
//		И в таблице "Номенклатура" я выбираю текущую строку
//
//		И в таблице "Номенклатура" я нажимаю кнопку выбора у реквизита с именем "НоменклатураНоменклатура"
//		Тогда открылось окно 'Выбор типа данных'
//		И в таблице "TypeTree" я перехожу к строке:
//			| 'Колонка1'           |
//			| 'Номенклатура'       |
//		И в таблице "TypeTree" я выбираю текущую строку
//		Тогда открылось окно 'Номенклатура'
//	
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование' |
//			| 'Материал2'    |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Строка плана закупок (создание) *'
//
//	* Потребитель
//		
//		И я перехожу к следующему реквизиту
//		И в таблице "Номенклатура" я нажимаю кнопку выбора у реквизита с именем "НоменклатураЦФО"
//		Тогда открылось окно 'Организационные единицы'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Королевство Севера [223]' |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Строка плана закупок (создание) *'
//		
//	* Место поставки
//		
//		И в таблице "Номенклатура" я активизирую поле с именем "НоменклатураМестоПоставки"
//		И в таблице "Номенклатура" я нажимаю кнопку выбора у реквизита с именем "НоменклатураМестоПоставки"
//		Тогда открылось окно 'Места поставки товаров (оказания услуг)'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование'   |
//			| 'МестоПоставки1' |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Строка плана закупок (создание) *'
//
//	* Период
//
//		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураПериодПотребности'
//		И я нажимаю на кнопку с именем 'ФормаСписок'
//		И в таблице 'Список' я перехожу к строке:
//			| "Наименование" |
//			| "Март 2025 г." |
//		И в таблице 'Список' я выбираю текущую строку
//		И я перехожу к следующему реквизиту
//	
//	* Дата поставки
//
//		И в таблице 'Номенклатура' в поле с именем 'НоменклатураДатаПоставки' я ввожу текст "25.03.2025"
//		И я перехожу к следующему реквизиту
//
//	* Количество
//
//		И в таблице 'Номенклатура' в поле с именем 'НоменклатураКоличество' я ввожу текст "100"
//
//	* Ставка НДС
//		
//		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураСтавкаНДС'
//		И в таблице 'Номенклатура' из выпадающего списка с именем 'НоменклатураСтавкаНДС' я выбираю по строке "20%"
//		И я перехожу к следующему реквизиту
//
//	* Цена
//
//		И в таблице 'Номенклатура' в поле с именем 'НоменклатураЦена' я ввожу текст "1 200,00"
//		И я перехожу к следующему реквизиту
//
//	* Проект
//
//		И в таблице 'Номенклатура' я нажимаю кнопку выбора у реквизита с именем 'НоменклатураПроект'
//		Тогда открылось окно "Проекты и этапы"
//		И в таблице 'Список' я перехожу к строке:
//			| "Наименование" |
//			| "Проект1"      |
//		И в таблице 'Список' я выбираю текущую строку

	* Номенклатура1

		И Я добавляю Номенклатуру в ТЧ ="Номенклатура", Номенклатура = "Материал2", ЦФО = "Королевство Севера [223]", МестоПоставки = "МестоПоставки1", ДатаПоставки = "25.03.2025", Колво = "100", Цена = "1 200,00", СтавкаНДС = "20%", Проект = "Проект1"
		И Я добавляю Статью БДДС в ТЧ "Номенклатура", Статья = "Статья БДДС 1", А1 = "AAA1", А2 = "BBB1", А3 = "CCC1", А4 = "DDD1", А5 = "EEE1", А6 = "FFF1"
		И Я добавляю Статью БДР в ТЧ "Номенклатура", Статья = "Статья БДР 1", А1 = "XXX1", А2 = "YYY1", А3 = "ZZZ1", А4 = "SSS1", А5 = "RRR1", А6 = "WWW1"

	* Номенклатура2

		И Я добавляю Номенклатуру в ТЧ ="Номенклатура", Номенклатура = "Материал3", ЦФО = "Королевство Севера [223]", МестоПоставки = "МестоПоставки3", ДатаПоставки = "18.05.2025", Колво = "150", Цена = "1 500,00", СтавкаНДС = "20%", Проект = "Проект1"
		И Я добавляю Статью БДДС в ТЧ "Номенклатура", Статья = "Статья БДДС 1", А1 = "AAA1", А2 = "BBB1", А3 = "CCC1", А4 = "DDD1", А5 = "EEE1", А6 = "FFF1"
		И Я добавляю Статью БДР в ТЧ "Номенклатура", Статья = "Статья БДР 1", А1 = "XXX1", А2 = "YYY1", А3 = "ZZZ1", А4 = "SSS1", А5 = "RRR1", А6 = "WWW1"


	* Товар2		

		И я заполняю таблицу "Номенклатура" данными
			| 'Статья БДДС'   | 'Единица измерения' | 'Аналитика 4' | 'Потребитель (ЦФО)'        | 'Номенклатура' | 'Дата поставки' | 'Количество' | 'Место поставки' | 'Коэффициент' | 'Период потребности' | 'Ставка НДС' | 'Аналитика 5' | 'Проект'  | 'Аналитика 1' | 'Аналитика 2' | 'Аналитика 3' | 'НМЦ'      | 'Аналитика 6' | 'Статья БДР'   |
			| 'Статья БДДС 1' | 'т'                 | 'SSS1'        | 'Королевство Севера [223]' | 'Материал1'    | '25.03.2025'    | '100,000'    | 'МестоПоставки1' | '1,00000000'  | 'Март 2025 г.'       | '20%'        | 'RRR1'        | 'Проект1' | 'XXX1'        | 'YYY1'        | 'ZZZ1'        | '1 200,00' | 'WWW1'        | 'Статья БДР 1' |
//
//		И я заполняю таблицу "Номенклатура" данными
//			 | 'Потребитель (ЦФО)'        | 'Дата поставки' | 'Количество' | 'Место поставки' | 'Период потребности' | 'Цена первоначальная' | 'Аналитика 5' | 'Проект'  |
//			 | 'Королевство Севера [223]' | '25.03.2025'    | '100,000'    | 'МестоПоставки1' | 'Март 2025 г.'       | '1 300,00'            | 'RRR1'        | 'Проект1' |

	* Пересчитаем сумму
	
		И я нажимаю на кнопку с именем 'ОбновитьИтогиВШапке'
	
	* Запись документа
	
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно 'Строка плана закупок * от *'
		И из выпадающего списка с именем "СтатусОбъекта" я выбираю точное значение 'Утвержден'

		Если открылось окно '1С:Предприятие' Тогда
			И я нажимаю на кнопку с именем 'Button0'
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Строка плана закупок * от *' в течение 20 секунд

Сценарий: 04.05. [ЗАПРОС ПРЕДЛОЖЕНИЙ] Закупочная процедура 2 / попозиционная
//
//	* Создаем процедуру
//	
//		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Строки планов закупок'
//		Тогда открылось окно 'Строки планов закупок'
//		И в таблице "Список" я перехожу к строке:
//			| 'Валюта' | 'Заказчик'                 | 'Организатор'     |'Период закупок' | 'Предмет договора'                | 'Состояние' | 'Способ закупки'     | 'Статус'    | 'Сумма'      |
//			| 'RUB'    | 'Королевство Севера [223]' | 'Семь королевств' |'2024 г.'        | 'Приобретение материалов, тест 2' | 'Утвержден' | 'Запрос предложений' | 'Утвержден' | '410 000,00' |
//	
//		И я нажимаю на кнопку с именем 'ФормаСправочникЗакупочныеПроцедурыПолучитьСоздатьЗакупочнуюПроцедуру'
//		Тогда открылось окно 'Закупочная процедура №*'
//		
//	* Приказ о назначении закупочной комиссии
//	
//		И я нажимаю кнопку выбора у поля с именем "ПриказОНазначенииЗакупочнойКомиссии"
//		Тогда открылось окно 'Приказы закупочной комиссии'
//		И в таблице "Список" я перехожу к строке:
//			| 'Номер приказа' |
//			| '000000001'     |
//		И в таблице "Список" я выбираю текущую строку
//	
//	* Расписание процедуры
//	
//		И я нажимаю на гиперссылку с именем "СвязанноеМероприятие"
//		Тогда открылось окно 'Стадии закупочной процедуры'
//		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//		И я жду закрытия окна 'Стадии закупочной процедуры' в течение 20 секунд
//		Тогда открылось окно 'Закупочная процедура №*'
//		
//	* Лот 
//	
//		И я перехожу к закладке с именем "ГруппаЛоты"
//		И в таблице "Лоты" я перехожу к первой строке
//		И в таблице "Лоты" я выбираю текущую строку
//		Тогда открылось окно 'Лоты * от *'
//		
//		И из выпадающего списка с именем "ВидЗакупкиОсновнаяВкладка" я выбираю точное значение 'Попозиционная закупка'
//		И из выпадающего списка с именем "МетодОценкиПредложенийПоставщиков" я выбираю точное значение 'По ценам'
//
//		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//		И я жду закрытия окна 'Лоты * от *' в течение 20 секунд
//		Тогда открылось окно 'Закупочная процедура №*'
//		
//	* Условия
//	
//		И я перехожу к закладке с именем "ГруппаУсловияЗакупки"
//		
//		И в поле с именем 'ПояснениеУсловияПоставки' я ввожу текст 'Пояснение условий'
//		И в поле с именем 'ОписаниеГрафикаПоставки' я ввожу текст 'Описание графика'
//		И в поле с именем 'ПорядокПредоставления' я ввожу текст 'Порядок предоставления докментации'
//		И из выпадающего списка с именем "УсловияПоставкиИнкотермс" я выбираю точное значение 'FAS'
//		И я нажимаю кнопку выбора у поля с именем "УсловиеОплаты"
//		Тогда открылось окно 'Условия оплаты'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование'                                       |
//			| 'Аванс 50% за 30 к.д., Постоплата 50% через 30 к.д.' |
//		И в таблице "Список" я выбираю текущую строку
//
//		Если появилось предупреждение в течение 10 секунд тогда
//			И я нажимаю на кнопку с именем 'Button0'
//
//		Тогда открылось окно 'Закупочная процедура №*'
//
//	* Источник финансирования
//	
//		И я нажимаю кнопку выбора у поля с именем "ИсточникФинансирования"
//		Тогда открылось окно 'Источники финансирования'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование'               |
//			| 'Собственное финансирование' |
//		И в таблице "Список" я выбираю текущую строку
//		
//	* Записываем документ	
//		
//		И я нажимаю на кнопку с именем 'ФормаЗаписать'
//		И из выпадающего списка с именем "СтатусОбъекта" я выбираю точное значение 'Утвержден'
//
//		Если появилось предупреждение в течение 10 секунд тогда
//			И я нажимаю на кнопку с именем 'Button0'
//
//	* Закладка лоты
//
//		И я перехожу к закладке с именем "ГруппаЛоты"
//		И Пауза 5
//		И в таблице "Лоты" я перехожу к строке:
//			| 'Период закупок' | 'Вид закупки'           | 'Заказчик'                 | 'Метод оценки' | 'Предмет договора'                | 'НМЦ'             |
//			| '2024 г.'        | 'Попозиционная закупка' | 'Королевство Севера [223]' | 'По ценам'     | 'Приобретение материалов, тест 2' | '410 000,00, RUB' |
//	
//	* Предложение участника 1
//	
//		И в таблице "Лоты" я нажимаю на кнопку с именем 'ЛотыДокументПредложениеПоставщикаСоздатьНаОсновании'
//		Тогда открылось окно 'Предложение участника (создание)'
//		
//		И я нажимаю кнопку выбора у поля с именем "КонтрагентБезОтбора"
//		Тогда открылось окно 'Контрагенты'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Поставщики'               |
//		И в таблице  "Список" я перехожу на один уровень вниз
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Поставщик3'               |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Предложение участника (создание) *'
//		
//		И я перехожу к закладке с именем "ГруппаСтраницаУсловия"
//		
//		И в поле с именем 'УсловияПоставки' я ввожу текст 'Условия 1'
//		И в поле с именем 'СрокиВыполненияДоговора' я ввожу текст 'Сроки выполнения 1'
//		И я перехожу к следующему реквизиту
//		И в поле с именем 'СрокПоставки' я ввожу текст '3'
//		
//		И я нажимаю кнопку выбора у поля с именем "УсловиеОплаты"
//		Тогда открылось окно 'Условия оплаты'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование'                                       |
//			| 'Аванс 50% за 30 к.д., Постоплата 50% через 30 к.д.' |
//		И в таблице "Список" я выбираю текущую строку
//		
//		Если появилось предупреждение в течение 10 секунд тогда
//			И я нажимаю на кнопку с именем 'Button0'
//
//		Тогда открылось окно 'Предложение участника (создание) *'
//		
//		И я перехожу к закладке с именем "ГруппаСтаницаНоменклатура"
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я активизирую поле с именем "УсловияПоНоменклатуреПоПериодамЦена"
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я выбираю текущую строку
//		И в таблице "УсловияПоНоменклатуреПоПериодам" в поле с именем 'УсловияПоНоменклатуреПоПериодамЦена' я ввожу текст '1 250,00'
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я завершаю редактирование строки
//		
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я перехожу к строке:
//			| 'Место поставки' | 'Номенклатура' | 'Сумма с НДС' | 'Товар не поставляется' |
//			| 'МестоПоставки1' | 'Материал3'    | '150 000,00'  | 'Нет'                   |
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я активизирую поле с именем "УсловияПоНоменклатуреПоПериодамТоварНеПоставляется"
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я устанавливаю флаг с именем 'УсловияПоНоменклатуреПоПериодамТоварНеПоставляется'
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я завершаю редактирование строки
//			
//		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//		И я жду закрытия окна 'Предложение участника (создание) *' в течение 20 секунд
//
//	* Предложение участника 2
//	
//		И в таблице "Лоты" я нажимаю на кнопку с именем 'ЛотыДокументПредложениеПоставщикаСоздатьНаОсновании'
//		Тогда открылось окно 'Предложение участника (создание)'
//		
//		И я нажимаю кнопку выбора у поля с именем "КонтрагентБезОтбора"
//		Тогда открылось окно 'Контрагенты'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Поставщики'               |
//		И в таблице  "Список" я перехожу на один уровень вниз
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Поставщик4'               |
//		И в таблице "Список" я выбираю текущую строку
//		
//		Тогда открылось окно 'Предложение участника (создание) *'
//		И я перехожу к закладке с именем "ГруппаСтраницаУсловия"
//		И в поле с именем 'УсловияПоставки' я ввожу текст 'Условия 2'
//		И в поле с именем 'СрокиВыполненияДоговора' я ввожу текст 'Сроки выполнения 2'
//		И я перехожу к следующему реквизиту
//		И в поле с именем 'СрокПоставки' я ввожу текст '2'
//		
//		И я нажимаю кнопку выбора у поля с именем "УсловиеОплаты"
//		Тогда открылось окно 'Условия оплаты'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование'                                       |
//			| 'Аванс 50% за 30 к.д., Постоплата 50% через 30 к.д.' |
//		И в таблице "Список" я выбираю текущую строку
//		
//		Если появилось предупреждение в течение 10 секунд тогда
//			И я нажимаю на кнопку с именем 'Button0'
//
//		Тогда открылось окно 'Предложение участника (создание) *'
//		
//		И я перехожу к закладке с именем "ГруппаСтаницаНоменклатура"
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я активизирую поле с именем "УсловияПоНоменклатуреПоПериодамЦена"
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я выбираю текущую строку
//		И в таблице "УсловияПоНоменклатуреПоПериодам" в поле с именем 'УсловияПоНоменклатуреПоПериодамЦена' я ввожу текст '1 200,00'
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я завершаю редактирование строки
//		
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я перехожу к строке:
//			| 'Место поставки' | 'Номенклатура' | 'Сумма с НДС' | 'Товар не поставляется' |
//			| 'МестоПоставки1' | 'Материал3'    | '150 000,00'  | 'Нет'                   |
//		
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я активизирую поле с именем "УсловияПоНоменклатуреПоПериодамЦена"
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я выбираю текущую строку
//		И в таблице "УсловияПоНоменклатуреПоПериодам" в поле с именем 'УсловияПоНоменклатуреПоПериодамЦена' я ввожу текст '1 100,00'
//		И в таблице "УсловияПоНоменклатуреПоПериодам" я завершаю редактирование строки
//		
//		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//		И я жду закрытия окна 'Предложение участника (создание) *' в течение 20 секунд
//		
//		И Я закрываю окно 'Закупочная процедура №*'
//		И я закрываю окно 'Строки планов закупок'
//	
Сценарий: 04.08. [ЗАПРОС ПРЕДЛОЖЕНИЙ] Протокол и договор ДД2 по закупочной процедуре 2
//
//	* Запоминаем текущую дату
//		
//		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"	
//		
//	* Открываем закупочную процедуру
//	
//		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Закупочные процедуры'
//		Тогда открылось окно 'Закупочные процедуры'
//		И в таблице "Список" я перехожу к строке:
//			| 'Организатор закупки' | 'Период закупок' | 'Предмет договора'                | 'Способ закупки'     |
//			| 'Семь королевств'     | '2024 г.'        | 'Приобретение материалов, тест 2' | 'Запрос предложений' |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Закупочная процедура №*'
//	
//	* 	Создаем протокол из процедуры
//	
//		И я нажимаю на кнопку с именем 'ДокументПротоколВыбораПобедителейСоздатьПротоколВыбораПобедителей'
//		Тогда открылось окно 'Протокол выбора победителей (создание)'
//		
//	* 	Дата протокола
//	
//		И в поле с именем 'ДатаПодписания' я ввожу значение переменной "ТекущаяДата"
//		И я перехожу к следующему реквизиту
//		
//	* Переход к странице выбора победителя
//	
//		И я перехожу к закладке с именем "СтраницаДокументыВыбораПоЛотам"
//		
//	* Записываем протокол
//		
//		И я нажимаю на кнопку с именем 'ФормаЗаписать'
//		
//	* Выбираем победителя
//	
//		И в таблице "ПредложенияПобедителей" я нажимаю на кнопку с именем 'НазначитьПоставщиковНоменклатуреЛота'
//		Тогда открылось окно 'Рассмотрение предложений участников'
//		И в таблице "НоменклатураПоПоставщикам" я нажимаю на кнопку с именем 'НоменклатураПоПоставщикамВыбратьПоПредложениюСМинимальнойОбщейСуммой'
//		И в таблице "НоменклатураПоПоставщикам" я нажимаю на кнопку с именем 'ФормаЗаписатьИзменения'
//		Тогда открылось окно 'Протокол выбора победителей * от * *'
//		
//	* 	Результаты работы комиссии
//		
//		И Пауза 1
//		И в поле с именем 'РезультатРаботыКомиссии' я ввожу текст 'Процедура состоялась. Кворум имеется.'
//		И я перехожу к следующему реквизиту
//		
//	* Место проведения процедуры
//		
//		И Пауза 1
//		И в поле с именем 'МестоПроведенияПроцедуры' я ввожу текст 'Место проведения'
//		И я перехожу к следующему реквизиту
//	
//	* Еще раз записываем и проводим 
//	
//		И я нажимаю на кнопку с именем 'ФормаЗаписать'
//		И я нажимаю на кнопку с именем 'ФормаПровести'
//		И из выпадающего списка с именем "СтатусОбъекта" я выбираю точное значение 'Утвержден'
//			
//		Если появилось предупреждение в течение 10 секунд тогда
//			И я нажимаю на кнопку с именем 'Button0'
//
//	* Создаем договор с поставщиком
//
//		И я нажимаю на кнопку с именем 'ФормаОбработкаФормированиеДоговоровСПобедителямиТорговУправлениеДоговорамиЗакупки'
//		Тогда открылось окно 'Формирование договоров с победителями торгов'
//		И в таблице "ПобедившиеПредложенияПоставщиков" я активизирую поле с именем "ПобедившиеПредложенияПоставщиковПоставщик"
//		И в таблице "ПобедившиеПредложенияПоставщиков" я нажимаю на кнопку с именем 'СоздатьДоговорПоВыбранномуПредложениюПоставщика'
//		Тогда открылось окно 'С поставщиком (создание)'
//		
//		И пауза 1
//	
//	* Дозаполняем договор	
//		
//		И в поле с именем 'Номер' я ввожу текст 'ДД2'
//		И я перехожу к следующему реквизиту
//		И я нажимаю кнопку выбора у поля с именем "Дата"
//		И в поле с именем 'Дата' я ввожу значение переменной "ТекущаяДата"
//		И я перехожу к следующему реквизиту
//		И я перехожу к закладке с именем "ГруппаРасчеты"
//		И я перехожу к закладке с именем "СтраницаАналитикиПланирования"
//		И я перехожу к закладке с именем "СтраницаПланЗакупок"
//		И я перехожу к закладке с именем "ГруппаГрафик"
//		И в таблице "ГрафикРасчетов" я нажимаю на кнопку с именем 'ГрафикРассчитатьПоГрафикуПоставок'
//		
//	* Записываем и проводим договор
//
//		И я нажимаю на кнопку с именем 'ФормаЗаписать'
//		Тогда открылось окно 'ДД2 от * (С поставщиком) вер. * от *'
//		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//		И я жду закрытия окна 'ДД2 от * (С поставщиком) вер. * от *' в течение 20 секунд
//	
//	* Закрываем все окна клиентского приложения
//			
//		И я закрываю все окна клиентского приложения
//

Сценарий: 04.11. [ЗАПРОС ПРЕДЛОЖЕНИЙ] ПТУ по договору ДД2
//
//	* Запоминаем текущую дату
//		
//		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
//		
//	* Открываем список поступлений
//	
//		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Поступление (акты, накладные, УПД)'
//		Тогда открылось окно 'Поступление (акты, накладные, УПД)'
//		
//	* Создаем ПТУ	
//	
//		И я нажимаю на кнопку с именем 'СоздатьПоступлениеТовары'
//		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание)'
//		
//	* Организация
//	
//		И я нажимаю кнопку выбора у поля с именем "Организация"
//		Тогда открылось окно 'Организационные единицы'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Королевство Севера [223]' |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание) *'
//		
//	* Контрагент
//	
//		И я нажимаю кнопку выбора у поля с именем "Контрагент"
//		Тогда открылось окно 'Контрагенты'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Поставщики'               |
//		И в таблице  "Список" я перехожу на один уровень вниз
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Поставщик4'               |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание) *'
//		
//	* Договор 
//	
//		И я нажимаю кнопку выбора у поля с именем "ДоговорКонтрагента"
//		И в таблице "Список" я перехожу к строке:
//			| 'Номер договора' |
//			| 'ДД2'            |
//		И в таблице "Список" я выбираю текущую строку
//
//	* Склад
//
//		И я нажимаю кнопку выбора у поля с именем "Склад"
//		Тогда открылось окно 'Склады'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование' |
//			| 'Склад1'       |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание) *'
//		
//	* Заполняем	табличную часть
//	
//		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыУХ_ЗаполнитьПоДоговору'
//		Если открылось окно '1С:Предприятие' Тогда
//			И я нажимаю на кнопку с именем 'Button0'
//			
//	* Цена		
//		
//		И в таблице "Товары" я перехожу к строке:
//			| 'Номенклатура' |
//			| 'Материал2'   |
//		И в таблице "Товары" я выбираю текущую строку
//		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1200,00'
//		И в таблице "Товары" я завершаю редактирование строки
//		
//		И в таблице "Товары" я перехожу к строке:
//			| 'Номенклатура' |
//			| 'Материал3'   |
//		И в таблице "Товары" я выбираю текущую строку
//		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1100,00'
//		И в таблице "Товары" я завершаю редактирование строки
//		
//	* Проверяем правильность заполнения строки
//	
//		# И в таблице "Товары" я активизирую поле с именем "ТоварыНоменклатура"
//		# И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыСортироватьСписокПоВозрастанию'
//		# Тогда таблица "Товары" стала равной:
//			# | 'Номенклатура' | 'Счет НДС' | '% НДС' | 'Количество' | 'Всего'      | 'Единица' | 'Счет учета' | 'Цена'     | 'Сумма'      | 'НДС'       | 'Страна происхождения' |
//			# | 'Материал2'    | '19.03'    | '20%'   | '200,000'    | '240 000,00' | 'т'       | '10.01'      | '1 200,00' | '240 000,00' | '40 000,00' | ''                     |
//			# | 'Материал3'    | '19.03'    | '20%'   | '100,000'    | '110 000,00' | 'т'       | '10.01'      | '1 100,00' | '110 000,00' | '18 333,33' | ''                     |
//
//	* Проводим документ 
//	
//		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//		И я жду закрытия окна 'Поступление товаров: Накладная, УПД (создание) *' в течение 20 секунд
//	
//	* Закрываем все окна клиентского приложения
//			
//		И я закрываю все окна клиентского приложения			
//		
Сценарий: 04.14. [Обеспечение потребностей] Королевство Севера
//
//	* Открываем список обеспечения
//	
//		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Обеспечение потребностей'
//		Тогда открылось окно 'Обеспечение потребностей'
//
//	* Создаем документ
//	
//		И я нажимаю на кнопку с именем 'ФормаСоздать'
//		Тогда открылось окно 'Обеспечение потребностей (создание)'
//
//	* Организация
//	
//		И я нажимаю кнопку выбора у поля с именем "Организация"
//		Тогда открылось окно 'Организационные единицы'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Королевство Севера [223]' |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Обеспечение потребностей (создание) *'
//		
//	* ЦФО 
//	
//		И я нажимаю кнопку выбора у поля с именем "ЦФО"
//		Тогда открылось окно 'Организационные единицы'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование в программе' |
//			| 'Королевство Севера [223]' |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Обеспечение потребностей (создание) *'
//	
//	* Заполняем табчасть
//	
//		И в таблице "Потребности" я нажимаю на кнопку с именем 'ПотребностиКомандаЗаполнитьПоБюджетамЗакупок'
//
//	* Проводим документ
//		
//		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//		И я жду закрытия окна 'Обеспечение потребностей (создание) *' в течение 20 секунд
//	
//	* Закрываем все окна клиентского приложения
//			
//		И я закрываю все окна клиентского приложения							
//	

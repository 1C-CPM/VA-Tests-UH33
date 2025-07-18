﻿#language: ru
@tree

@UH33_Purchases

Функционал: 09. Проверка добавления потребности из заявки в лот закупочной процедуры

	СПЗ (многолетняя) - ЛОТ - Протокол - ПТУ

Контекст:

	И я подключаю TestClient "УХ - Закупки" логин "МенеджерПоЗакупкам1" пароль ""
	И я закрыл все окна клиентского приложения

Сценарий: 09.00. Ограниченные права: инициализация

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоЕРПУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ВерсияУправлениеХолдингом()' в переменную "$$ВерсияУХ$$"
	И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "$$ТекущаяДата$$"	
	
Сценарий: 09.01. [ЗАЯВКА -> ЛОТ;  Королевство простора] Заявка на обеспечение

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
			| 'Королевство Простора'     |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на обеспечение (создание) *'
		
	* ЦФО	
		
		И я нажимаю кнопку выбора у поля с именем "ЦФО"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе'  |
			| 'ЦФО1 Королевство Простора' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на обеспечение (создание) *'

	* Проект
	
		И я нажимаю кнопку выбора у поля с именем "Проект"
		Тогда открылось окно 'Проекты и этапы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Проект1'      |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на обеспечение (создание) *'
		
	* Дата поставки	
		
		И я устанавливаю флаг с именем 'ЕдинаяДатаОперации'
		И в поле с именем 'ДатаОперации' я ввожу текст "29.06.2025"
		И я перехожу к следующему реквизиту
		
	* Место поставки	
		
		И я устанавливаю флаг с именем 'ЕдиноеМестоПоставки'
		И я нажимаю кнопку выбора у поля с именем "МестоПоставки"
		Тогда открылось окно 'Места поставки товаров (оказания услуг)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'   |
			| 'МестоПоставки1' |
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
		
	* Товар1 
	
		И в таблице "ПланыДокумента" я нажимаю на кнопку с именем 'ПланыДокументаДобавить'
		И в таблице "ПланыДокумента" я нажимаю кнопку выбора у реквизита с именем "ПланыДокументаНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице 'Список' я перехожу к строке:
			| '% НДС' | 'Единица' | 'Наименование' |
			| '20%'   | 'кг'      | 'Товар1'       |
		И в таблице "Список" я выбираю текущую строку
		И В таблице "ПланыДокумента" я завершаю редактирование строки
		
		И в таблице "ПланыДокумента" я активизирую поле 'Количество'
		И в таблице "ПланыДокумента" в поле 'Количество' я ввожу текст '100,000'
		И в таблице "ПланыДокумента" я перехожу к следующей ячейке
		
		И в таблице 'ПланыДокумента' я нажимаю кнопку выбора у реквизита 'Условие оплаты'
		Тогда открылось окно "Условия оплаты"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"                  |
			| "Постоплата 100% через 10 к.д." |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Заявка на обеспечение (создание) *"
		
		И Я добавляю Статью БДДС в ТЧ "ПланыДокумента", Статья = "Статья БДДС 1", А1 = "AAA1", А2 = "BBB1", А3 = "CCC1", А4 = "DDD1", А5 = "EEE1", А6 = "FFF1"
		И Я добавляю Статью БДР в ТЧ "ПланыДокумента", Статья = "Статья БДР 1", А1 = "XXX1", А2 = "YYY1", А3 = "ZZZ1", А4 = "SSS1", А5 = "RRR1", А6 = "WWW1"
	
	* Товар2

		И в таблице "ПланыДокумента" я нажимаю на кнопку с именем 'ПланыДокументаДобавить'
		И в таблице "ПланыДокумента" я нажимаю кнопку выбора у реквизита с именем "ПланыДокументаНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "Список" я перехожу к строке:
			| '% НДС' | 'Единица' | 'Наименование' |
			| '20%'   | 'упак'    | 'Товар2'       |
		И в таблице "Список" я выбираю текущую строку
		И В таблице "ПланыДокумента" я завершаю редактирование строки

		И в таблице "ПланыДокумента" я активизирую поле 'Количество'
		И в таблице "ПланыДокумента" в поле 'Количество' я ввожу текст '100,000'
		И в таблице "ПланыДокумента" я перехожу к следующей ячейке

		И в таблице 'ПланыДокумента' я нажимаю кнопку выбора у реквизита 'Условие оплаты'
		Тогда открылось окно "Условия оплаты"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"                  |
			| "Постоплата 100% через 10 к.д." |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Заявка на обеспечение (создание) *"
		И в таблице 'ПланыДокумента' я завершаю редактирование строки
 
		И Я добавляю Статью БДДС в ТЧ "ПланыДокумента", Статья = "Статья БДДС 1", А1 = "AAA1", А2 = "BBB1", А3 = "CCC1", А4 = "DDD1", А5 = "EEE1", А6 = "FFF1"
		И Я добавляю Статью БДР в ТЧ "ПланыДокумента", Статья = "Статья БДР 1", А1 = "XXX1", А2 = "YYY1", А3 = "ZZZ1", А4 = "SSS1", А5 = "RRR1", А6 = "WWW1"

	* Проводим и закрываем открытые формы 
	
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно 'Заявка на обеспечение * от *'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Заявка на обеспечение * от *' в течение 20 секунд
		Тогда открылось окно 'Заявки на обеспечение'
		И Я закрываю окно 'Заявки на обеспечение'

Сценарий: 09.02. [ЗАЯВКА -> ЛОТ;  Королевство простора] Закупочная процедура 

	* Запоминаем текущую дату
		
		
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"	

	* Открываем список закупочных процедур
	
		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Закупочные процедуры'
		Тогда открылось окно 'Закупочные процедуры'
	
	* Создаем процедуру
	
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Закупочная процедура №*'
		
	* Период закупок
	
		И я нажимаю кнопку выбора у поля с именем "ПериодЗакупок"
		Тогда открылось окно 'Периоды'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| '2025 г.'      |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'

	* Способ выбора

		И я нажимаю кнопку выбора у поля с именем "СпособВыбораПоставщика"
		Тогда открылось окно 'Способы закупок'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'     |
			| 'Запрос котировок' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'

	* Метод оценки

		//И в поле с именем 'МетодОценкиПредложенийПоставщиков' я ввожу текст 'По конкурентным листам'
		//И в поле с именем 'МетодОценкиПредложенийПоставщиков' я ввожу текст 'По критериям'
		
	* Тип процедуры

		И из выпадающего списка с именем 'ТипЗакупки' я выбираю точное значение "Простая закупка"

	* Заказчик

		И я нажимаю кнопку выбора у поля с именем "ОрганизацияДляЗаключенияДоговора"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Простора'     |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'
		
	* Организатор	
		
		И я нажимаю кнопку выбора у поля с именем "ОрганизаторЗакупки"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Семь королевств'          |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'
		
	* Валюта документа	
		
		И из выпадающего списка с именем "ВалютаДокумента" я выбираю точное значение 'RUB'
		
	* Дата подготовки
		
		И в поле с именем 'ДатаНачалаПодготовкиЗакупки' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
	
	* Дата официального объявления

		И в поле с именем 'ДатаОфициальногоОбъявленияЗакупки' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		
	* Предмет договора
		
		И в поле с именем 'ПредметДоговора' я ввожу текст 'Предмет договора (тест 4)'
		И я перехожу к следующему реквизиту
	
	* Общие требования

		И в поле с именем 'ОбщиеТребования' я ввожу текст 'Общие требования'
		
	* Приказ о назначении закупочной комиссии
	
		И я нажимаю кнопку выбора у поля с именем "ПриказОНазначенииЗакупочнойКомиссии"
		Тогда открылось окно 'Приказы закупочной комиссии'
		И в таблице "Список" я перехожу к строке:
			| 'Номер приказа' |
			| '000000001'     |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'
		
	* Условия 

		И я перехожу к закладке с именем "ГруппаУсловияЗакупки"
		И в поле с именем 'ПояснениеУсловияПоставки' я ввожу текст 'Пояснение условий договора'
		И я перехожу к следующему реквизиту
		
	* Описание графика исполнения договора 
			
		И в поле с именем 'ОписаниеГрафикаПоставки' я ввожу текст 'Описание графика исполнения договора'
		И я перехожу к следующему реквизиту
		
	* УсловияПоставкиИнкотермс
	
		И из выпадающего списка с именем "УсловияПоставкиИнкотермс" я выбираю точное значение 'FAS'
		
	* Условие оплаты
	
		И я нажимаю кнопку выбора у поля с именем "УсловиеОплаты"
		Тогда открылось окно 'Условия оплаты'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                                      |
			| 'Аванс 60% за 5 к.д., Постоплата 40% через 40 к.д.' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'
		
	* Источник финансирования	
		
		И я нажимаю кнопку выбора у поля с именем "ИсточникФинансирования"
		Тогда открылось окно 'Источники финансирования'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'               |
			| 'Собственное финансирование' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'
		
	* Закладка Требования к поставщикам
	
		И я перехожу к закладке с именем "ГруппаТребованияКПоставщикам"
		И в таблице "ТребованияКПоставщикам" я нажимаю на кнопку с именем 'ТребованияКПоставщикамЗаполнитьТребованияКПоставщикам'
		
	* Закладка	Требования к составу документов
		
		И я перехожу к закладке с именем "ГруппаТребованияКСоставуДокументов"
		И в поле с именем 'ТребованияКОформлениюДокументации' я ввожу текст 'Требования к оформлению документации'
		И я перехожу к следующему реквизиту
		
	* Закладка Условия выдачи документации
	
		И я перехожу к закладке с именем "ГруппаУсловияВыдачиДокументации"
		И в поле с именем 'АдресПредоставленияДокументации' я ввожу текст 'Адрес предоставления документации'
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'ПорядокПредоставления' я ввожу текст 'Порядок предоставления документации'
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'СрокИПорядокОплатыЗаПредоставлениеДокументации' я ввожу текст 'Срок и порядок оплаты за предоставление документации'
		
	* Закладка Условия приема	
		
		И я перехожу к закладке с именем "ГруппаУсловияПриема"
		
		И в поле с именем 'EMailПриема' я ввожу текст 'net@mail.ru'
		И в поле с именем 'АдресПриема' я ввожу текст 'Адрес приема документации'
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'ГрафикРаботы' я ввожу текст 'График работы'
		И я перехожу к следующему реквизиту
	
	* Закладка Условия рассмотрения заявок
	
		И я перехожу к закладке с именем "ГруппаУсловияРассмотренияЗаявок"
		
		И в поле с именем 'КоличествоМестСОбязанностьюЗаключитьДоговор' я ввожу текст '1'
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'МинимальноеКоличествоЗаявок' я ввожу текст '2'
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'ПорядокОценкиИСопоставленияЗаявок' я ввожу текст 'Порядок оценки и сопоставления заявок'
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'АдресРассмотренияЗаявок' я ввожу текст 'Адрес рассмотрения заявок'
		И я перехожу к следующему реквизиту
		
		И в поле с именем 'АдресПодведенияИтогов' я ввожу текст 'Адрес подведения итогов'
		И я перехожу к следующему реквизиту
		
	* Записываем документ	
		
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		
	* Расписание процедуры
	
		И я нажимаю на гиперссылку с именем "СвязанноеМероприятие"
		Тогда открылось окно 'Стадии закупочной процедуры'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Стадии закупочной процедуры' в течение 20 секунд
		Тогда открылось окно 'Закупочная процедура №*'

	* Закладка Лоты
	
		И я перехожу к закладке с именем "ГруппаЛоты"
		
	* Создаем лот
	
		И в таблице "Лоты" я нажимаю на кнопку с именем 'ЛотыДобавить'
		Тогда открылось окно 'Лоты (создание)'
		
	* Предмет договора	
	
		И в поле с именем 'ПредметДоговора' я ввожу текст 'Предмет договора'
		
	* Закладка Потребности	
	
		И я перехожу к закладке с именем "ГруппаНоменклатура"
		
	* Подбираем товары из заявки
	
		И в таблице 'Номенклатура' я нажимаю на кнопку с именем 'ПодборПотребностей1'
		Тогда открылось окно "Форма выбора потребностей"
		И в таблице 'СписокПотребностей' я активизирую поле с именем 'СписокПотребностейПериодПотребности'
		И в таблице 'СписокПотребностей' я выделяю все строки
		И в таблице 'СписокПотребностей' я нажимаю на кнопку с именем 'СписокПотребностейПеренестиПотребность'
		И я нажимаю на кнопку с именем 'ФормаОтправитьИЗакрыть'

	* Проверяем подобранные товары 
	
		Тогда таблица 'Номенклатура' стала равной:
			| 'Номенклатура' | 'Цена'      | 'Единица измерения' |  'Дата поставки' | 'ЦФО'                       | 'Количество' | 'Место поставки' | 'Сумма без НДС' | 'Ставка НДС' | 'Сумма НДС'  | 'Сумма с НДС'  | 'Статья БДДС'   |'Статья БДР'    |
			| 'Товар1'       | '10 000,00' | 'кг'                | '29.06.2025'     | 'ЦФО1 Королевство Простора' | '100,000'    | 'МестоПоставки1' | '833 333,33'    | '20%'        | '166 666,67' | '1 000 000,00' | 'Статья БДДС 1' | 'Статья БДР 1' |
			| 'Товар2'       | '8 500,00'  | 'упак'              | '29.06.2025'     | 'ЦФО1 Королевство Простора' | '100,000'    | 'МестоПоставки1' | '708 333,33'    | '20%'        | '141 666,67' | '850 000,00'   | 'Статья БДДС 1' | 'Статья БДР 1' |
	
	* Записываем
	
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно 'Лоты * от *'
	
	* Проводим
	
		И я нажимаю на кнопку с именем 'ФормаПровести'
		
	* Утверждаем лот
	
		И из выпадающего списка с именем "СтатусОбъекта" я выбираю точное значение 'Утвержден'

	* Закрываем
	
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Лоты * от *' в течение 20 секунд
		Тогда открылось окно 'Закупочная процедура №*'
	
	* Настройка оценки

		И я перехожу к закладке с именем 'ГруппаКритерииКонкурентногоЛиста'

		И в таблице 'ОбщиеКритерииНоменклатуры' я перехожу к строке:
			| "Критерий по предложению" |
			| "Условие оплаты"          |
		И в таблице 'ОбщиеКритерииНоменклатуры' я активизирую поле с именем 'ОбщиеКритерииНоменклатурыФормулаРасчета'
		И в таблице 'ОбщиеКритерииНоменклатуры' я выбираю текущую строку
		И в таблице 'ОбщиеКритерииНоменклатуры' из выпадающего списка с именем 'ОбщиеКритерииНоменклатурыФормулаРасчета' я выбираю точное значение "Ручная оценка"
		И в таблице 'ОбщиеКритерииНоменклатуры' я завершаю редактирование строки

		И в таблице 'СписокКритериев' я разворачиваю строку:
			| "Доступные критерии" |
			| "Организационный"    |
		И в таблице 'СписокКритериев' я разворачиваю строку:
			| "Доступные критерии" |
			| "Коммерческий"       |

		И в таблице 'СписокКритериев' я перехожу к строке:
			| "Доступные критерии" |
			| "Условия поставки"   |
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я перехожу к строке:
			| "Критерий по номенклатуре" |
			| "Товар1"                   |
		И я нажимаю на кнопку с именем 'СписокКритериевКритерийВИндивидуальные'
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я выбираю текущую строку
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' из выпадающего списка с именем 'ИндивидуальныеКритерииНоменклатуры1ФормулаРасчета' я выбираю точное значение "Ручная оценка"
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я завершаю редактирование строки

		И в таблице 'СписокКритериев' я перехожу к строке:
			| "Доступные критерии" |
			| "Условия поставки"   |
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я перехожу к строке:
			| "Критерий по номенклатуре" |
			| "Товар2"                   |
		И я нажимаю на кнопку с именем 'СписокКритериевКритерийВИндивидуальные'
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' из выпадающего списка с именем 'ИндивидуальныеКритерииНоменклатуры1ФормулаРасчета' я выбираю точное значение "Ручная оценка"
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я завершаю редактирование строки

	* Утверждаем процедуру 
	
		И из выпадающего списка с именем "СтатусОбъекта" я выбираю точное значение 'Утвержден'

		Если открылось окно '1С:Предприятие' Тогда
			И я нажимаю на кнопку с именем 'Button0'

		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Закупочная процедура №*' в течение 20 секунд
		
	* Закрываем все открытые окна
	
		//И я закрыл все окна клиентского приложения

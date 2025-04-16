﻿#language: ru
@tree

@UH33_Purchases

Функционал: 04. Запрос котировок [от спз до пту]: Цена вкл.НДС

	Как бизнес-аналитик я хочу
	проверить создание документов подситемы и закрытие регистров
	чтобы исключить ошибки

Контекст:
	
	И я закрываю сеанс текущего клиента тестирования
	И я подключаю TestClient "УХ - Закупки" логин "МенеджерПоЗакупкам1" пароль ""
	И я закрыл все окна клиентского приложения

Сценарий: 04.00. Ограниченные права: инициализация

	И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "$$ТекущаяДата$$"	
	
Сценарий: 04.01. [ЗАПРОС КОТИРОВОК] СПЗ 1

	* Запоминаем ТекущаяДата, НачалоГода, КонецГода
		
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И Я запоминаю значение выражения 'СокрЛП(НачалоГода(ТекущаяДата()))' в переменную "НачалоГода"
		И Я запоминаю значение выражения 'СокрЛП(КонецГода(ТекущаяДата()+365*24*60*60))' в переменную "КонецГода"

	* Открываем список СПЗ
	
		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Строки планов закупок (223-ФЗ)'
		Тогда открылось окно 'Строки планов закупок (223-ФЗ)'
	
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
		И из выпадающего списка с именем "СпособВыбораПоставщика" я выбираю точное значение 'Запрос котировок'

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
		И в поле с именем 'InputFld' я ввожу текст 'Приобретение материалов, тест 1'
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно 'Строка плана закупок (создание) *'
	
	* Общие требования
	
		И я перехожу к следующему реквизиту
		И я нажимаю кнопку выбора у поля с именем "ОбщиеТребования"
		Тогда открылось окно 'Общие требования'
		И в поле с именем 'InputFld' я ввожу текст 'Нет, тест 1'
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

		И в таблице 'Номенклатура' я нажимаю на кнопку с именем 'ПланыДокументаЗафиксироватьТипНоменклатуры'
		Тогда открылось окно "Выбор типа номенклатуры"
		И в таблице '' я перехожу к строке:
			| "Колонка1"     |
			| "Номенклатура" |
		И в таблице '' я выбираю текущую строку

	* 2025

		И Я добавляю Номенклатуру в ТЧ ="Номенклатура", Номенклатура = "Материал1", ЦФО = "Королевство Севера [223]", МестоПоставки = "МестоПоставки1", ДатаПоставки = "15.08.2025", Колво = "100", Цена = "1 200,00", СтавкаНДС = "20%", Проект = "Проект1"
		И Я добавляю Статью БДДС в ТЧ "Номенклатура", Статья = "Статья БДДС 1", А1 = "AAA1", А2 = "BBB1", А3 = "CCC1", А4 = "DDD1", А5 = "EEE1", А6 = "FFF1"
		И Я добавляю Статью БДР в ТЧ "Номенклатура", Статья = "Статья БДР 1", А1 = "XXX1", А2 = "YYY1", А3 = "ZZZ1", А4 = "SSS1", А5 = "RRR1", А6 = "WWW1"

	* 2026

		И Я добавляю Номенклатуру в ТЧ ="Номенклатура", Номенклатура = "Материал2", ЦФО = "Королевство Севера [223]", МестоПоставки = "МестоПоставки1", ДатаПоставки = "20.07.2026", Колво = "250", Цена = "1 400,00", СтавкаНДС = "20%", Проект = "Проект1"
		И Я добавляю Статью БДДС в ТЧ "Номенклатура", Статья = "Статья БДДС 1", А1 = "AAA1", А2 = "BBB1", А3 = "CCC1", А4 = "DDD1", А5 = "EEE1", А6 = "FFF1"
		И Я добавляю Статью БДР в ТЧ "Номенклатура", Статья = "Статья БДР 1", А1 = "XXX1", А2 = "YYY1", А3 = "ZZZ1", А4 = "SSS1", А5 = "RRR1", А6 = "WWW1"

	* Финансирование
	
		И я перехожу к закладке с именем "ГруппаФинансирование"
		И в таблице "Финансирование" я нажимаю на кнопку с именем 'ФинансированиеЗаполнитьПериодыФинансирования'
		И в таблице "Финансирование" я нажимаю на кнопку с именем 'ФинансированиеРаспределитьСуммуФинансирования'

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
		И я закрываю все окна клиентского приложения

Сценарий: 04.02. [ЗАПРОС КОТИРОВОК] Закупочная процедура 1 / лотовая

	* Создаем процедуру
	
		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Строки планов закупок (223-ФЗ)'
		Тогда открылось окно 'Строки планов закупок (223-ФЗ)'
		И в таблице "Список" я перехожу к строке:
			|'Период закупок'| 'Заказчик'                 | 'Организатор'     | 'Способ закупки'   | 'Предмет договора'                | 'Состояние' | 'Сумма'      |'Валюта' | 'Статус'    |
			|'2025 г.'       | 'Королевство Севера [223]' | 'Семь королевств' | 'Запрос котировок' | 'Приобретение материалов, тест 1' | 'Утвержден' | '470 000,00' |  'RUB'  | 'Утвержден' |
	
		И я нажимаю на кнопку с именем 'ФормаСправочникЗакупочныеПроцедурыПолучитьСоздатьЗакупочнуюПроцедуру'
		Тогда открылось окно 'Закупочная процедура №*'
	
	* Приказ о назначении закупочной комиссии
	
		И я нажимаю кнопку выбора у поля с именем "ПриказОНазначенииЗакупочнойКомиссии"
		Тогда открылось окно 'Приказы закупочной комиссии'
		И в таблице "Список" я перехожу к строке:
			| 'Номер приказа' |
			| '000000001'     |
		И в таблице "Список" я выбираю текущую строку
	
	* Расписание процедуры
	
		И я нажимаю на гиперссылку с именем "СвязанноеМероприятие"
		Тогда открылось окно 'Стадии закупочной процедуры'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Стадии закупочной процедуры' в течение 20 секунд
		Тогда открылось окно 'Закупочная процедура №*'

	* Лот 
	
		И я перехожу к закладке с именем "ГруппаЛоты"
		И в таблице "Лоты" я перехожу к первой строке
		И в таблице "Лоты" я выбираю текущую строку
		Тогда открылось окно 'Лоты * от *'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Лоты * от *' в течение 20 секунд
		Тогда открылось окно 'Закупочная процедура №*'
		
	* Условия
	
		И я перехожу к закладке с именем "ГруппаУсловияЗакупки"
		
		И в поле с именем 'ПояснениеУсловияПоставки' я ввожу текст 'Пояснение условий'
		И в поле с именем 'ОписаниеГрафикаПоставки' я ввожу текст 'Описание графика'
		И в поле с именем 'ПорядокПредоставления' я ввожу текст 'Порядок предоставления докментации'
		И из выпадающего списка с именем "УсловияПоставкиИнкотермс" я выбираю точное значение 'FAS'
		И я нажимаю кнопку выбора у поля с именем "УсловиеОплаты"
		Тогда открылось окно 'Условия оплаты'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                                       |
			| 'Аванс 50% за 30 к.д., Постоплата 50% через 30 к.д.' |
		И в таблице "Список" я выбираю текущую строку
		
		#1С:Предприятие
		Если появилось предупреждение в течение 10 секунд тогда
			И я нажимаю на кнопку с именем 'Button0'
		
		Тогда открылось окно 'Закупочная процедура №*'

	* Источник финансирования
	
		И я нажимаю кнопку выбора у поля с именем "ИсточникФинансирования"
		Тогда открылось окно 'Источники финансирования'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'               |
			| 'Собственное финансирование' |
		И в таблице "Список" я выбираю текущую строку
		
	* Записываем документ	
		
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

	* Настройка оценки

		И я перехожу к закладке с именем 'ГруппаКритерииКонкурентногоЛиста'
		И в таблице 'ОбщиеКритерииНоменклатуры' я перехожу к строке:
			| "Критерий по предложению" |
			| "Условие оплаты"          |
		И в таблице 'ОбщиеКритерииНоменклатуры' я активизирую поле с именем 'ОбщиеКритерииНоменклатурыФормулаРасчета'
		И в таблице 'ОбщиеКритерииНоменклатуры' я выбираю текущую строку
		И в таблице 'ОбщиеКритерииНоменклатуры' из выпадающего списка с именем 'ОбщиеКритерииНоменклатурыФормулаРасчета' я выбираю точное значение "Ручная оценка"
		И в таблице 'ОбщиеКритерииНоменклатуры' я завершаю редактирование строки

		И в таблице 'СписокКритериев' я перехожу к строке:
			| "Доступные критерии" |
			| "Условия поставки"   |
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я перехожу к строке:
			| "Критерий по номенклатуре" |
			| "Материал1"                |
		И я нажимаю на кнопку с именем 'СписокКритериевКритерийВИндивидуальные'
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я выбираю текущую строку
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' из выпадающего списка с именем 'ИндивидуальныеКритерииНоменклатуры1ФормулаРасчета' я выбираю точное значение "Ручная оценка"
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я завершаю редактирование строки
				

		И в таблице 'СписокКритериев' я перехожу к строке:
			| "Доступные критерии" |
			| "Условия поставки"   |
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я перехожу к строке:
			| "Критерий по номенклатуре" |
			| "Материал2"                |
		И я нажимаю на кнопку с именем 'СписокКритериевКритерийВИндивидуальные'
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' из выпадающего списка с именем 'ИндивидуальныеКритерииНоменклатуры1ФормулаРасчета' я выбираю точное значение "Ручная оценка"
		И в таблице 'ИндивидуальныеКритерииНоменклатуры' я завершаю редактирование строки
				
	* Утверждаем и закрываем 

		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И из выпадающего списка с именем "СтатусОбъекта" я выбираю точное значение 'Утвержден'
		И я закрываю все окна клиентского приложения

Сценарий: 04.03. [ЗАПРОС КОТИРОВОК] Предложение 1

		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Закупочные процедуры'
		Тогда открылось окно 'Закупочные процедуры'
		И в таблице "Список" я перехожу к строке:
			| 'Организатор закупки' |'Заказчик'                | 'Период закупок' | 'Предмет договора'                | 'Способ закупки'   |'Статус'    |
			| 'Семь королевств'     |'Королевство Севера [223]'| '2025 г.'        | 'Приобретение материалов, тест 1' | 'Запрос котировок' |'Утвержден' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'
	
		И я перехожу к закладке с именем "ГруппаЛоты"

		И в таблице "Лоты" я перехожу к строке:
			| 'Период закупок' | 'Вид закупки'     | 'Заказчик'                 | 'Метод оценки'           | 'Предмет договора'                | 'НМЦ'             |
			| '2025 г.'        | 'Лотовая закупка' | 'Королевство Севера [223]' | 'По конкурентным листам' | 'Приобретение материалов, тест 1' | '470 000,00, RUB' |

		И в таблице "Лоты" я нажимаю на кнопку с именем 'ЛотыДокументПредложениеПоставщикаСоздатьНаОсновании'
		Тогда открылось окно 'Предложение участника (создание)'
		
		И я нажимаю кнопку выбора у поля с именем "КонтрагентБезОтбора"
		Когда открылось окно "Выбор типа данных"
		И в таблице '' я перехожу к строке:
			| ""           |
			| "Контрагент" |
		И в таблице '' я выбираю текущую строку
		Тогда открылось окно "Контрагенты"
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице 'Список' я перехожу к строке:
			| "ИНН"        | "Наименование в программе" |
			| "7714774531" | "Поставщик1"               |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"

		И я перехожу к закладке с именем 'ГруппаСтаницаНоменклатура'
					
		* Материал 1

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я перехожу к строке:
			| "Номенклатура" | "Место поставки" |
			| "Материал1"    | "МестоПоставки1" |

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я активизирую поле с именем 'УсловияПоНоменклатуреПоПериодамЦена'
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я выбираю текущую строку
		И в таблице 'УсловияПоНоменклатуреПоПериодам' в поле с именем 'УсловияПоНоменклатуреПоПериодамЦена' я ввожу текст "1 100,00"
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я завершаю редактирование строки

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я выбираю текущую строку
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я нажимаю кнопку выбора у реквизита с именем 'УсловияПоНоменклатуреПоПериодамСтраныПроисхождения'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я активизирую поле с именем 'УсловияПоНоменклатуреПоПериодамСтранаПроизводителя'
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я нажимаю кнопку выбора у реквизита с именем 'УсловияПоНоменклатуреПоПериодамСтранаПроизводителя'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я завершаю редактирование строки

		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' я перехожу к строке:
			| "Критерий оценки"  |
			| "Условия поставки" |
		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' в поле с именем 'ОценкаПоКритериямПозицииНоменклатурЗначение' я ввожу текст "На склад"
		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' я завершаю редактирование строки

		* Материал 2

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я перехожу к строке:
			| "Номенклатура" | "Место поставки" |
			| "Материал2"    | "МестоПоставки1" |

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я активизирую поле с именем 'УсловияПоНоменклатуреПоПериодамЦена'
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я выбираю текущую строку
		И в таблице 'УсловияПоНоменклатуреПоПериодам' в поле с именем 'УсловияПоНоменклатуреПоПериодамЦена' я ввожу текст "1 300,00"
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я завершаю редактирование строки

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я выбираю текущую строку
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я нажимаю кнопку выбора у реквизита с именем 'УсловияПоНоменклатуреПоПериодамСтраныПроисхождения'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я активизирую поле с именем 'УсловияПоНоменклатуреПоПериодамСтранаПроизводителя'
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я нажимаю кнопку выбора у реквизита с именем 'УсловияПоНоменклатуреПоПериодамСтранаПроизводителя'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я завершаю редактирование строки

		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' я перехожу к строке:
			| "Критерий оценки"  |
			| "Условия поставки" |

		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' в поле с именем 'ОценкаПоКритериямПозицииНоменклатурЗначение' я ввожу текст "Доставка"
		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' я завершаю редактирование строки
		
		И я перехожу к закладке с именем 'ГруппаКритерииКонкурентногоЛиста'

		* Общие критерии 
		
		И в таблице 'ОценкаПоКритериям' я перехожу к строке:
			| "Критерий оценки" |
			| "Срок поставки"   |
		И в таблице 'ОценкаПоКритериям' я активизирую поле с именем 'ОценкаПоКритериямЗначение'
		И в таблице 'ОценкаПоКритериям' я выбираю текущую строку
		И в таблице 'ОценкаПоКритериям' в поле с именем 'ОценкаПоКритериямЗначение' я ввожу текст "2"
		И в таблице 'ОценкаПоКритериям' я завершаю редактирование строки

		И в таблице 'ОценкаПоКритериям' я перехожу к строке:
			| "Критерий оценки" |
			| "Условие оплаты"  |
		И в таблице 'ОценкаПоКритериям' я активизирую поле с именем 'ОценкаПоКритериямКритерийОценки'
		И в таблице 'ОценкаПоКритериям' я активизирую поле с именем 'ОценкаПоКритериямЗначение'
		И в таблице 'ОценкаПоКритериям' я выбираю текущую строку
		И в таблице 'ОценкаПоКритериям' я нажимаю кнопку выбора у реквизита с именем 'ОценкаПоКритериямЗначение'
		Тогда открылось окно "Условия оплаты"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"                                       |
			| "Аванс 50% за 30 к.д., Постоплата 50% через 30 к.д." |
		И в таблице 'Список' я выбираю текущую строку
		И в таблице 'ОценкаПоКритериям' я завершаю редактирование строки

		* Записываем
		
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна "Предложение участника * от *" в течение 20 секунд

		И я закрываю все окна клиентского приложения
		
Сценарий: 04.04. [ЗАПРОС КОТИРОВОК] Предложение 2

		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Закупочные процедуры'
		Тогда открылось окно 'Закупочные процедуры'

		И в таблице "Список" я перехожу к строке:
			| 'Организатор закупки' |'Заказчик'                | 'Период закупок' | 'Предмет договора'                | 'Способ закупки'   |'Статус'    |
			| 'Семь королевств'     |'Королевство Севера [223]'| '2025 г.'        | 'Приобретение материалов, тест 1' | 'Запрос котировок' |'Утвержден' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'
	
		И я перехожу к закладке с именем "ГруппаЛоты"

		И в таблице "Лоты" я перехожу к строке:
			| 'Период закупок' | 'Вид закупки'     | 'Заказчик'                 | 'Метод оценки'           | 'Предмет договора'                | 'НМЦ'             |
			| '2025 г.'        | 'Лотовая закупка' | 'Королевство Севера [223]' | 'По конкурентным листам' | 'Приобретение материалов, тест 1' | '470 000,00, RUB' |

		И в таблице "Лоты" я нажимаю на кнопку с именем 'ЛотыДокументПредложениеПоставщикаСоздатьНаОсновании'
		Тогда открылось окно 'Предложение участника (создание)'
		
		И я нажимаю кнопку выбора у поля с именем "КонтрагентБезОтбора"
		Когда открылось окно "Выбор типа данных"
		И в таблице '' я перехожу к строке:
			| ""           |
			| "Контрагент" |
		И в таблице '' я выбираю текущую строку
		Тогда открылось окно "Контрагенты"
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице 'Список' я перехожу к строке:
			| "ИНН"        | "Наименование в программе" |
			| "6452049267" | "Поставщик2"               |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"

		И я перехожу к закладке с именем 'ГруппаСтаницаНоменклатура'
					
		* Критерии по номенклатуре Материал 1

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я перехожу к строке:
			| "Номенклатура" | "Место поставки" |
			| "Материал1"    | "МестоПоставки1" |

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я активизирую поле с именем 'УсловияПоНоменклатуреПоПериодамЦена'
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я выбираю текущую строку
		И в таблице 'УсловияПоНоменклатуреПоПериодам' в поле с именем 'УсловияПоНоменклатуреПоПериодамЦена' я ввожу текст "1 000,00"
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я завершаю редактирование строки

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я выбираю текущую строку
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я нажимаю кнопку выбора у реквизита с именем 'УсловияПоНоменклатуреПоПериодамСтраныПроисхождения'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я активизирую поле с именем 'УсловияПоНоменклатуреПоПериодамСтранаПроизводителя'
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я нажимаю кнопку выбора у реквизита с именем 'УсловияПоНоменклатуреПоПериодамСтранаПроизводителя'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я завершаю редактирование строки


		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' я перехожу к строке:
			| "Критерий оценки"  |
			| "Условия поставки" |
		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' в поле с именем 'ОценкаПоКритериямПозицииНоменклатурЗначение' я ввожу текст "На склад"
		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' я завершаю редактирование строки

		* Критерии по номенклатуре Материал 2

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я перехожу к строке:
			| "Номенклатура" | "Место поставки" |
			| "Материал2"        | "МестоПоставки1" |

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я активизирую поле с именем 'УсловияПоНоменклатуреПоПериодамЦена'
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я выбираю текущую строку
		И в таблице 'УсловияПоНоменклатуреПоПериодам' в поле с именем 'УсловияПоНоменклатуреПоПериодамЦена' я ввожу текст "1 200,00"
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я завершаю редактирование строки

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я выбираю текущую строку
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я нажимаю кнопку выбора у реквизита с именем 'УсловияПоНоменклатуреПоПериодамСтраныПроисхождения'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"

		И в таблице 'УсловияПоНоменклатуреПоПериодам' я активизирую поле с именем 'УсловияПоНоменклатуреПоПериодамСтранаПроизводителя'
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я нажимаю кнопку выбора у реквизита с именем 'УсловияПоНоменклатуреПоПериодамСтранаПроизводителя'
		Тогда открылось окно "Страны мира"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование" |
			| "РОССИЯ"       |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Предложение участника (создание) *"
		И в таблице 'УсловияПоНоменклатуреПоПериодам' я завершаю редактирование строки

		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' я перехожу к строке:
			| "Критерий оценки"  |
			| "Условия поставки" |

		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' в поле с именем 'ОценкаПоКритериямПозицииНоменклатурЗначение' я ввожу текст "Доставка"
		И в таблице 'ОценкаПоКритериямПозицииНоменклатур' я завершаю редактирование строки
		
		И я перехожу к закладке с именем 'ГруппаКритерииКонкурентногоЛиста'

		* Общие критерии 
		
		И в таблице 'ОценкаПоКритериям' я перехожу к строке:
			| "Критерий оценки" |
			| "Срок поставки"   |
		И в таблице 'ОценкаПоКритериям' я активизирую поле с именем 'ОценкаПоКритериямЗначение'
		И в таблице 'ОценкаПоКритериям' я выбираю текущую строку
		И в таблице 'ОценкаПоКритериям' в поле с именем 'ОценкаПоКритериямЗначение' я ввожу текст "1"
		И в таблице 'ОценкаПоКритериям' я завершаю редактирование строки

		И в таблице 'ОценкаПоКритериям' я перехожу к строке:
			| "Критерий оценки" |
			| "Условие оплаты"  |
		И в таблице 'ОценкаПоКритериям' я активизирую поле с именем 'ОценкаПоКритериямКритерийОценки'
		И в таблице 'ОценкаПоКритериям' я активизирую поле с именем 'ОценкаПоКритериямЗначение'
		И в таблице 'ОценкаПоКритериям' я выбираю текущую строку
		И в таблице 'ОценкаПоКритериям' я нажимаю кнопку выбора у реквизита с именем 'ОценкаПоКритериямЗначение'
		Тогда открылось окно "Условия оплаты"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"                  |
			| "Постоплата 100% через 10 к.д." |
		И в таблице 'Список' я выбираю текущую строку
		И в таблице 'ОценкаПоКритериям' я завершаю редактирование строки

		* Записываем
		
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна "Предложение участника * от *" в течение 20 секунд

		И я закрываю все окна клиентского приложения		 

Сценарий: 04.05. [ЗАПРОС КОТИРОВОК] Протокол

	* Запоминаем текущую дату
		
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"	
		
	* Открываем закупочную процедуру
	
		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Закупочные процедуры'
		Тогда открылось окно 'Закупочные процедуры'
		И в таблице "Список" я перехожу к строке:
			| 'Организатор закупки' |'Заказчик'                | 'Период закупок' | 'Предмет договора'                | 'Способ закупки'   |'Статус'    |
			| 'Семь королевств'     |'Королевство Севера [223]'| '2025 г.'        | 'Приобретение материалов, тест 1' | 'Запрос котировок' |'Утвержден' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Закупочная процедура №*'
	
	* Создаем протокол из процедуры
	
		И я нажимаю на кнопку с именем 'ДокументПротоколВыбораПобедителейСоздатьПротоколВыбораПобедителей'
		Тогда открылось окно 'Протокол выбора победителей (создание)'
		
	* Дата протокола
	
		И в поле с именем 'ДатаПодписания' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту

	* Результат

		И в поле с именем 'РезультатРаботыКомиссии' я ввожу текст "#1 Победитель определен, кворум имеется"
		И я перехожу к следующему реквизиту

	* Место проведения процедуры

		И в поле с именем 'МестоПроведенияПроцедуры' я ввожу текст "Москва, проспект Багратиона 1"
		И я перехожу к следующему реквизиту
				
	* Переход к странице выбора победителя
	
		И я перехожу к закладке с именем "СтраницаДокументыВыбораПоЛотам"
		
	* Записываем перед выбором победителя
		
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		
	* Выбираем победителя
	
		И в таблице 'ЛотыЗакупки' я нажимаю на кнопку с именем 'НазначитьПоставщиковНоменклатуреЛота'
		Тогда открылось окно "Конкурентный лист (Лотовая закупка)"
		
		И в табличном документе 'Результат' я перехожу к ячейке "R9C2"
		И в табличном документе 'Результат' я делаю двойной клик на текущей ячейке
		И в меню формы я выбираю '3'

		И в табличном документе 'Результат' я перехожу к ячейке "R10C2"
		И в табличном документе 'Результат' я делаю двойной клик на текущей ячейке
		И в меню формы я выбираю '5'

		И в табличном документе 'Результат' я перехожу к ячейке "R13C2"
		И в табличном документе 'Результат' я делаю двойной клик на текущей ячейке
		И в меню формы я выбираю '3'

		И в табличном документе 'Результат' я перехожу к ячейке "R16C2"
		И в табличном документе 'Результат' я делаю двойной клик на текущей ячейке
		И в меню формы я выбираю '5'

		И я нажимаю на кнопку с именем 'ФормаРежимВыбора'
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'

		И в табличном документе 'Результат' я перехожу к ячейке "R6C2:R6C3"
		И в табличном документе 'Результат' я делаю двойной клик на текущей ячейке
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Конкурентный лист (Лотовая закупка)"
		И я нажимаю на кнопку с именем 'ФормаПеренестиВДокумент'

	* Записываем и проводим 
	
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И из выпадающего списка с именем "СтатусОбъекта" я выбираю точное значение 'Утвержден'
		
		Если появилось предупреждение в течение 10 секунд тогда
			И я нажимаю на кнопку с именем 'Button0'

		И я закрываю все окна клиентского приложения
			
Сценарий: 04.06. [ЗАПРОС КОТИРОВОК] Договор ДД1

	* Открываем протокол

		И В командном интерфейсе я выбираю "Корпоративные закупки" "Протоколы закупочных процедур"
		Тогда открылось окно "Протоколы закупочных процедур"

		И в таблице 'Список' я перехожу к строке:
			|'Заказчик'                |'Организатор закупки'|'Период закупок'|'Способ закупки'  |'Результат работы комиссии'              |
			|'Королевство Севера [223]'|'Семь королевств'    |'2025 г.'       |'Запрос котировок'|'#1 Победитель определен, кворум имеется'|

	* Создаем договор с поставщиком

		И я нажимаю на кнопку с именем 'ФормаОбработкаФормированиеДоговоровСПобедителямиТорговУправлениеДоговорамиЗакупки'
		Тогда открылось окно 'Формирование договоров с победителями торгов'
		И в таблице "ПобедившиеПредложенияПоставщиков" я активизирую поле с именем "ПобедившиеПредложенияПоставщиковПоставщик"
		И в таблице "ПобедившиеПредложенияПоставщиков" я нажимаю на кнопку с именем 'СоздатьДоговорПоВыбранномуПредложениюПоставщика'
		Тогда открылось окно 'С поставщиком (создание)'
	
	* Заполняем договор
		
		И в поле с именем 'Номер' я ввожу текст 'ДД1'
		И я перехожу к следующему реквизиту
		И я нажимаю кнопку выбора у поля с именем "Дата"
		И в поле с именем 'Дата' я ввожу значение переменной "$$ТекущаяДата$$"
		И я перехожу к следующему реквизиту
		И я перехожу к закладке с именем "ГруппаРасчеты"
		И я перехожу к закладке с именем "СтраницаАналитикиПланирования"
		И я перехожу к закладке с именем "СтраницаПланЗакупок"
		И я перехожу к закладке с именем "ГруппаГрафик"
		И в таблице "ГрафикРасчетов" я нажимаю на кнопку с именем 'ГрафикРассчитатьПоГрафикуПоставок'
		
	* Записываем и проводим договор

		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно 'ДД1 от * (С поставщиком) вер. * от *'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'ДД1 от * (С поставщиком) вер. * от *' в течение 20 секунд
	
	* Закрываем все окна клиентского приложения

		И я закрываю все окна клиентского приложения

Сценарий: 04.07. [ЗАПРОС КОТИРОВОК] ПТУ по договору ДД1

	* Запоминаем текущую дату
		
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		
	* Открываем список поступлений
	
		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Поступление (акты, накладные, УПД)'
		Тогда открылось окно 'Поступление (акты, накладные, УПД)'
		
	* Создаем ПТУ	
	
		И я нажимаю на кнопку с именем 'СоздатьПоступлениеТовары'
		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание)'
		
	* Организация
	
		И я нажимаю кнопку выбора у поля с именем "Организация"
		Тогда открылось окно 'Организационные единицы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Королевство Севера [223]' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание) *'
		
	* Контрагент
	
		И я нажимаю кнопку выбора у поля с именем "Контрагент"
		Тогда открылось окно 'Контрагенты'

		И я нажимаю на кнопку с именем 'ФормаСписок'

		И в таблице "Список" я перехожу к строке:
			| 'Наименование в программе' |
			| 'Поставщик2'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание) *'
		
	* Договор 
	
		И я нажимаю кнопку выбора у поля с именем "ДоговорКонтрагента"
		И в таблице "Список" я перехожу к строке:
			| 'Номер договора' |
			| 'ДД1'            |
		И в таблице "Список" я выбираю текущую строку

	* Склад

		И я нажимаю кнопку выбора у поля с именем "Склад"
		Тогда открылось окно 'Склады'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Склад1'       |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Поступление товаров: Накладная, УПД (создание) *'
		
	* Заполняем	табличную часть
	
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыУХ_ЗаполнитьПоДоговору'
		Если открылось окно '1С:Предприятие' Тогда
			И я нажимаю на кнопку с именем 'Button0'
			
	* Проверяем правильность заполнения строки
	
		Тогда таблица "Товары" стала равной:
			| 'Номенклатура' | '% НДС' | 'Количество' | 'Единица' | 'Цена'     | 'НДС'       | 'Страна происхождения'  | 'Сумма'      | 'Всего'      |
			| 'Материал1'    | '20%'   | '100,000'    | 'т'       | '1 000,00' | '16 666,67' | 'РОССИЯ'                | '100 000,00' | '100 000,00' |
			| 'Материал2'    | '20%'   | '250,000'    | 'т'       | '1 200,00' | '50 000,00' | 'РОССИЯ'                | '300 000,00' | '300 000,00' |

	* Проводим документ 
	
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Поступление товаров: Накладная, УПД (создание) *' в течение 20 секунд
	
	* Закрываем все окна клиентского приложения
			
		И я закрываю все окна клиентского приложения

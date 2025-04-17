﻿#language: ru
@tree

@UH33_Planning
@ERPUH33_Planning

Функционал: 09. Контроль лимитов в валютной ЗнО

	Как Администратор я хочу
	сформировать Заявку на оплату в валюте
	чтобы проверить пересчет сумм в контроле лимитов по плановым курсам 

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Переменные:
	ВАПроект = 'ВА - Проект 1'
	ВАЦФО = 'ВА - ЦФО 5 (ДР)'
	ВАСтатья = 'ВА - Статья 3'
	ВААналитика1 = 'ВА - МестаПоставки1'
	ВАОрганизация = 'ВА - ООО Тест'
	ВАКонтрагент = 'ВА - Поставщик1'
	ВАСуммаДокумента = '1000,00'

Сценарий: 09.00 Определеняем тип приложения

	Пусть Инициализация переменных			

Сценарий: 09.01 Установить плановые курсы валют для планирования

	* Открыть плановые курсы
		И Я открываю АРМ Управление лимитами по виду бюджета 'БДДС'
		Если открылось окно '1С:Предприятие' тогда
			И я нажимаю на кнопку с именем 'Button0'	
		И из выпадающего списка с именем "СпособОпределенияВалютыЛимитирования" я выбираю точное значение 'В валюте управленческого учета'
		И я нажимаю на кнопку с именем 'КурсыВалютДляЦелейПланирования'
					
	* Добавить курсы 
		И Я добавляю курс '100,0000' для целей планирования для валюты 'USD' на дату 'НачалоМесяца(ТекущаяДата())'
		И Я добавляю курс '110,0000' для целей планирования для валюты 'USD' на дату 'ТекущаяДата()'
	
		И Я добавляю курс '90,0000' для целей планирования для валюты 'USD' на дату 'КонецДня(ТекущаяДата()) + 1'
		И я удаляю переменную '$$КурсОплатыПлан$$'	
		И я запоминаю значение поля с именем 'Курс' таблицы 'Список' как '$$КурсОплатыПлан$$'	

		И Я добавляю курс '200,0000' для целей планирования для валюты 'EUR' на дату 'НачалоМесяца(ТекущаяДата())'
		И Я добавляю курс '210,0000' для целей планирования для валюты 'EUR' на дату 'ТекущаяДата()'
		И Я добавляю курс '190,0000' для целей планирования для валюты 'EUR' на дату 'КонецДня(ТекущаяДата()) + 1'

	* Закрыть формы
		И Я закрываю окно 'Курсы валют для целей планирования/лимитирования'

Сценарий: 09.02 Создать валютную Заявку на оплату (валют взаиморасчетов и платежа USD) 			
	
	* Создать документ Заявка на оплату
		Если '$$ЭтоУХ$$' Тогда
			И Я создаю договор для контрагента 'ВАКонтрагент' номер '09.02' дата '' ВалютаВзаиморасчетов 'USD' ВалютаПлатежа 'USD' организация 'ВАОрганизация' вид 'С поставщиком' сумма 'ВАСуммаДокумента' условие оплаты 'Аванс 100% за 1 к.д.'
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И Для партнера 'ВАКонтрагент' контрагента 'ВАКонтрагент' я создаю договор с видом 'С поставщиком' номер '09.02' от '' организация 'ВАОрганизация' ВалютаВзаиморасчетов 'USD' ВалютаПлатежа 'USD' сумма '100000' соглашение '' в 1C:ERPУХ

		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
	
	* Заполнить основные реквизиты
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И я перехожу к следующему реквизиту
		И в поле с именем "Контрагент" я ввожу значение переменной 'ВАКонтрагент'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Дата' я ввожу значение выражения 'ТекущаяДата()'
		И я перехожу к следующему реквизиту	
		И в поле с именем 'ЖелательнаяДатаПлатежа' я ввожу значение выражения 'КонецДня(ТекущаяДата()) + 1'
		И я запоминаю значение поля с именем 'ЖелательнаяДатаПлатежа' как 'ДатаОплаты'
		И я перехожу к следующему реквизиту	
		
		Если '$$ЭтоУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "ДоговорКонтрагента"
			И Я в списке "Список" по полю "Номер договора" ищу и выбираю элемент "09.02" "По точному совпадению"			
			И я перехожу к следующему реквизиту	 
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "Договор"
			И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "09.02" "По точному совпадению"			
			И я перехожу к следующему реквизиту	 
			И из выпадающего списка с именем "Подразделение" я выбираю по строке 'Автотест Подразделение'
		И в поле с именем "СуммаДокумента" я ввожу значение переменной 'ВАСуммаДокумента'
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаЛимитаВалюта'
		И я перехожу к следующему реквизиту

	* Заполнить платежные реквизиты
		Если '$$ЭтоУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "СчетКассаОрганизации"
			И в таблице "Список" я выбираю текущую строку
			И я нажимаю кнопку выбора у поля с именем "СчетКонтрагента"
			И в таблице "Список" я выбираю текущую строку
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "БанковскийСчет"
			И Я в списке "Список" по полю "Валюта" ищу и выбираю элемент "USD" "По точному совпадению"	
			И я перехожу к следующему реквизиту	 					
			И я нажимаю кнопку выбора у поля с именем "БанковскийСчетКонтрагента"
			И в таблице "Список" я выбираю текущую строку
				
	* Заполнить аналитики учета и планирования
		Если '$$ЭтоУХ$$' Тогда
			И я перехожу к закладке с именем "Движения"
			И в поле с именем "ЦФО" я ввожу значение переменной 'ВАЦФО'
			И я перехожу к следующему реквизиту
			И в поле с именем "Проект" я ввожу значение переменной 'ВАПроект'
			И я перехожу к следующему реквизиту
			И в таблице "ТаблицаДвижений" я активизирую поле с именем "ТаблицаДвиженийСтатьяДвиженияДенежныхСредств"
			И в таблице "ТаблицаДвижений" в поле с именем "ТаблицаДвиженийСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
			И я перехожу к следующему реквизиту
			Если элемент "Аналитика1" доступен для редактирования Тогда							
				И в таблице "ТаблицаДвижений" я активизирую поле с именем "Аналитика1"
				И в таблице "ТаблицаДвижений" в поле с именем "Аналитика1" я ввожу значение выражения 'ВААналитика1'
				И я перехожу к следующему реквизиту
						
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я перехожу к закладке с именем "СтраницаРасшифровка"
			И в поле с именем "ЦФО" я ввожу значение переменной 'ВАЦФО'
			И я перехожу к следующему реквизиту
			И в поле с именем "Проект" я ввожу значение переменной 'ВАПроект'
			И я перехожу к следующему реквизиту
			И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств"
			И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
			И я перехожу к следующему реквизиту
			Если элемент "РасшифровкаПлатежаАналитика1" доступен для редактирования Тогда							
				И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаАналитика1"
				И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаАналитика1" я ввожу значение выражения 'ВААналитика1'
				И я перехожу к следующему реквизиту			

	* Получить Бюджетный период и Сумму лимита
		И Я запоминаю значение выражения 'Формат(ТекущаяДата(), "ДФ=гггг")' в переменную "Год"
		И я запоминаю значение выражения 'Формат(КонецДня(ТекущаяДата()) + 1, "ДФ= ММММ")' в переменную 'МесяцПериод'
		И я удаляю переменную '$$Период$$'	
		И я запоминаю значение выражения 'Контекст.МесяцПериод + " " + Контекст.Год + " "+"г."' в переменную '$$Период$$'
		И я вывожу значение переменной "Период"		
		Если элемент формы 'Платеж в' стал равен 'RUB' тогда
			И я нажимаю на гиперссылку с именем "СтрокаПлатежнаяПозиция"
			Тогда открылось окно 'Исполнение заявки'
			И я запоминаю значение поля с именем 'СуммаКОплате' как 'СуммаЛимита'
			И Я закрываю окно 'Исполнение заявки'
		Иначе 	
			И я запоминаю значение выражения 'Формат(($СуммаЛимитаВалюта$*$$КурсОплатыПлан$$), "ЧДЦ=2")' в переменную 'СуммаЛимита'	
		
	* Проверить лимиты
		И Нарушен контроль лимитов	
		И в таблице "ТаблицаКонтроляДокумента" я активизирую поле с именем "ТаблицаКонтроляДополнительнаяИнформация"
		И в таблице "ТаблицаКонтроляДокумента" я перехожу к строке:
			| 'Вид контроля'               | 'Дополнительная информация' |
			| 'Контроль бюджетных лимитов' | 'Подробнее'                 |
		И в таблице "ТаблицаКонтроляДокумента" я выбираю текущую строку	
		И область "R6C2:R11C25" табличного документа "ТабличныйДокумент" равна по шаблону:
			| 'Вид бюджета/Период/Статья бюджета' | '' | 'Аналитики'    | 'Режим контроля' | 'ЦФО'   | 'Проект'   | 'Валюта' | 'Доступно до операции' | 'До операции' | ''                | ''         | ''          | 'Текущая операция' | 'Текущая операция' | ''                | ''              | ''          | 'В т.ч. из резерва' | 'Превышение резерва' | 'Доступно после операции' | 'После операции' | ''                | ''              | ''          |
			| ''                                  | '' | ''             | ''               | ''      | ''         | ''       | ''                     | 'Лимит'       | 'Зарезервировано' | 'Заявлено' | 'Исполнено' | ''                 | 'Лимит'            | 'Зарезервировано' | 'Заявлено'      | 'Исполнено' | ''                  | ''                   | ''                        | 'Лимит'          | 'Зарезервировано' | 'Заявлено'      | 'Исполнено' |
			| 'Бюджет движения денежных средств'  | '' | ''             | ''               | ''      | ''         | ''       | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| '$$Период$$'                        | '' | ''             | ''               | ''      | ''         | ''       | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| 'ВАСтатья'                          | '' | 'ВААналитика1' | 'Информировать'               | 'ВАЦФО' | 'ВАПроект' | 'RUB'    | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| ' '                                 | '' | ''             | ''               | ''      | ''         | ''       | ''                     | ''            | ''                | ''         | ''          | ''                 | ''                 | ''                | ''              | ''          | ''                  | ''                   | ''                        | ''               | ''                | ''              | ''          |
										
		И Я закрываю окно 'Контроль бюджетных лимитов *'
					
	* Провести документ
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я нажимаю на кнопку с именем 'ФормаПровести'

	* Проверить движения
		Если '$$ЭтоУХ$$' Тогда 
			И Я открываю движения документа с отбором по виду движений 'Операции бюджетов' в УХ
			Тогда таблица "ОперацииБюджетов" стала равной по шаблону:
				| 'N' | 'Период'               | 'Вид бюджета'                      | 'Объект планирования'                                   | 'Состояние' | 'Аналитика структуры'                  | 'Аналитика статей бюджетов'                                   | 'Аналитика партнеров'                             | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'               | 'Лимит'         | 'Сумма исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования'  | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
				| '1' | '$ДатаОплаты$ 0:00:00' | 'Бюджет движения денежных средств' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | ''          | '$ВАЦФО$; $ВАПроект$; $ВАОрганизация$' | '$ВАСтатья$ ($ВААналитика1$;  - ;  - ;  - ;  - ;  - ) Расход' | '$ВАОрганизация$; $ВАКонтрагент$; 09.02*; 09.02*' | 'Расход'        | 'USD'    | 'RUB'                  | '$СуммаЛимитаВалюта$' | '$СуммаЛимита$' | ''                | ''                | ''                | 'Нет'                   | '$$КурсОплатыПлан$$' | '1'                      | '1,0000'             | '1'                       | ''                        |
															
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И Я открываю движения документа с отбором по виду движений 'Регистр накопления Операции бюджетов' в ЕРП УХ
			И Таблица 'Список' содержит '1' строк из списка:
				| 'Период'               | 'Регистратор'                                           | 'Номер строки' | 'Вид бюджета'                      | 'Объект планирования'                                   | 'Приход расход' | 'Аналитика структуры'                  | 'Аналитика статей бюджетов'                                   | 'Аналитика потребностей' | 'Аналитика номенклатуры' | 'Аналитика партнеров'                             | 'Аналитика поставки' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'               | 'Количество' | 'Лимит'         | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс планирования'  | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' |
				| '$ДатаОплаты$ 0:00:00' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | '1'            | 'Бюджет движения денежных средств' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | 'Расход'        | '$ВАЦФО$; $ВАПроект$; $ВАОрганизация$' | '$ВАСтатья$ ($ВААналитика1$;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | '$ВАОрганизация$; $ВАКонтрагент$; 09.02*; 09.02*' | ''                   | 'USD'    | 'RUB'                  | '$СуммаЛимитаВалюта$' | ''           | '$СуммаЛимита$' | ''                | ''                     | ''                | ''                | '$$КурсОплатыПлан$$' | '1'                      | '1,0000'             | '1'                       |
								
		И В панели открытых я выбираю 'Заявка на оплату *'			
		И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
		И я закрываю все окна клиентского приложения

Сценарий: 09.03 Создать валютную Заявку на оплату (валют взаиморасчетов USD и платежа EUR) 			
	
	* Создать документ Заявка на оплату
		Если '$$ЭтоУХ$$' Тогда
			И Я создаю договор для контрагента 'ВАКонтрагент' номер '09.03' дата '' ВалютаВзаиморасчетов 'USD' ВалютаПлатежа 'EUR' организация 'ВАОрганизация' вид 'С поставщиком' сумма 'ВАСуммаДокумента' условие оплаты 'Аванс 100% за 1 к.д.'
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И Для партнера 'ВАКонтрагент' контрагента 'ВАКонтрагент' я создаю договор с видом 'С поставщиком' номер '09.03' от '' организация 'ВАОрганизация' ВалютаВзаиморасчетов 'USD' ВалютаПлатежа 'EUR' сумма '100000' соглашение '' в 1C:ERPУХ

		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
	
	* Заполнить основные реквизиты
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И я перехожу к следующему реквизиту
		И в поле с именем "Контрагент" я ввожу значение переменной 'ВАКонтрагент'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Дата' я ввожу значение выражения 'ТекущаяДата()'
		И я перехожу к следующему реквизиту	
		И в поле с именем 'ЖелательнаяДатаПлатежа' я ввожу значение выражения 'КонецДня(ТекущаяДата()) + 1'
		И я запоминаю значение поля с именем 'ЖелательнаяДатаПлатежа' как 'ДатаОплаты'
		И я перехожу к следующему реквизиту	
		
		Если '$$ЭтоУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "ДоговорКонтрагента"
			И Я в списке "Список" по полю "Номер договора" ищу и выбираю элемент "09.03" "По точному совпадению"			
			И я перехожу к следующему реквизиту	 
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "Договор"
			И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "09.03" "По точному совпадению"			
			И я перехожу к следующему реквизиту	 
			И из выпадающего списка с именем "Подразделение" я выбираю по строке 'Автотест Подразделение'
		И в поле с именем "СуммаДокумента" я ввожу значение переменной 'ВАСуммаДокумента'
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаЛимитаВалюта'
		И я перехожу к следующему реквизиту

	* Заполнить платежные реквизиты
		Если '$$ЭтоУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "СчетКассаОрганизации"
			И в таблице "Список" я выбираю текущую строку
			И я нажимаю кнопку выбора у поля с именем "СчетКонтрагента"
			И в таблице "Список" я выбираю текущую строку
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "БанковскийСчет"
			И Я в списке "Список" по полю "Валюта" ищу и выбираю элемент "EUR" "По точному совпадению"	
			И я перехожу к следующему реквизиту
			И я нажимаю кнопку выбора у поля с именем "БанковскийСчетКонтрагента"
			И в таблице "Список" я выбираю текущую строку
				
	* Заполнить аналитики учета и планирования
		Если '$$ЭтоУХ$$' Тогда
			И я перехожу к закладке с именем "Движения"
			И в поле с именем "ЦФО" я ввожу значение переменной 'ВАЦФО'
			И я перехожу к следующему реквизиту
			И в поле с именем "Проект" я ввожу значение переменной 'ВАПроект'
			И я перехожу к следующему реквизиту
			И в таблице "ТаблицаДвижений" я активизирую поле с именем "ТаблицаДвиженийСтатьяДвиженияДенежныхСредств"
			И в таблице "ТаблицаДвижений" в поле с именем "ТаблицаДвиженийСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
			И я перехожу к следующему реквизиту
			Если элемент "Аналитика1" доступен для редактирования Тогда							
				И в таблице "ТаблицаДвижений" я активизирую поле с именем "Аналитика1"
				И в таблице "ТаблицаДвижений" в поле с именем "Аналитика1" я ввожу значение выражения 'ВААналитика1'
				И я перехожу к следующему реквизиту
						
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я перехожу к закладке с именем "СтраницаРасшифровка"
			И в поле с именем "ЦФО" я ввожу значение переменной 'ВАЦФО'
			И я перехожу к следующему реквизиту
			И в поле с именем "Проект" я ввожу значение переменной 'ВАПроект'
			И я перехожу к следующему реквизиту
			И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств"
			И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
			И я перехожу к следующему реквизиту
			Если элемент "РасшифровкаПлатежаАналитика1" доступен для редактирования Тогда							
				И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаАналитика1"
				И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаАналитика1" я ввожу значение выражения 'ВААналитика1'
				И я перехожу к следующему реквизиту			

	* Получить Бюджетный период и Сумму лимита
		И Я запоминаю значение выражения 'Формат(ТекущаяДата(), "ДФ=гггг")' в переменную "Год"
		И я запоминаю значение выражения 'Формат(КонецДня(ТекущаяДата()) + 1, "ДФ= ММММ")' в переменную 'МесяцПериод'
		И я удаляю переменную '$$Период$$'	
		И я запоминаю значение выражения 'Контекст.МесяцПериод + " " + Контекст.Год + " "+"г."' в переменную '$$Период$$'
		И я вывожу значение переменной "Период"
		Если элемент формы 'Платеж в' стал равен 'RUB' тогда
			И я нажимаю на гиперссылку с именем "СтрокаПлатежнаяПозиция"
			Тогда открылось окно 'Исполнение заявки'
			И я запоминаю значение поля с именем 'СуммаКОплате' как 'СуммаЛимита'
			И Я закрываю окно 'Исполнение заявки'
		Иначе 	
			И я запоминаю значение выражения 'Формат(($СуммаЛимитаВалюта$*$$КурсОплатыПлан$$), "ЧДЦ=2")' в переменную 'СуммаЛимита'	
		
	* Проверить лимиты
		И Нарушен контроль лимитов	
		И в таблице "ТаблицаКонтроляДокумента" я активизирую поле с именем "ТаблицаКонтроляДополнительнаяИнформация"
		И в таблице "ТаблицаКонтроляДокумента" я перехожу к строке:
			| 'Вид контроля'               | 'Дополнительная информация' |
			| 'Контроль бюджетных лимитов' | 'Подробнее'                 |
		И в таблице "ТаблицаКонтроляДокумента" я выбираю текущую строку	
		И область "R6C2:R11C25" табличного документа "ТабличныйДокумент" равна по шаблону:
			| 'Вид бюджета/Период/Статья бюджета' | '' | 'Аналитики'    | 'Режим контроля' | 'ЦФО'   | 'Проект'   | 'Валюта' | 'Доступно до операции' | 'До операции' | ''                | ''         | ''          | 'Текущая операция' | 'Текущая операция' | ''                | ''              | ''          | 'В т.ч. из резерва' | 'Превышение резерва' | 'Доступно после операции' | 'После операции' | ''                | ''              | ''          |
			| ''                                  | '' | ''             | ''               | ''      | ''         | ''       | ''                     | 'Лимит'       | 'Зарезервировано' | 'Заявлено' | 'Исполнено' | ''                 | 'Лимит'            | 'Зарезервировано' | 'Заявлено'      | 'Исполнено' | ''                  | ''                   | ''                        | 'Лимит'          | 'Зарезервировано' | 'Заявлено'      | 'Исполнено' |
			| 'Бюджет движения денежных средств'  | '' | ''             | ''               | ''      | ''         | ''       | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| '$$Период$$'                        | '' | ''             | ''               | ''      | ''         | ''       | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| 'ВАСтатья'                          | '' | 'ВААналитика1' | 'Информировать'  | 'ВАЦФО' | 'ВАПроект' | 'RUB'    | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| ' '                                 | '' | ''             | ''               | ''      | ''         | ''       | ''                     | ''            | ''                | ''         | ''          | ''                 | ''                 | ''                | ''              | ''          | ''                  | ''                   | ''                        | ''               | ''                | ''              | ''          |
										
		И Я закрываю окно 'Контроль бюджетных лимитов *'
					
	* Провести документ
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я нажимаю на кнопку с именем 'ФормаПровести'

	* Проверить движения
		Если '$$ЭтоУХ$$' Тогда 
			И Я открываю движения документа с отбором по виду движений 'Операции бюджетов' в УХ
			Тогда таблица "ОперацииБюджетов" стала равной по шаблону:
				| 'N' | 'Период'               | 'Вид бюджета'                      | 'Объект планирования'                                   | 'Состояние' | 'Аналитика структуры'                  | 'Аналитика статей бюджетов'                                   | 'Аналитика партнеров'                             | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'               | 'Лимит'         | 'Сумма исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс планирования'  | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
				| '1' | '$ДатаОплаты$ 0:00:00' | 'Бюджет движения денежных средств' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | ''          | '$ВАЦФО$; $ВАПроект$; $ВАОрганизация$' | '$ВАСтатья$ ($ВААналитика1$;  - ;  - ;  - ;  - ;  - ) Расход' | '$ВАОрганизация$; $ВАКонтрагент$; 09.03*; 09.03*' | 'Расход'        | 'USD'    | 'RUB'                  | '$СуммаЛимитаВалюта$' | '$СуммаЛимита$' | ''                | ''                | ''                | 'Да'                    | '$$КурсОплатыПлан$$' | '1'                      | '1,0000'             | '1'                       | ''                        |
					
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И Я открываю движения документа с отбором по виду движений 'Регистр накопления Операции бюджетов' в ЕРП УХ
			И Таблица 'Список' содержит '1' строк из списка:
				| 'Период'               | 'Регистратор'                                           | 'Номер строки' | 'Вид бюджета'                      | 'Объект планирования'                                   | 'Приход расход' | 'Аналитика структуры'                  | 'Аналитика статей бюджетов'                                   | 'Аналитика потребностей' | 'Аналитика номенклатуры' | 'Аналитика партнеров'                             | 'Аналитика поставки' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'               | 'Количество' | 'Лимит'         | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс планирования'  | 'Кратность планирования' | 'Курс лимитирования' | 'Кратность лимитирования' |
				| '$ДатаОплаты$ 0:00:00' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | '1'            | 'Бюджет движения денежных средств' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | 'Расход'        | '$ВАЦФО$; $ВАПроект$; $ВАОрганизация$' | '$ВАСтатья$ ($ВААналитика1$;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | '$ВАОрганизация$; $ВАКонтрагент$; 09.03*; 09.03*' | ''                   | 'USD'    | 'RUB'                  | '$СуммаЛимитаВалюта$' | ''           | '$СуммаЛимита$' | ''                | ''                     | ''                | ''                | '$$КурсОплатыПлан$$' | '1'                      | '1,0000'             | '1'                       |
		
		И В панели открытых я выбираю 'Заявка на оплату *'			
		И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
		И я закрываю все окна клиентского приложения

Сценарий: 09.04 Создать валютную Заявку на оплату (валют взаиморасчетов USD и платежа RUB) 			
	
	* Создать документ Заявка на оплату
		Если '$$ЭтоУХ$$' Тогда
			И Я создаю договор для контрагента 'ВАКонтрагент' номер '09.04' дата '' ВалютаВзаиморасчетов 'USD' ВалютаПлатежа 'RUB' организация 'ВАОрганизация' вид 'С поставщиком' сумма 'ВАСуммаДокумента' условие оплаты 'Аванс 100% за 1 к.д.'
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И Для партнера 'ВАКонтрагент' контрагента 'ВАКонтрагент' я создаю договор с видом 'С поставщиком' номер '09.04' от '' организация 'ВАОрганизация' ВалютаВзаиморасчетов 'USD' ВалютаПлатежа 'RUB' сумма '100000' соглашение '' в 1C:ERPУХ

		И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
	
	* Заполнить основные реквизиты
		И в поле с именем "Организация" я ввожу значение переменной 'ВАОрганизация'
		И я перехожу к следующему реквизиту
		И в поле с именем "Контрагент" я ввожу значение переменной 'ВАКонтрагент'
		И я перехожу к следующему реквизиту
		И в поле с именем 'Дата' я ввожу значение выражения 'ТекущаяДата()'
		И я перехожу к следующему реквизиту	
		И в поле с именем 'ЖелательнаяДатаПлатежа' я ввожу значение выражения 'КонецДня(ТекущаяДата()) + 1'
		И я запоминаю значение поля с именем 'ЖелательнаяДатаПлатежа' как 'ДатаОплаты'
		И я перехожу к следующему реквизиту	
		
		Если '$$ЭтоУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "ДоговорКонтрагента"
			И Я в списке "Список" по полю "Номер договора" ищу и выбираю элемент "09.04" "По точному совпадению"			
			И я перехожу к следующему реквизиту	 
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "Договор"
			И Я в списке "Список" по полю "Номер" ищу и выбираю элемент "09.04" "По точному совпадению"			
			И я перехожу к следующему реквизиту	 
			И из выпадающего списка с именем "Подразделение" я выбираю по строке 'Автотест Подразделение'
		И в поле с именем "СуммаДокумента" я ввожу значение переменной 'ВАСуммаДокумента'
		И я запоминаю значение поля с именем 'СуммаДокумента' как 'СуммаЛимитаВалюта'
		И я перехожу к следующему реквизиту

	* Заполнить платежные реквизиты
		Если '$$ЭтоУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "СчетКассаОрганизации"
			И в таблице "Список" я выбираю текущую строку
			И я нажимаю кнопку выбора у поля с именем "СчетКонтрагента"
			И в таблице "Список" я выбираю текущую строку
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я нажимаю кнопку выбора у поля с именем "БанковскийСчет"
			И Я в списке "Список" по полю "Валюта" ищу и выбираю элемент "RUB" "По точному совпадению"	
			И я перехожу к следующему реквизиту
			И я нажимаю кнопку выбора у поля с именем "БанковскийСчетКонтрагента"
			И в таблице "Список" я выбираю текущую строку
				
	* Заполнить аналитики учета и планирования
		Если '$$ЭтоУХ$$' Тогда
			И я перехожу к закладке с именем "Движения"
			И в поле с именем "ЦФО" я ввожу значение переменной 'ВАЦФО'
			И я перехожу к следующему реквизиту
			И в поле с именем "Проект" я ввожу значение переменной 'ВАПроект'
			И я перехожу к следующему реквизиту
			И в таблице "ТаблицаДвижений" я активизирую поле с именем "ТаблицаДвиженийСтатьяДвиженияДенежныхСредств"
			И в таблице "ТаблицаДвижений" в поле с именем "ТаблицаДвиженийСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
			И я перехожу к следующему реквизиту
			Если элемент "Аналитика1" доступен для редактирования Тогда							
				И в таблице "ТаблицаДвижений" я активизирую поле с именем "Аналитика1"
				И в таблице "ТаблицаДвижений" в поле с именем "Аналитика1" я ввожу значение выражения 'ВААналитика1'
				И я перехожу к следующему реквизиту
						
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И я перехожу к закладке с именем "СтраницаРасшифровка"
			И в поле с именем "ЦФО" я ввожу значение переменной 'ВАЦФО'
			И я перехожу к следующему реквизиту
			И в поле с именем "Проект" я ввожу значение переменной 'ВАПроект'
			И я перехожу к следующему реквизиту
			И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств"
			И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаСтатьяДвиженияДенежныхСредств" я ввожу значение выражения 'ВАСтатья'
			И я перехожу к следующему реквизиту
			Если элемент "РасшифровкаПлатежаАналитика1" доступен для редактирования Тогда							
				И в таблице "РасшифровкаПлатежа" я активизирую поле с именем "РасшифровкаПлатежаАналитика1"
				И в таблице "РасшифровкаПлатежа" в поле с именем "РасшифровкаПлатежаАналитика1" я ввожу значение выражения 'ВААналитика1'
				И я перехожу к следующему реквизиту			

	* Получить Бюджетный период и Сумму лимита
		И Я запоминаю значение выражения 'Формат(ТекущаяДата(), "ДФ=гггг")' в переменную "Год"
		И я запоминаю значение выражения 'Формат(КонецДня(ТекущаяДата()) + 1, "ДФ= ММММ")' в переменную 'МесяцПериод'
		И я удаляю переменную '$$Период$$'	
		И я запоминаю значение выражения 'Контекст.МесяцПериод + " " + Контекст.Год + " "+"г."' в переменную '$$Период$$'
		И я вывожу значение переменной "Период"
		Если элемент формы 'Платеж в' стал равен 'RUB' тогда
			И я нажимаю на гиперссылку с именем "СтрокаПлатежнаяПозиция"
			Тогда открылось окно 'Исполнение заявки'
			И я запоминаю значение поля с именем 'СуммаКОплате' как 'СуммаЛимита'
			И Я закрываю окно 'Исполнение заявки'					
		Иначе 	
			И я запоминаю значение выражения 'Формат(($СуммаЛимитаВалюта$*$$КурсОплатыПлан$$), "ЧДЦ=2")' в переменную 'СуммаЛимита'	
		
	* Проверить лимиты
		И Нарушен контроль лимитов	
		И в таблице "ТаблицаКонтроляДокумента" я активизирую поле с именем "ТаблицаКонтроляДополнительнаяИнформация"
		И в таблице "ТаблицаКонтроляДокумента" я перехожу к строке:
			| 'Вид контроля'               | 'Дополнительная информация' |
			| 'Контроль бюджетных лимитов' | 'Подробнее'                 |
		И в таблице "ТаблицаКонтроляДокумента" я выбираю текущую строку	
		И область "R6C2:R11C25" табличного документа "ТабличныйДокумент" равна по шаблону:
			| 'Вид бюджета/Период/Статья бюджета' | '' | 'Аналитики'    | 'Режим контроля' | 'ЦФО'   | 'Проект'   | 'Валюта' | 'Доступно до операции' | 'До операции' | ''                | ''         | ''          | 'Текущая операция' | 'Текущая операция' | ''                | ''              | ''          | 'В т.ч. из резерва' | 'Превышение резерва' | 'Доступно после операции' | 'После операции' | ''                | ''              | ''          |
			| ''                                  | '' | ''             | ''               | ''      | ''         | ''       | ''                     | 'Лимит'       | 'Зарезервировано' | 'Заявлено' | 'Исполнено' | ''                 | 'Лимит'            | 'Зарезервировано' | 'Заявлено'      | 'Исполнено' | ''                  | ''                   | ''                        | 'Лимит'          | 'Зарезервировано' | 'Заявлено'      | 'Исполнено' |
			| 'Бюджет движения денежных средств'  | '' | ''             | ''               | ''      | ''         | ''       | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| '$$Период$$'                        | '' | ''             | ''               | ''      | ''         | ''       | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| 'ВАСтатья'                          | '' | 'ВААналитика1' | 'Информировать'               | 'ВАЦФО' | 'ВАПроект' | 'RUB'    | '-'                    | '-'           | '-'               | '-'        | '-'         | '-$СуммаЛимита$'   | '-'                | '-'               | '$СуммаЛимита$' | '-'         | '-'                 | '-'                  | '-$СуммаЛимита$'          | '-'              | '-'               | '$СуммаЛимита$' | '-'         |
			| ' '                                 | '' | ''             | ''               | ''      | ''         | ''       | ''                     | ''            | ''                | ''         | ''          | ''                 | ''                 | ''                | ''              | ''          | ''                  | ''                   | ''                        | ''               | ''                | ''              | ''          |
										
		И Я закрываю окно 'Контроль бюджетных лимитов *'
					
	* Провести документ
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я нажимаю на кнопку с именем 'ФормаПровести'

	* Проверить движения
		Если '$$ЭтоУХ$$' Тогда 
			И Я открываю движения документа с отбором по виду движений 'Операции бюджетов' в УХ
			Тогда таблица "ОперацииБюджетов" стала равной по шаблону:
				| 'N' | 'Период'               | 'Вид бюджета'                      | 'Объект планирования'                                   | 'Состояние' | 'Аналитика структуры'                  | 'Аналитика статей бюджетов'                                   | 'Аналитика партнеров'                             | 'Приход расход' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'               | 'Лимит'         | 'Сумма исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс задан в операции' | 'Курс лимитирования' | 'Кратность лимитирования' | 'Корректировка документа' |
				| '1' | '$ДатаОплаты$ 0:00:00' | 'Бюджет движения денежных средств' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | ''          | '$ВАЦФО$; $ВАПроект$; $ВАОрганизация$' | '$ВАСтатья$ ($ВААналитика1$;  - ;  - ;  - ;  - ;  - ) Расход' | '$ВАОрганизация$; $ВАКонтрагент$; 09.04*; 09.04*' | 'Расход'        | 'USD'    | 'RUB'                  | '$СуммаЛимитаВалюта$' | '$СуммаЛимита$' | ''                | ''                | ''                | 'Да'                    | '1,0000'             | '1'                       | ''                        |
					
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
			И Я открываю движения документа с отбором по виду движений 'Регистр накопления Операции бюджетов' в ЕРП УХ
			И Таблица 'Список' содержит '1' строк из списка:
				| 'Период'               | 'Регистратор'                                           | 'Номер строки' | 'Вид бюджета'                      | 'Объект планирования'                                   | 'Приход расход' | 'Аналитика структуры'                  | 'Аналитика статей бюджетов'                                   | 'Аналитика потребностей' | 'Аналитика номенклатуры' | 'Аналитика партнеров'                             | 'Аналитика поставки' | 'Валюта' | 'Валюта лимитирования' | 'Сумма'               | 'Количество' | 'Лимит'         | 'Сумма исполнено' | 'Количество исполнено' | 'Лимит исполнено' | 'Источник версии' | 'Курс лимитирования' | 'Кратность лимитирования' |
				| '$ДатаОплаты$ 0:00:00' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | '1'            | 'Бюджет движения денежных средств' | 'Заявка на оплату *; $ВАКонтрагент$; Оплата поставщику' | 'Расход'        | '$ВАЦФО$; $ВАПроект$; $ВАОрганизация$' | '$ВАСтатья$ ($ВААналитика1$;  - ;  - ;  - ;  - ;  - ) Расход' | ''                       | ''                       | '$ВАОрганизация$; $ВАКонтрагент$; 09.04*; 09.04*' | ''                   | 'USD'    | 'RUB'                  | '$СуммаЛимитаВалюта$' | ''           | '$СуммаЛимита$' | ''                | ''                     | ''                | ''                | '1,0000'             | '1'                       |
					
		И В панели открытых я выбираю 'Заявка на оплату *'			
		И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
		И я закрываю все окна клиентского приложения
﻿#language: ru
@tree

@UH33_Treasury

Функционал: 05. Оплата платежных поручений

	Как бизнес-аналитик я хочу
	проверить работоспособность документа платежное поручение
	чтобы исключить ошибки при оплате заявок на оплату

Контекст:
	
	И я подключаю TestClient "УХ - Казначейство" логин "Администратор" пароль ""
	И Я закрыл все окна клиентского приложения

Сценарий: 05.1. Генерация платежных поручения

	И Я запоминаю значение выражения 'СокрЛП(НачалоГода(ТекущаяДата()))' в переменную "НачалоГода"
	И Я запоминаю значение выражения 'СокрЛП(КонецГода(ТекущаяДата()))' в переменную "КонецГода"	
	
	И В командном интерфейсе я выбираю 'Казначейство' 'Генерация платежных поручений'
	Тогда открылось окно 'Генерация платежных поручений'
	
	И в поле с именем 'НачалоПериода' я ввожу значение переменной "НачалоГода"
	И я перехожу к следующему реквизиту
	
	И в поле с именем 'КонецПериода' я ввожу значение переменной "КонецГода"
	И я перехожу к следующему реквизиту
	
	И в таблице "ЗаявкиКИсполнениюДерево" я нажимаю на кнопку с именем 'ЗаявкиКИсполнениюОтметитьВсе'
	
	И я нажимаю на кнопку с именем 'СоздатьПлатежныеПоручения'
	И Я закрываю окно 'Генерация платежных поручений'

Сценарий: 05.2. Оплата платежных поручений

	* Открываем форму списка Платежные поручения
	
		И В командном интерфейсе я выбираю 'Казначейство' 'Платежные поручения'
		Тогда открылось окно 'Платежные поручения'
		
		#И в таблице 'Список' я выделяю все строки
		#И я нажимаю на кнопку с именем 'ОплатаПоставщикам'
	
	* Оплата поставщику, 0000-000001
	

		И в таблице "Список" я перехожу к строке:
			| 'Вид операции' | 'Организация'             | 'Получатель'  | 'Состояние'    | 'Сумма'    |
			| 'Оплата поставщику' | 'Королевство Гор и Долин' | 'Поставщик1' | 'Подготовлено' | '1 000,00' |
			
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Платежное поручение * от *'

		И из выпадающего списка с именем "Состояние" я выбираю точное значение 'Оплачено'
		
		И я нажимаю на гиперссылку с именем "НадписьДокументСписания"
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Списание с расчетного счета (создание)' в течение 20 секунд
		Тогда открылось окно 'Платежное поручение * от *'
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Платежное поручение * от *' в течение 20 секунд

	* Возврат покупателю, 0000-000002
	
		Когда открылось окно 'Платежные поручения'
		И в таблице "Список" я перехожу к строке:
			| 'Вид операции'  | 'Организация'             | 'Получатель'  | 'Состояние'    | 'Сумма'  |
			| 'Возврат покупателю' | 'Королевство Гор и Долин' | 'Покупатель1' | 'Подготовлено' | '600,00' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Платежное поручение * от *'
		
		И из выпадающего списка с именем "Состояние" я выбираю точное значение 'Оплачено'
		
		И я нажимаю на гиперссылку с именем "НадписьДокументСписания"
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Списание с расчетного счета (создание)' в течение 20 секунд
		Тогда открылось окно 'Платежное поручение * от *'
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Платежное поручение * от *' в течение 20 секунд

	* Уплата налога, 0000-000003
	
		Когда открылось окно 'Платежные поручения'
		И в таблице "Список" я перехожу к строке:
			| 'Вид операции' | 'Организация'             | 'Получатель'          | 'Состояние'    | 'Сумма'  |
			| 'Уплата налога'     | 'Королевство Гор и Долин' | 'МИ ФНС России по управлению долгом' | 'Подготовлено' | '400,00' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Платежное поручение * от *'
		
		И из выпадающего списка с именем "Состояние" я выбираю точное значение 'Оплачено'

		И я нажимаю на гиперссылку с именем "НадписьРеквизитыПлатежейВБюджет"
		Тогда открылось окно 'Реквизиты платежа'
		И в поле с именем 'КодТерритории8' я ввожу текст '45000000'
		И из выпадающего списка с именем "СтатусПлательщика" я выбираю точное значение '01 - налогоплательщик (плательщик сборов, страховых взносов и иных платежей, администрируемых налоговыми органами)'
		И из выпадающего списка с именем "ОснованиеПлатежа" я выбираю точное значение 'ТП - платежи текущего года'
		И я нажимаю на кнопку с именем 'КнопкаОК'
					
		И я нажимаю на гиперссылку с именем "НадписьДокументСписания"
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Списание с расчетного счета (создание)' в течение 20 секунд
		Тогда открылось окно 'Платежное поручение * от *'
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Платежное поручение *от *' в течение 20 секунд
		
	* Возврат займа контрагенту, 0000-000004

		И в таблице "Список" я перехожу к строке:
			| 'Вид операции'         | 'Организация'             | 'Получатель'  | 'Состояние'    | 'Сумма'      |
			| 'Возврат займа контрагенту' | 'Королевство Гор и Долин' | 'Контрагент1' | 'Подготовлено' | '100 000,00' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Платежное поручение * от *'
		
		И из выпадающего списка с именем "Состояние" я выбираю точное значение 'Оплачено'
		
		И я нажимаю на гиперссылку с именем "НадписьДокументСписания"
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Списание с расчетного счета (создание)' в течение 20 секунд
		Тогда открылось окно 'Платежное поручение * от *'
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Платежное поручение * от *' в течение 20 секунд
	
	* Возврат кредита банку, 0000-000005 
	
		И в таблице "Список" я перехожу к строке:
			| 'Вид операции'     | 'Организация'             | 'Получатель' | 'Состояние'    | 'Сумма'      |
			| 'Возврат кредита банку' | 'Королевство Гор и Долин' | 'Банк1'      | 'Подготовлено' | '100 000,00' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Платежное поручение * от *'
		
		И из выпадающего списка с именем "Состояние" я выбираю точное значение 'Оплачено'
		
		И я нажимаю на гиперссылку с именем "НадписьДокументСписания"
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Списание с расчетного счета (создание)' в течение 20 секунд
		Тогда открылось окно 'Платежное поручение * от *'
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Платежное поручение * от *' в течение 20 секунд

	* Прочие расчеты с контрагентами, 0000-000006 

		И в таблице "Список" я перехожу к строке:
			| 'Вид операции'              | 'Организация'             | 'Получатель'  | 'Состояние'    | 'Сумма'      |
			| 'Прочие платежи контрагенту' | 'Королевство Гор и Долин' | 'Контрагент1' | 'Подготовлено' | '100,00' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Платежное поручение * от *'
		
		И из выпадающего списка с именем "Состояние" я выбираю точное значение 'Оплачено'
		
		И я нажимаю на гиперссылку с именем "НадписьДокументСписания"
		Тогда открылось окно 'Списание с расчетного счета (создание)'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Списание с расчетного счета (создание)' в течение 20 секунд
		Тогда открылось окно 'Платежное поручение * от *'
		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Платежное поручение * от *' в течение 20 секунд

	
	* Закрываем форму списка
	
		Тогда открылось окно 'Платежные поручения'
		И Я закрываю окно 'Платежные поручения'

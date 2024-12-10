﻿#language: ru
@tree

@UH33_Budget
@ERPUH33_Budget
@Perform_Budget

Функционал: 14. Проверка отображения протокола

	Как Администратор я хочу
	Проверить что протокол расчета отображается
	чтобы пользователь видел протокол расчета

Контекст: 

	И я закрыл все окна клиентского приложения	

Сценарий: 14.00 Определение типа приложения

	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	Пусть Инициализация переменных

Сценарий: 14.01 Создание вида отчета "ВА - Протокол расчета"

	И Я создаю вид отчета с именем "ВА - Протокол расчета" и родителем "ВА - Группа отчетов"

	* Редактируем структуру отчета
		И Я открываю контруктор отчета с именем "ВА - Протокол расчета"
		И Я в конструкторе отчета добавляю строку с именем "СтрокаОтчета"
		И Я в конструкторе отчета добавляю колонку с именем "Сумма"
	
	* Вводим формулы расчета
		Тогда открылось окно "Конструктор отчета"
		И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ПроизвольныйКод'
		И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст 
			|'Результат = 123;'|
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		И Я закрываю окно "Конструктор отчета"				

	И Я Для вида отчета "ВА - Протокол расчета" создаю бланк по умолчанию
	И Я для вида отчета "ВА - Протокол расчета" создаю бланк сводной таблицы по умолчанию с отборами ''	

Сценарий: 14.02 Настройка прав для пользователя "Бюджетирование1"

	И Я добавляю право "Чтение, запись" для вида отчета "ВА - Протокол расчета" пользователя "Бюджетирование1" по всем организациям
	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Бюджетирование1" пароль ''

Сценарий: 14.03 Создание экземпляра отчета "ВА - Протокол расчета" для организации "Меркурий ООО"	

	И Я создаю экземпляр отчета для вида отчета "ВА - Протокол расчета" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Меркурий ООО" проект '' аналитики '' '' '' '' '' ''

	* Запишем документ
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Записать'				

	* Расчитаем документ
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'		

	* Сверяем результат
		Когда открылось окно '$ЗаголовокОкна$'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Протокол расчета" | ''               | ''                | ''             | ''      |
			| ''                      | ''               | ''                | ''             | ''      |
			| ''                      | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО" |
			| ''                      | "Сумма"          | "Сумма"           | "Сумма"        | "Сумма" |
			| "СтрокаОтчета"          | '123'            | '123'             | '123'          | '369'   |
		
	* Закроем не сохраняя
		Когда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 14.04 Создание экземпляра отчета "ВА - Протокол расчета" для организации "Земля ООО"	

	И Я создаю экземпляр отчета для вида отчета "ВА - Протокол расчета" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Земля ООО" проект '' аналитики '' '' '' '' '' ''

	* Запишем документ
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Записать'				

	* Расчитаем документ
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'
		Когда открылось окно "Протокол"
		Тогда табличный документ 'ПолеТабличногоДокумента' равен:
			| "Дополнительная информация"                                                                                                                                                                                    | ''           |
			| "Из расчета исключен заблокированный период по параметрам:\n	Период: \"Январь 2024 г.\"\n	Регламент: \"ВА - Основной регламент\",\n	Сценарий: \"ВА - Основной сценарий\",\n	Организация: \"Земля ООО\""  | "Информация" |
			| "Из расчета исключен заблокированный период по параметрам:\n	Период: \"Февраль 2024 г.\"\n	Регламент: \"ВА - Основной регламент\",\n	Сценарий: \"ВА - Основной сценарий\",\n	Организация: \"Земля ООО\""  | "Информация" |
		И я нажимаю на кнопку с именем 'ФормаТехническаяИнформация'
		И Я закрываю окно "Протокол"	

	* Сверяем результат
		Когда открылось окно '$ЗаголовокОкна$'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Протокол расчета" | ''               | ''                | ''             | ''      |
			| ''                      | ''               | ''                | ''             | ''      |
			| ''                      | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО" |
			| ''                      | "Сумма"          | "Сумма"           | "Сумма"        | "Сумма" |
			| "СтрокаОтчета"          | '0'              | '0'               | '123'          | '123'   |
		
	* Закроем не сохраняя
		Когда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button1'
				
Сценарий: 14.05 Выполняем расчет экземплятров отчетов из списка

	И Я нахожу в списке вид отчета с именем "ВА - Протокол расчета"
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовОткрытьСписокЭкземпляров'
	
	* Выполняем расчет
		Тогда открылось окно "Экземпляры отчетов"
		И в таблице 'Список' я выделяю все строки
		И я нажимаю на кнопку с именем 'ИмпортДанных'
		
	* Проверяем протокол
		Тогда открылось окно "Протокол"
		Тогда табличный документ 'ПолеТабличногоДокумента' равен:
			| "Дополнительная информация"                                                                                                                                                                                    | ''           |
			| "Из расчета исключен заблокированный период по параметрам:\n	Период: \"Январь 2024 г.\"\n	Регламент: \"ВА - Основной регламент\",\n	Сценарий: \"ВА - Основной сценарий\",\n	Организация: \"Земля ООО\""  | "Информация" |
			| "Из расчета исключен заблокированный период по параметрам:\n	Период: \"Февраль 2024 г.\"\n	Регламент: \"ВА - Основной регламент\",\n	Сценарий: \"ВА - Основной сценарий\",\n	Организация: \"Земля ООО\""  | "Информация" |
		И я нажимаю на кнопку с именем 'ФормаТехническаяИнформация'
		И Я закрываю окно "Протокол"

	* Проверяем расчет для "Меркурий ООО"
		Тогда открылось окно "Экземпляры отчетов"
		И в таблице 'Список' я перехожу к строке:
			| "Основная валюта" | "Вид отчета"            | "Организация"  | "Период отчета"  | "Период окончания" | "Сценарий"               |
			| 'RUB'             | "ВА - Протокол расчета" | "Меркурий ООО" | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда Открылся экземпляр отчета для вида отчета "ВА - Протокол расчета" валюта 'RUB' организация "Меркурий ООО" сценарий "ВА - Основной сценарий" периодичность "Месяц" проект '' аналитики '' '' '' '' '' '' 
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Протокол расчета" | ''               | ''                | ''             | ''      |
			| ''                      | ''               | ''                | ''             | ''      |
			| ''                      | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО" |
			| ''                      | "Сумма"          | "Сумма"           | "Сумма"        | "Сумма" |
			| "СтрокаОтчета"          | '123'            | '123'             | '123'          | '369'   |
		Когда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'				
		
	* Проверяем расчет для "Меркурий ООО"
		Тогда открылось окно "Экземпляры отчетов"
		И в таблице 'Список' я перехожу к строке:
			| "Основная валюта" | "Вид отчета"            | "Организация" | "Период отчета"  | "Период окончания" | "Сценарий"               |
			| 'RUB'             | "ВА - Протокол расчета" | "Земля ООО"   | "Январь 2024 г." | "Март 2024 г."     | "ВА - Основной сценарий" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда Открылся экземпляр отчета для вида отчета "ВА - Протокол расчета" валюта 'RUB' организация "Земля ООО" сценарий "ВА - Основной сценарий" периодичность "Месяц" проект '' аналитики '' '' '' '' '' '' 
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Протокол расчета" | ''               | ''                | ''             | ''      |
			| ''                      | ''               | ''                | ''             | ''      |
			| ''                      | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО" |
			| ''                      | "Сумма"          | "Сумма"           | "Сумма"        | "Сумма" |
			| "СтрокаОтчета"          | '0'              | '0'               | '123'          | '123'   |
		Когда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'	

Сценарий: 14.06 Выполняем расчет экземплятров отчетов из списка

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "ВА - Протокол расчета"
		И Я устанавливаю отборы сводной таблицы: дата начала '01.01.2024', дата конца '31.03.2024', валюта 'RUB', сценарий "ВА - Основной сценарий", организация "Земля ООО"		

	* Выполняем расчет
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ПересчитатьПоРегламенту'

	* Проверяем протокол
		Тогда открылось окно "Протокол"
		Тогда табличный документ 'ПолеТабличногоДокумента' равен:
			| "Дополнительная информация"                                                                                                                                                                                    | ''           |
			| "Из расчета исключен заблокированный период по параметрам:\n	Период: \"Январь 2024 г.\"\n	Регламент: \"ВА - Основной регламент\",\n	Сценарий: \"ВА - Основной сценарий\",\n	Организация: \"Земля ООО\""  | "Информация" |
			| "Из расчета исключен заблокированный период по параметрам:\n	Период: \"Февраль 2024 г.\"\n	Регламент: \"ВА - Основной регламент\",\n	Сценарий: \"ВА - Основной сценарий\",\n	Организация: \"Земля ООО\""  | "Информация" |
		И я нажимаю на кнопку с именем 'ФормаТехническаяИнформация'
		И Я закрываю окно "Протокол"

	* Сверяем результат
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Протокол расчета (сводная таблица)" | "Январь 2024 г." | "Февраль 2024 г." | "Март 2024 г." | "ИТОГО" |
			| "ВА - Протокол расчета (сводная таблица)" | "Сумма"          | "Сумма"           | "Сумма"        | "Сумма" |
			| "СтрокаОтчета"                            | '0'              | '0'               | '123'          | '123'   |
					
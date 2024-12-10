﻿#language: ru
@tree

@UH33_Budget
@ERPUH33_Budget
@Perform_Budget

Функционал: 10. Расчет показателей с заполнением по ADO

	Как Администратор я хочу
	Проверить, что данные по ADO загружаются в экземпляры отчетов

Контекст: 

	И я закрыл все окна клиентского приложения

Сценарий: 10.00 Определение типа приложения

	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	Пусть Инициализация переменных

Сценарий: 10.01 Создание информационных баз

	И Я создаю тип информационной базы с именем "ВА - Импорт ADO (Excel)" с версией "Подключение через ADO"

	И Я создаю внешнюю информационную базу "ВА - Импорт ADO (Excel)" тип "ВА - Импорт ADO (Excel)" каталог "$КаталогПроекта$\3_Бюджетирование\Макеты\10\ADO" тип хранилища 'Excel'

Сценарий: 10.02 Настройка информационных баз

	* Включение управления НСИ
		И В командном интерфейсе я выбираю "Общие справочники и настройки" "Общие настройки"
		Тогда открылось окно "Общие настройки*"
		И я устанавливаю флаг с именем 'ИспользоватьУправлениеНСИ'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Общие настройки*" в течение 20 секунд

	И В командном интерфейсе я выбираю "Интеграция и управление мастер-данными" "Типы ИБ"
	И Я в списке "Типы информационных баз" по полю "Наименование" ищу и выбираю элемент "ВА - Импорт ADO (Excel)" "По началу строки"
	Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И из выпадающего списка с именем 'ВИБПоУмолчанию' я выбираю по строке "ВА - Импорт ADO (Excel)"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Таблицы ADO"
	И в таблице 'Список' я нажимаю на кнопку с именем 'ОбновитьСписокТаблиц'
	Когда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Соответствие внешним ИБ"
	
	* Номенклатура
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Соответствие внешним ИБ (создание)"
		И я нажимаю кнопку выбора у поля с именем 'ОписаниеОбъектаВИБ'
		Тогда открылось окно "Таблицы ADO"
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Соответствие внешним ИБ (создание) *"
		И из выпадающего списка с именем 'ТипОбъектаКонсолидации' я выбираю точное значение "Справочник"
		И я нажимаю кнопку выбора у поля с именем 'ОписаниеОбъектаТек'
		Тогда открылось окно "Справочники ИБ"
		И в таблице 'Список' я перехожу к строке:
			| "Отсутствует в конфигурации" | "Согласуется" | "Справочник"   |
			| "Нет"                        | "Нет"         | "Номенклатура" |
		И в таблице 'Список' я выбираю текущую строку
		* Наименование
			Тогда открылось окно "Соответствие внешним ИБ (создание) *"
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Поле"         |
				| "Наименование" |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
			И в таблице 'ТабличноеПолеИзмеренийБД' я перехожу к строке:
				| "Используется в сопоставлении" | "Поле"         |
				| "Нет"                          | "Номенклатура" |
			И я выбираю пункт контекстного меню с именем 'ТаблицаСоответствияКонтекстноеМенюКоманднаяПанельСоответствияКнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'
		* Артикул
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Поле"    |
				| "Артикул" |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
			И в таблице 'ТабличноеПолеИзмеренийБД' я перехожу к строке:
				| "Используется в сопоставлении" | "Поле"    |
				| "Нет"                          | "Артикул" |
			И я выбираю пункт контекстного меню с именем 'ТаблицаСоответствияКонтекстноеМенюКоманднаяПанельСоответствияКнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'	
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Источник" | "Ключевой" | "Поле"    | "Способ заполнения" |
				| "Артикул"  | "Нет"      | "Артикул" | "Поле источника"    |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияКлючевой'
			И в таблице 'ТаблицаСоответствия' я изменяю флаг с именем 'ТаблицаСоответствияКлючевой'
			И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
		* Вид номенклатуры
			Если 'НЕ $$ЭтоPerform$$' Тогда
				Когда открылось окно "Соответствие внешним ИБ (создание) *"
				И в таблице 'ТаблицаСоответствия' я перехожу к строке:
					| "Поле"             |
					| "Вид номенклатуры" |
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимВИБ'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И Я в списке "Введите значение" по полю "Наименование" ищу и выбираю элемент "ВА - Номенклатура" "По началу строки"
		* Номенклатурная группа
			Если 'НЕ $$ЭтоЕРПУХ$$' Тогда
				Когда открылось окно "Соответствие внешним ИБ (создание) *"
				И в таблице 'ТаблицаСоответствия' я перехожу к строке:
					| "Поле"                  |
					| "Номенклатурная группа" |
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
				И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
				И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимВИБ'
				И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
				И Я в списке "Введите значение" по полю "Наименование" ищу и выбираю элемент "ВА - Номенклатурная группа" "По началу строки"	
		* Единица измерения
			Когда открылось окно "Соответствие внешним ИБ (создание) *"
			Если '$$ЭтоЕРПУХ$$' Тогда
				И в таблице 'ТаблицаСоответствия' я перехожу к строке:
					| "Поле"             |
					| "Единица хранения" |
			Иначе
				И в таблице 'ТаблицаСоответствия' я перехожу к строке:
					| "Поле"    |
					| "Единица" |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
			И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
			И в таблице 'ТаблицаСоответствия' из выпадающего списка с именем 'ТаблицаСоответствияСпособЗаполнения' я выбираю точное значение "Фиксированное значение"
			И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимВИБ'
			И в таблице 'ТаблицаСоответствия' я выбираю текущую строку
			Если '$$ЭтоЕРПУХ$$' Тогда
				И Я в списке "Введите значение" по полю "Наименование" ищу и выбираю элемент "шт" "По началу строки"	
			Иначе
				И Я в списке "Введите значение" по полю "Наименование" ищу и выбираю элемент "Штука" "По началу строки"
		* Корневой каталог
			Если '$$ЭтоУХ$$' Тогда				
				И я нажимаю кнопку выбора у поля с именем 'КорневойКаталог'
				И Я в списке 'Справочник.Номенклатура' по полю "Ссылка" ищу элемент "ВА - Номенклатура" "По началу строки"
				И в таблице 'Список' я нажимаю на кнопку с именем 'СписокВыбрать'
				Тогда элемент формы с именем 'КорневойКаталог' стал равен "ВА - Номенклатура"			
		И я нажимаю на кнопку с именем 	'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Соответствие внешним ИБ (создание) *" в течение 20 секунд

	Когда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Соответствие внешним ИБ (создание)"
	И из выпадающего списка с именем 'ОписаниеОбъектаВИБ' я выбираю точное значение "Лист1$"
	И из выпадающего списка с именем 'ТипОбъектаКонсолидации' я выбираю точное значение "Справочник"
	И я нажимаю кнопку выбора у поля с именем 'ОписаниеОбъектаТек'
	Тогда открылось окно "Справочники ИБ"
	И в таблице 'Список' я перехожу к строке:
		| "Отсутствует в конфигурации" | "Согласуется" | "Справочник"                |
		| "Нет"                        | "Да"          | "Статьи доходов и расходов" |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Соответствие внешним ИБ (создание) *"
	И в таблице 'ТабличноеПолеИзмеренийБД' я перехожу к строке:
		| "Используется в сопоставлении" | "Поле"         |
		| "Нет"                          | "Деятельность" |
	И в таблице 'ТаблицаСоответствия' я перехожу к строке:
		| "Поле"         |
		| "Наименование" |
	И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияСпособЗаполнения'
	И я выбираю пункт контекстного меню с именем 'ТаблицаСоответствияКонтекстноеМенюКоманднаяПанельСоответствияКнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'
	И в таблице 'ТаблицаСоответствия' я перехожу к строке:
		| "Поле" |
		| "Код"  |
	И в таблице 'ТаблицаСоответствия' я перехожу к строке:
		| "Источник"     | "Ключевой" | "Поле"         | "Способ заполнения" |
		| "Деятельность" | "Нет"      | "Наименование" | "Поле источника"    |
	И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияКлючевой'
	И в таблице 'ТаблицаСоответствия' я изменяю флаг с именем 'ТаблицаСоответствияКлючевой'
	И в таблице 'ТаблицаСоответствия' я завершаю редактирование строки
	* Корневой каталог
		И я нажимаю кнопку выбора у поля с именем 'КорневойКаталог'
		И Я в списке 'Справочник.СтатьиДоходовИРасходов' по полю "Ссылка" ищу элемент "ВА - Статьи доходов и расходов" "По началу строки"
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокВыбрать'
		Тогда элемент формы с именем 'КорневойКаталог' стал равен "ВА - Статьи доходов и расходов"
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Соответствие внешним ИБ (создание) *" в течение 20 секунд
	
	Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Основное"
	И В текущем окне я нажимаю кнопку командного интерфейса "Таблицы ADO"
	И в таблице 'Список' я нажимаю на кнопку с именем 'СписокПросмотрДанных'
	Тогда открылось окно "Форма просмотра таблицы ADO"
	И Я закрываю окно "Форма просмотра таблицы ADO"
	Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	И Я закрываю окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
	Тогда открылось окно "Типы информационных баз"
	И Я закрываю окно "Типы информационных баз"
			
Сценарий: 10.03 Создание вида отчета

	И Я создаю вид отчета с именем "ВА - Импорт ADO (Excel)" и родителем "ВА - Группа отчетов"

	* Настройка структуры отчета
		И Я открываю контруктор отчета с именем "ВА - Импорт ADO (Excel)"
		И Я в конструкторе отчета добавляю строку с именем "Продажи" 
		И Я в конструкторе отчета добавляю колонку с именем "Цена" 
		И Я в конструкторе отчета добавляю колонку с именем "Количество"
		И Я в конструкторе отчета добавляю колонку с именем "Артикул"
		И Я в конструкторе отчета в ячейке 'R2C4' меняю свойство показателя 'ТипЗначения' на "Строка"
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R2C2'
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СДохРас" в ячейку 'R2C3'

	* Настройки обмена файлами
		Тогда открылось окно "Конструктор отчета"
		И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"
		И я нажимаю на кнопку открытия поля с именем 'ПравилоОбработки'
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Правила расчета)"
		И из выпадающего списка с именем 'ТипБД' я выбираю по строке "ВА - Импорт ADO (Excel)"
		И я нажимаю на кнопку открытия поля с именем 'ТипБД'
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
		И я нажимаю на кнопку открытия поля с именем 'ВИБПоУмолчанию'
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Внешние информационные базы)"
		И я нажимаю на кнопку с именем 'ОткрытьНастройкиОбменаФайламиОрганизаций'
		И Я добавляю элемент пути к файлам организаций для типа 'ВидОтчета' объект "ВА - Импорт ADO (Excel)" значение "ВА_ЗагрузкаADO"
		Тогда открылось окно "Элементы пути к файлам организаций: Форма списка"
		И Я закрываю окно "Элементы пути к файлам организаций: Форма списка"		
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Внешние информационные базы)"
		И Я закрываю окно "ВА - Импорт ADO (Excel) (Внешние информационные базы)"
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Тип информационной базы)"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "ВА - Импорт ADO (Excel) (Тип информационной базы)" в течение 20 секунд
		Тогда открылось окно "ВА - Импорт ADO (Excel) (Правила расчета) *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "ВА - Импорт ADO (Excel) (Правила расчета) *" в течение 20 секунд

	* Настройка формул
		* Цена
			Тогда открылось окно "Конструктор отчета"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C2'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Источник данных (создание)"
			И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Таблицы из подключения по ADO"
			И я нажимаю кнопку выбора у поля с именем 'ТаблицаADO'
			Тогда открылось окно "Таблицы ADO"
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ДеревоПолейБД' я разворачиваю текущую строку
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле" |
				| "Цена" |
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Аналитика приемника" | "Имя колонки"  | "Способ заполнения" |
				| "Значение"            | "[Количество]" | "Поле источника"    |
			И в таблице 'ТаблицаСоответствия' я активизирую поле с именем 'ТаблицаСоответствияПсевдонимБД'
			И я выбираю пункт контекстного меню с именем 'КнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'
			И я перехожу к закладке с именем 'СтраницаОтборы'
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле"   |
				| "Период" |
			И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'СпособВычисленияПараметра'
			И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
			И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "В интервале"
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'УточнениеСпособаОпределения'
			И в таблице 'ДеревоПараметровОтбораБД' я нажимаю кнопку выбора у реквизита с именем 'УточнениеСпособаОпределения'
			Тогда открылось окно "Укажите способы вычисления границ интервала"
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
			Тогда открылось окно "Источники данных"
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "Конструктор отчета *"
			И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		* Количества
			Тогда открылось окно "Конструктор отчета"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C3'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Источник данных (создание)"
			И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Таблицы из подключения по ADO"
			И из выпадающего списка с именем 'ТаблицаADO' я выбираю точное значение "Лист1$"
			И я перехожу к закладке с именем 'СтраницаОтборы'
			И в таблице 'ДеревоПолейБД' я разворачиваю текущую строку
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле"   |
				| "Период" |
			И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'СпособВычисленияПараметра'
			И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
			И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "В интервале"
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'УточнениеСпособаОпределения'
			И в таблице 'ДеревоПараметровОтбораБД' я нажимаю кнопку выбора у реквизита с именем 'УточнениеСпособаОпределения'
			Тогда открылось окно "Укажите способы вычисления границ интервала"
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
			Тогда открылось окно "Источники данных"
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "Конструктор отчета *"
			И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		* Артикул
			Тогда открылось окно "Конструктор отчета"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R2C4'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно "Источники данных"
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно "Источник данных (создание)"
			И из выпадающего списка с именем 'СпособПолучения' я выбираю точное значение "Таблицы из подключения по ADO"
			И из выпадающего списка с именем 'ТаблицаADO' я выбираю точное значение "Лист1$"
			И в таблице 'ДеревоПолейБД' я разворачиваю текущую строку
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле"    |
				| "Артикул" |
			И в таблице 'ТаблицаСоответствия' я перехожу к строке:
				| "Аналитика приемника" | "Способ заполнения" |
				| "Значение"            | "Поле источника"    |
			И я выбираю пункт контекстного меню с именем 'КнопкаСопоставитьАналитики' на элементе формы с именем 'ТаблицаСоответствия'
			И я перехожу к закладке с именем 'СтраницаОтборы'
			И в таблице 'ДеревоПолейБД' я разворачиваю текущую строку
			И в таблице 'ДеревоПолейБД' я перехожу к строке:
				| "Поле"   |
				| "Период" |
			И я нажимаю на кнопку с именем 'ДобавитьЭлементУсловия'
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'СпособВычисленияПараметра'
			И в таблице 'ДеревоПараметровОтбораБД' я выбираю текущую строку
			И в таблице 'ДеревоПараметровОтбораБД' из выпадающего списка с именем 'СпособВычисленияПараметра' я выбираю точное значение "В интервале"
			И в таблице 'ДеревоПараметровОтбораБД' я активизирую поле с именем 'УточнениеСпособаОпределения'
			И в таблице 'ДеревоПараметровОтбораБД' я нажимаю кнопку выбора у реквизита с именем 'УточнениеСпособаОпределения'
			Тогда открылось окно "Укажите способы вычисления границ интервала"
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно "Источник данных (создание) *"
			И в таблице 'ДеревоПараметровОтбораБД' я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна "Источник данных (создание) *" в течение 20 секунд
			Тогда открылось окно "Источники данных"
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно "Конструктор отчета *"
			И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
			Тогда открылось окно "Конструктор отчета"
			И Я закрываю окно "Конструктор отчета"

	* Создаем бланк
		И Я Для вида отчета "ВА - Импорт ADO (Excel)" создаю бланк по умолчанию		

Сценарий: 10.04 Настройка справочников ИБ

	И В командном интерфейсе я выбираю "Общие справочники и настройки" "Справочники"
	Тогда открылось окно "Справочники текущей информационной базы"	
	И в таблице 'Список' я перехожу к строке:
		| "Справочник"   |
		| "Номенклатура" |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Номенклатура (Справочники ИБ)"
	И Для каждой строки таблицы 'Реквизиты' я выполняю
		И в таблице 'Реквизиты' я активизирую поле с именем 'РеквизитыОбязательный'
		И в таблице 'Реквизиты' я снимаю флаг с именем 'РеквизитыОбязательный'	
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Номенклатура (Справочники ИБ) *" в течение 20 секунд
	Тогда открылось окно "Справочники текущей информационной базы"
	И в таблице 'Список' я перехожу к строке:
		| "Справочник"     |
		| "Статьи доходов и расходов" |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Статьи доходов и расходов (Справочники ИБ)"
	И Для каждой строки таблицы 'Реквизиты' я выполняю
		И в таблице 'Реквизиты' я активизирую поле с именем 'РеквизитыОбязательный'
		И в таблице 'Реквизиты' я снимаю флаг с именем 'РеквизитыОбязательный'	
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И Я закрываю окно "Справочники текущей информационной базы"

Сценарий: 10.05 Создание экземпляра отчета

	И Я создаю экземпляр отчета для вида отчета "ВА - Импорт ADO (Excel)" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Меркурий ООО" проект '' аналитики '' '' '' '' '' '' 		
	
	* Устанавливаем ИБ
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаОткрытьНастройки'
		Тогда открылось окно "Настройки документа"
		И я перехожу к закладке с именем 'ГруппаСтраницаНастройкиОтчета'
		И из выпадающего списка с именем 'ВнешняяИнформационнаяБаза' я выбираю точное значение "ВА - Импорт ADO (Excel)"
		И я нажимаю на кнопку с именем 'ФормаПрименитьИЗакрыть'
	
	* Делаем расчет
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано табличный документ 'ПолеТабличногоДокументаМакет' равен макету "3_Бюджетирование\Макеты\10\ВА_ИмпортADO.mxl"
		И я нажимаю на кнопку с именем 'Записать'
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаОткрытьДвиженияДокументаПлоскаяТаблица'
		Тогда открылось окно "Плоская таблица значений показателей"
		И я жду когда в табличном документе 'ОтчетТабличныйДокумент' заполнится ячейка 'R2C1' в течение 60 секунд
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "3_Бюджетирование\Макеты\10\ВА_ИмпортADO_Движения.mxl" по шаблону
		И Я закрываю окно "Плоская таблица значений показателей"
		Тогда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'

Сценарий: 10.06 Грузим второй файл

	* Открываем документ
		И Я открываю первый экземпляр отчета для вида отчета "ВА - Импорт ADO (Excel)"
		И Открылся экземпляр отчета для вида отчета "ВА - Импорт ADO (Excel)" валюта "RUB" организация "Меркурий ООО" сценарий "ВА - Основной сценарий" периодичность "Месяц" проект '' аналитики '' '' '' '' '' '' 
	
	* Проверяем форму способа расчета показателей
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
		Тогда открылось окно "Выбор способа расчета показателей"
		Тогда элемент формы с именем 'БланкДляИмпорта' стал равен "ВА - Импорт ADO (Excel)"
		И элемент формы с именем 'ВнешняяИнформационнаяБаза' стал равен "ВА - Импорт ADO (Excel)"
		И элемент формы с именем 'ПравилоОбработки' стал равен "ВА - Импорт ADO (Excel)"
		И элемент формы с именем 'ПравилоПроверки' стал равен "ВА - Импорт ADO (Excel)"
		И элемент формы с именем 'СпособИмпортирования' стал равен "0"
		И элемент формы с именем 'СпособФормированияОтчета' стал равен "По правилу обработки"
	
	* Выбирем файл
		И я меняю значение переключателя с именем 'СпособИмпортирования' на "Файл на диске"
		И в поле с именем 'ПутьКФайлу' я ввожу текст "$КаталогПроекта$\3_Бюджетирование\Макеты\10\ADO\ВА_ЗагрузкаADO2.xls"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	* Сверяемя результат
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано табличный документ 'ПолеТабличногоДокументаМакет' равен макету "3_Бюджетирование\Макеты\10\ВА_ИмпортADO2.mxl"

	* Заполняем по умолчанию
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'
		Дано табличный документ 'ПолеТабличногоДокументаМакет' равен макету "3_Бюджетирование\Макеты\10\ВА_ИмпортADO.mxl"		

	* Повторно загружаем файл
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
		Тогда открылось окно "Выбор способа расчета показателей"
		И элемент формы с именем 'СпособИмпортирования' стал равен "1"
		Тогда элемент формы с именем 'ФайлИмпорта' стал равен "ВА_ЗагрузкаADO2.xls"
		И я меняю значение переключателя с именем 'СпособИмпортирования' на "Файл на диске"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button1'

	* Загружаем файл повторно		
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
		Тогда открылось окно "Выбор способа расчета показателей"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	* Проверяем фору выбора версии файла
		И я жду открытия окна "Выбор версии файла" в течение 20 секунд
		И элемент формы с именем 'ХранимыйФайл' стал равен "ВА_ЗагрузкаADO2.xls"
		И элемент формы с именем 'Пароль' стал равен ""
		И таблица 'СписокЛистов' стала равной:
			| "Лист документа" | "Защищен паролем" |
			| "Лист1"          | "Нет"             |
		И я нажимаю на кнопку с именем 'ФормаОК'

	* Сверяем результат
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано табличный документ 'ПолеТабличногоДокументаМакет' равен макету "3_Бюджетирование\Макеты\10\ВА_ИмпортADO2.mxl"
	
	* Закрываем документ не сохраняя
		Тогда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button1'

Сценарий: 10.07 Изменим вид номенклатуры

	Если '$$ЭтоPerform$$' Тогда
		И Я Для номенклатуры с именем "1С:КП ГУ ПРОФ на 12 месяцев" для реквизита 'НоменклатурнаяГруппа' выбираю значение '' в группе ''
		И Я Для номенклатуры с именем "1С:КП ГУ ПРОФ на 6 месяцев" для реквизита 'НоменклатурнаяГруппа' выбираю значение '' в группе ''

	ИначеЕсли '$$ЭтоУХ$$' Тогда 
		И В командном интерфейсе я выбираю "Справочники" "Номенклатура"
		Тогда открылось окно "Номенклатура"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"      |
			| "ВА - Номенклатура" |
		И в таблице  'Список' я перехожу на один уровень вниз

		* 1С:КП ГУ ПРОФ на 12 месяцев
			Если в таблице 'Список' есть строка Тогда
				| "Артикул"  | 'Единица' | "Наименование"                |
				| "30000012" | 'шт'      | "1С:КП ГУ ПРОФ на 12 месяцев" |
				И в таблице 'Список' я перехожу к строке:
					| "Артикул"  | 'Единица' | "Наименование"                |
					| "30000012" | 'шт'      | "1С:КП ГУ ПРОФ на 12 месяцев" |
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)"
				И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура) *" в течение 20 секунд

		* 1С:КП ГУ ПРОФ на 6 месяцев
			Если в таблице 'Список' есть строка Тогда
				| "Артикул" | 'Единица' | "Наименование"               |
				| "3000006" | 'шт'      | "1С:КП ГУ ПРОФ на 6 месяцев" |
				И в таблице 'Список' я перехожу к строке:
					| "Артикул" | 'Единица' | "Наименование"               |
					| "3000006" | 'шт'      | "1С:КП ГУ ПРОФ на 6 месяцев" |
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)"
				И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура) *" в течение 20 секунд	
		
	ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда
		И В командном интерфейсе я выбираю "Главное" "Номенклатура"
		Тогда открылось окно "Номенклатура"
		
		* 1С:КП ГУ ПРОФ на 6 месяцев
			И в таблице 'ВидыНоменклатуры' я перехожу к строке:
				| "Наименование"      |
				| "ВА - Номенклатура" |
			Если в таблице 'СписокРасширенныйПоискНоменклатура' есть строка Тогда
				| "Артикул" | "Наименование"               |
				| "3000006" | "1С:КП ГУ ПРОФ на 6 месяцев" |
				И в таблице 'СписокРасширенныйПоискНоменклатура' я перехожу к строке:
					| "Артикул" | "Наименование"               |
					| "3000006" | "1С:КП ГУ ПРОФ на 6 месяцев" |
				И в таблице 'СписокРасширенныйПоискНоменклатура' я выбираю текущую строку
				Тогда открылось окно "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)"
				И я перехожу к закладке с именем 'СтраницаРеквизитыНоменклатуры'
				Если открылось окно 'Полезный совет' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура)"
				И я разворачиваю группу с именем 'СворачиваемаяГруппаОсновныеПараметрыУчета'
				И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'				
				Если открылось окно 'Ставка НДС применяется с:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '01.01.2024'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно "1С:КП ГУ ПРОФ на * месяцев (Номенклатура)"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "1С:КП ГУ ПРОФ на 6 месяцев (Номенклатура) *" в течение 20 секунд
		
		* 1С:КП ГУ ПРОФ на 12 месяцев
			И в таблице 'ВидыНоменклатуры' я перехожу к строке:
				| "Наименование"      |
				| "ВА - Номенклатура" |
			Если в таблице 'СписокРасширенныйПоискНоменклатура' есть строка Тогда
				| "Артикул"  | "Наименование"                |
				| "30000012" | "1С:КП ГУ ПРОФ на 12 месяцев" |
				И в таблице 'СписокРасширенныйПоискНоменклатура' я перехожу к строке:
					| "Артикул"  | "Наименование"                |
					| "30000012" | "1С:КП ГУ ПРОФ на 12 месяцев" |
				И в таблице 'СписокРасширенныйПоискНоменклатура' я выбираю текущую строку
				Тогда открылось окно "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)"
				И я перехожу к закладке с именем 'СтраницаРеквизитыНоменклатуры'
				Тогда открылось окно "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура)"
				И я разворачиваю группу с именем 'СворачиваемаяГруппаОсновныеПараметрыУчета'
				И из выпадающего списка с именем 'ВидНоменклатуры' я выбираю по строке 'ВА - Прочее'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				Если открылось окно 'Ставка НДС применяется с:' Тогда
					И в поле с именем 'InputFld' я ввожу текст '01.01.2024'
					И я нажимаю на кнопку с именем 'OK'
					Тогда открылось окно "1С:КП ГУ ПРОФ на * месяцев (Номенклатура)"
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "1С:КП ГУ ПРОФ на 12 месяцев (Номенклатура) *" в течение 20 секунд

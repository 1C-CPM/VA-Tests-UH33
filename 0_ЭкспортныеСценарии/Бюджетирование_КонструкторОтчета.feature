﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой "Бюджетирование" - "Конструктор отчета"

Сценарий: Я открываю контруктор отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'ОткрытьКонструктор'

Сценарий: В конструкторе отчета я нажимаю кнопку контекстного меню с именем 'TheName'

	Если '$$ЭтоPerform$$' Тогда
		И я нажимаю на кнопку с именем '[TheName]'
	Иначе
		И я выбираю пункт контекстного меню с именем '[TheName]' на элементе формы с именем 'ПолеТабличногоДокументаМакет'
		
Сценарий: Я в конструкторе отчета добавляю строку с именем 'TheLineName' 

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Структура"
	И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьСтроки'
	Тогда открылось окно "Добавление новых строк"
	И в таблице 'НовыеСтроки' я нажимаю на кнопку с именем 'НовыеСтрокиДобавить'
	И в таблице 'НовыеСтроки' в поле с именем 'НовыеСтрокиНаименование' я ввожу текст '[TheLineName]'
	И в таблице 'НовыеСтроки' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ОК'

Сценарий: Я в конструкторе отчета добавляю строки 

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Структура"
	И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьСтроки'
	Тогда открылось окно "Добавление новых строк"

	И я заполняю таблицу 'НовыеСтроки' данными
		| 'Таблица' |

	И я нажимаю на кнопку с именем 'ОК'

Сценарий: Я в конструкторе отчета добавляю колонку с именем 'TheColumnName' 

	Тогда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Структура"
	И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьКолонку'
	Тогда открылось окно "Добавление новых колонок"
	И в таблице 'НовыеСтроки' я нажимаю на кнопку с именем 'НовыеСтрокиДобавить'
	И в таблице 'НовыеСтроки' в поле с именем 'НовыеСтрокиНаименование' я ввожу текст '[TheColumnName]'
	И в таблице 'НовыеСтроки' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ОК'

Сценарий: Я в конструкторе отчета добавляю колонки 

	Тогда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Структура"
	И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьКолонку'
	Тогда открылось окно "Добавление новых колонок"

	И я заполняю таблицу 'НовыеСтроки' данными
		| 'Таблица' |

	И я нажимаю на кнопку с именем 'ОК'

Сценарий: Я в конструкторе отчета добавляю аналитику с кодом 'TheDimensionCode' в ячейку 'TheCell' 

	Тогда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Аналитики"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И в поле с именем 'Pattern' я ввожу текст '[TheDimensionCode]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И в таблице 'Список' я выбираю текущую строку

Сценарий: Я в конструкторе отчета добавляю аналитику с наименованием 'TheDimensionName' в ячейку 'TheCell' 

	Тогда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Аналитики"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылась форма с именем 'UniversalListFindExtForm'
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И в поле с именем 'Pattern' я ввожу текст '[TheDimensionCode]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Виды аналитик (корпоративные)"
	И в таблице 'Список' я выбираю текущую строку	

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' меняю аналитику валюта 

	Тогда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Аналитики"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "Конструктор отчета*"

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' меняю родителя у строки на 'TheParentName'

	Тогда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Структура"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Строки отчетов)"
	И из выпадающего списка с именем 'Родитель' я выбираю по строке '[TheParentName]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "* (Строки отчетов) *" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' меняю свойство показателя 'TheProperty' на 'TheValue'

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Структура"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Тогда открылось окно "* (Показатели отчетов)"
	И Я для реквизита '[TheProperty]' устанавливаю значение '[TheValue]'										
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "* (Показатели отчетов)" в течение 20 секунд

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' меняю свойства показателей 'TheProperty' на 'TheValue'

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Структура"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И я выбираю пункт контекстного меню с именем 'ПолеТабличногоДокументаМакетКонтекстноеМенюСвойства' на элементе формы с именем 'ПолеТабличногоДокументаМакет'
	Тогда открылось окно "Групповое изменение показателей"
	И я изменяю флаг с именем '[TheProperty]Изменить'
	И Я для реквизита '[TheProperty]' устанавливаю значение '[TheValue]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

Сценарий: Я в конструкторе отчета в ячейке 'TheCell' проверяю свойство показателя 'TheProperty' на 'TheValue'

	Когда открылось окно "Конструктор отчета*"	
	И я меняю значение переключателя с именем 'РежимРаботы' на "Структура"		
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	Когда открылось окно "* (Показатели отчетов)"
	И элемент формы с именем '[TheProperty]' стал равен '[TheValue]'	
	И Я закрываю окно "* (Показатели отчетов)"

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' настраиваю связь с показателем с кодом 'TheIndicatorCode' вида отчета 'TheReportKindName'

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке	
	И я нажимаю на кнопку с именем 'СсылкаНаПоказатель1'

	Когда открылось окно "Показатели отчетов"
	И я нажимаю кнопку выбора у поля с именем 'ВидОтчета'
	Тогда открылось окно "Виды отчетов"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылось окно "Найти"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И в поле с именем 'Pattern' я ввожу текст '[TheReportKindName]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Виды отчетов"
	И в таблице 'Список' я выбираю текущую строку

	И Я выбираю показатель с кодом '[TheIndicatorCode]'
	
	Тогда открылось окно "Конструктор отчета *"
	И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу 'TheFormula'

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	И в поле с именем 'ПолеТекстовогоДокументаПроцедура' я ввожу текст '[TheFormula]'
	
	И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'	

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу копирования ячейки 'TheCell1'

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell1]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	
	И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'	

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу суммирования ячейки 'TheCell1'

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell1]'
	И я нажимаю на кнопку с именем 'КнопкаСумма'
	
	И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу сумма ячеек 'TheCell1' 'TheCell2' 'TheCell3' 'TheCell4' 'TheCell5'

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell1]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	И я нажимаю на кнопку с именем 'КнопкаПлюс'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell2]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	Если 'НЕ СтрНачинаетсяС("[TheCell3]", "[") И НЕ ПустаяСтрока("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'КнопкаПлюс'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell3]'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	Если 'НЕ СтрНачинаетсяС("[TheCell4]", "[") И НЕ ПустаяСтрока("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'КнопкаПлюс'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell4]'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке	

	Если 'НЕ СтрНачинаетсяС("[TheCell5]", "[") И НЕ ПустаяСтрока("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'КнопкаПлюс'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell5]'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке	
	
	И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'	

Сценарий: Я в конструкторе отчета для ячейки 'TheCell' задаю формулу произведение ячеек 'TheCell1' 'TheCell2' 'TheCell3' 'TheCell4' 'TheCell5'

	Когда открылось окно "Конструктор отчета*"
	И я меняю значение переключателя с именем 'РежимРаботы' на "Формулы"
	
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell1]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
	И я нажимаю на кнопку с именем 'КнопкаУмножить'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell2]'
	И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	Если 'НЕ СтрНачинаетсяС("[TheCell3]", "[") И НЕ ПустаяСтрока("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'КнопкаУмножить'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell3]'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	Если 'НЕ СтрНачинаетсяС("[TheCell4]", "[") И НЕ ПустаяСтрока("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'КнопкаУмножить'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell4]'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке	

	Если 'НЕ СтрНачинаетсяС("[TheCell5]", "[") И НЕ ПустаяСтрока("[TheCell3]")' Тогда
		И я нажимаю на кнопку с именем 'КнопкаУмножить'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке '[TheCell5]'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке	
	
	И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'

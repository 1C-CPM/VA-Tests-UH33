﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии общие

Сценарий: Я устанавливаю отбор в форме списка 'TheField' 'TheComparisonType' 'TheValue' 

	Тогда открылось окно "Настройка списка"
	И я удаляю все строки таблицы 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор'		
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я нажимаю на кнопку с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборДобавитьЭлементОтбора'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я перехожу к последней строке
	Если 'StrFind("[TheField]", ".") > 0' Тогда
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборЛевоеЗначение' я ввожу текст '[TheField]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборЛевоеЗначение' я выбираю точное значение '[TheField]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я активизирую поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения' я выбираю точное значение '[TheComparisonType]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я активизирую поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение'
	Если 'StrFind(Lower("[TheComparisonType]"),"содержит")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"начинается с")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"contain")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"begin with")>0' Тогда 
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я ввожу текст '[TheValue]'
	Иначе
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я выбираю точное значение '[TheValue]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'

Сценарий: Я добавляю отбор в форме списка 'TheField' 'TheComparisonType' 'TheValue' 

	Тогда открылось окно "Настройка списка"
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я нажимаю на кнопку с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборДобавитьЭлементОтбора'
	Если 'StrFind("[TheField]", ".") > 0' Тогда
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборЛевоеЗначение' я ввожу текст '[TheField]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборЛевоеЗначение' я выбираю точное значение '[TheField]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я активизирую поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения' я выбираю точное значение '[TheComparisonType]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я активизирую поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение'
	Если 'StrFind(Lower("[TheComparisonType]"),"содержит")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"начинается с")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"contain")>0 ИЛИ StrFind(Lower("[TheComparisonType]"),"begin with")>0' Тогда 
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' в поле с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я ввожу текст '[TheValue]'
	Иначе
		И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборПравоеЗначение' я выбираю точное значение '[TheValue]'
	И в таблице 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'	

Сценарий: Я снимаю все отборы в форме списка

	Тогда открылось окно "Настройка списка"
	И я перехожу к закладке с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0'
	И я удаляю все строки таблицы 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор'
	И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'

Сценарий: Я в списке "TheListName" по полю "TheField" ищу элемент "ThePattern" "TheCompareType" 

//	Тогда открылось окно '[TheListName]'
	Если кнопка с именем 'ФормаНайти' существует Тогда
		И я нажимаю на кнопку с именем 'ФормаНайти'
	Иначе
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'
	Тогда открылось окно "Найти"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение '[TheField]'
	И я меняю значение переключателя с именем 'CompareType' на '[TheCompareType]'	
	И я жду открытия окна "Найти" в течение 10 секунд				
	И в поле с именем 'Pattern' я ввожу текст '[ThePattern]'
	И я нажимаю на кнопку с именем 'Find'
	И я жду открытия окна '[TheListName]' в течение 10 секунд

Сценарий: Я в списке "TheListName" по полю "TheField" ищу и выбираю элемент "ThePattern" "TheCompareType" 

//	Тогда открылось окно '[TheListName]'
	Если кнопка с именем 'ФормаНайти' существует Тогда
		И я нажимаю на кнопку с именем 'ФормаНайти'
	Иначе
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'
	Тогда открылось окно "Найти"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение '[TheField]'
	И я меняю значение переключателя с именем 'CompareType' на '[TheCompareType]'
	И я жду открытия окна "Найти" в течение 10 секунд				
	И в поле с именем 'Pattern' я ввожу текст '[ThePattern]'
	И я нажимаю на кнопку с именем 'Find'
//	И я жду открытия окна '[TheListName]' в течение 10 секунд
	И Я запоминаю в переменную 'VarField' значение '[TheField]'
	И Я запоминаю в переменную 'VarPattern' значение '[ThePattern]'	
	И в таблице 'Список' я перехожу к строке:
		| '$VarField$'   |
		| '$VarPattern$' |
	И в таблице 'Список' я выбираю текущую строку	

Сценарий: Я удаляю текущую строку в списке 'TheList'

	И я выбираю пункт контекстного меню с именем '[TheList]КонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем '[TheList]'
	Тогда открылось окно "1С:Предприятие"
	Если элемент формы с именем 'Message' стал равен "Пометить * на удаление?" по шаблону Тогда
		И я нажимаю на кнопку с именем 'Button0'
	Иначе
		И я нажимаю на кнопку с именем 'Button1'
	И я жду доступности элемента с именем '[TheList]' в течение 20 секунд
			
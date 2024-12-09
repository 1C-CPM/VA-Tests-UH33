﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для создания НСИ в 1C:CPMWE

Сценарий: Я создаю страну с кодом1 'ТекКодСтраны1' кодом2 'ТекКодСтраны2' кодом3 'ТекКодСтраны3' именем1 'ТекИмяСтраны1' именем2 'ТекИмяСтраны2' именем3 'ТекИмяСтраны3' если ее нет в 1C:CPMWE

	* Открываем форму справочника
		И я открываю основную форму списка справочника 'СтраныМира'

	* Ищем элемент
		Тогда открылось окно "Страны мира"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Код"
		И в поле с именем 'Pattern' я ввожу текст '[ТекКодСтраны1]'
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Страны мира"
		Если в таблице 'Список' количество строк 'равно' 0 Тогда
			И я нажимаю на кнопку с именем 'СписокСоздать'
		Иначе
			И в таблице 'Список' я выбираю текущую строку
	
	* Создаем элементм
		Тогда открылось окно "*Страна мира*"		
		И в поле с именем 'Код' я ввожу текст '[ТекКодСтраны1]'
		И в поле с именем 'КодАльфа2' я ввожу текст '[ТекКодСтраны2]'
		И в поле с именем 'КодАльфа3' я ввожу текст '[ТекКодСтраны3]'
		И в поле с именем 'Наименование' я ввожу текст '[ТекИмяСтраны1]'
		И в поле с именем 'НаименованиеПолное' я ввожу текст '[ТекИмяСтраны2]'
		И в поле с именем 'МеждународноеНаименование' я ввожу текст '[ТекИмяСтраны3]'
		Если '[ТекКодСтраны1] = 643' Тогда
			И я устанавливаю флаг с именем 'УчастникЕАЭС'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Страна мира (создание)" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Страны мира"
		И Я закрываю окно "Страны мира"

Сценарий: Я устанавливаю цену с типом 'ТекТипЦены' номенклатуры 'ТекИмяНоменклатуры' на дату 'ТекДатаКурса' в значение 'ТекЗначение' 'ТекВалюта' в 1C:CPMWE

	* Открываем список
		И В командном интерфейсе я выбираю "Главное" "Номенклатура"
		Тогда открылось окно "Номенклатура"

	* Ищем текущий элемент
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяНоменклатуры]'
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Номенклатура"
		Тогда в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку		
		Тогда открылось окно "* (Номенклатура)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Цены номенклатуры"
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Период"
		И в поле с именем 'Pattern' я ввожу текст '[ТекДатаКурса]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "* (Номенклатура)"
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Тип цен"
		И из выпадающего списка с именем 'Pattern' я выбираю по строке '[ТекТипЦены]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "* (Номенклатура)"		
		Если в таблице 'Список' количество строк 'равно' 0 Тогда
			И я нажимаю на кнопку с именем 'ФормаСоздать'
		Иначе
			И в таблице 'Список' я выбираю текущую строку

	* Создаем позицию
		Когда открылось окно "Цены номенклатуры*"
		И в поле с именем 'Период' я ввожу текст '[ТекДатаКурса]'
		И из выпадающего списка с именем 'ТипЦен' я выбираю по строке '[ТекТипЦены]'
		И из выпадающего списка с именем 'Номенклатура' я выбираю по строке '[ТекИмяНоменклатуры]'
		И из выпадающего списка с именем 'Валюта' я выбираю точное значение '[ТекВалюта]'
		И в поле с именем 'Цена' я ввожу текст '[ТекЗначение]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Цены номенклатуры (создание) *" в течение 20 секунд

	* Закрываем формы
		Тогда открылось окно "* (Номенклатура)"
		И Я закрываю окно "* (Номенклатура)"
		Тогда открылось окно "Номенклатура"
		И Я закрываю окно "Номенклатура"

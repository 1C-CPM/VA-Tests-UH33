﻿#language: ru
@tree

@UH33_Planning
@ERPUH33_Planning

Функционал: 01.Первоначальные настройки блока 

	Как Администратор я хочу
	ввести дополнительные настройки
	чтобы проверить ввод НСИ и начать тестирование функционала

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Сценарий: 01.00 Определеняем тип приложения

	Пусть Инициализация переменных

Сценарий: 01.01 Отмена проведения		

	* Отмена проведения документов Заявки на оплату
		Если '$$ЭтоУХ$$' Тогда
			И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
			Тогда открылось окно 'Заявки на оплату'
			И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
			Тогда открылось окно 'Найти'
			И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Организация'
			И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
			И я нажимаю на кнопку с именем 'Find'								
			И для каждой строки таблицы "Список" я выполняю
				И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
			И Я закрываю окно 'Заявки на оплату'
		ИначеЕсли '$$ЭтоЕРПУХ$$' Тогда 	
			И В командном интерфейсе я выбираю 'Казначейство' 'Заявки на оплату'
			Тогда открылось окно 'Заявки на оплату'
			И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
			Тогда открылось окно 'Найти'
			И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Получатель'
			И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест Контрагент'
			И я нажимаю на кнопку с именем 'Find'								
			И для каждой строки таблицы "Список" я выполняю
				И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
			И Я закрываю окно 'Заявки на оплату'

			И В командном интерфейсе я выбираю 'Планирование и контроль' 'Операционные планы'
			Тогда открылось окно 'Операционные планы'
			И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
			Тогда открылось окно 'Найти'
			И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'ЦФО'
			И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
			И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
			И я нажимаю на кнопку с именем 'Find'
			И для каждой строки таблицы "Список" я выполняю
				И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
			И Я закрываю окно 'Операционные планы'

	* Отмена проведения документов Резервирование
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Резервирование'	
		Тогда открылось окно 'Резервирования планов и лимитов'
		И в таблице "Список" я нажимаю на кнопку с именем 'СписокНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'ЦФО'
		И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
		И в поле с именем 'Pattern' я ввожу текст 'Автотест Организация'
		И я нажимаю на кнопку с именем 'Find'
		И для каждой строки таблицы "Список" я выполняю
			И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
		И Я закрываю окно 'Резервирования планов и лимитов'

Сценарий: 01.02 Создание варианта настроек БДДС

	* Удаление элемента
		
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Управление планами и лимитами'
		Тогда открылось окно 'Управление планами и лимитами'
		И я жду появления элемента 'Кнопок вид бюджета' в течение 20 секунд
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ВариантыНастроек'
		Тогда открылось окно 'Варианты настроек операционного плана'
		И Я в списке "Варианты настроек операционного плана" по полю "Наименование" ищу элемент 'Автотест БДДС' "По точному совпадению"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И в поле с именем 'Наименование' я ввожу текст 'Удалить'
			И я устанавливаю флаг с именем 'НеИспользовать'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'БДДС (валюта в строке) (Вариант настройки операционного плана) *' в течение 20 секунд			
				
		И Я в списке 'Варианты настроек операционного плана' по полю "Наименование" ищу элемент "БДДС (валюта в строке)" "По точному совпадению" 
		И пока в таблице 'Список' количество строк ">" 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			Тогда открылось окно 'БДДС (валюта в строке) (Вариант настройки операционного плана)'
			И в поле с именем 'Наименование' я ввожу текст 'Удалить'
			И я устанавливаю флаг с именем 'НеИспользовать'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'БДДС (валюта в строке) (Вариант настройки операционного плана) *' в течение 20 секунд			

		И Я закрываю окно 'Варианты настроек операционного плана'

	* Установить параметры БДДС
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Управление планами и лимитами'
		Тогда открылось окно 'Управление планами и лимитами'
		И я нажимаю на кнопку с именем 'ОтчетнаяДатаКоманда'
		Тогда открылось окно 'Параметры контроля бюджета'
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьИнтервал' на элементе формы с именем "Список"
		Тогда открылось окно 'Выберите период'
		И в поле с именем 'DateBegin' я ввожу текст '01.01.2024'
		И в поле с именем 'DateEnd' я ввожу текст ''
		И я нажимаю на кнопку с именем 'Select'
		Тогда открылось окно 'Параметры контроля бюджета'
		И в таблице "Список" я активизирую поле с именем "Период"
		Если в таблице "Список" количество строк "меньше" 1 Тогда
			Когда открылось окно 'Параметры контроля бюджета'
			И Я закрываю окно 'Параметры контроля бюджета'
			Тогда открылось окно 'Управление планами и лимитами'
			И я нажимаю на кнопку с именем 'СледующийПериод'
			Тогда открылось окно '1С:Предприятие'
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно 'Параметры контроля бюджета (создание)'
			И из выпадающего списка с именем "ПериодЛимитирования" я выбираю точное значение '1 января 2024 г.'
			И из выпадающего списка с именем "РежимКонтроляЛимитов" я выбираю точное значение 'Информировать'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Параметры контроля бюджета (создание) *' в течение 20 секунд
		Иначе 
			И Я закрываю окно 'Параметры контроля бюджета'	
							
		И из выпадающего списка с именем "СпособОпределенияВалютыЛимитирования" я выбираю точное значение 'В валюте операции'	
		И из выпадающего списка с именем "ПериодичностьПланирования" я выбираю точное значение 'Месяц'
		И из выпадающего списка с именем "ПериодичностьЛимитирования" я выбираю точное значение 'Месяц'
		Когда открылось окно 'Управление планами и лимитами'
		И из выпадающего списка с именем "РежимКонтроляЛимитов" я выбираю точное значение 'Информировать'				
		И я перехожу к следующему реквизиту
		И я устанавливаю флаг с именем 'ОбязательностьЗаполненияСтатейПриПланированииЗакупок'
		
	* Отличить контроль по ЦФО 
		И я нажимаю на гиперссылку с именем 'ДекорацияЛимитированиеЦФО'
		Тогда открылось окно "Параметры лимитирования ЦФО"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Параметры лимитирования ЦФО (создание)"
		И я нажимаю кнопку выбора у поля с именем 'ЦФО'
		Тогда открылось окно "Организационные единицы"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование в программе"  | "Тип организации" |
			| "ВА - ЦФО 6 (вне контроля)" | "ЦФО"             |
		И я нажимаю на кнопку с именем 'Выбрать'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Параметры лимитирования ЦФО (создание) *" в течение 20 секунд
		И Я закрываю окно "Параметры лимитирования ЦФО"
						
	* Создание элемента
		И я нажимаю на кнопку с именем 'УстановитьВидБюджетаБюджетДвиженияДенежныхСредств'
		И я нажимаю на кнопку с именем 'ВариантыНастроек'
		Тогда открылось окно 'Варианты настроек операционного плана'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Вариант настройки операционного плана (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'Автотест БДДС'
		И я перехожу к закладке с именем "СтраницаГоризонтПланирования"
		И в поле с именем 'КоличествоПериодов' я ввожу текст '12'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Вариант настройки операционного плана (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'БДДС (валюта в строке)'
		И в таблице 'НастройкаАналитик' я перехожу к строке:
			| "N" | "Аналитика" | "Использование" |
			| "3" | "Валюта"    | "В шапке"       |
	
		И в таблице 'НастройкаАналитик' из выпадающего списка с именем 'НастройкаАналитикИспользование' я выбираю точное значение "В строке"
		И я завершаю редактирование строки	
		И я перехожу к закладке с именем "СтраницаГоризонтПланирования"
		И в поле с именем 'КоличествоПериодов' я ввожу текст '12'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

		И я жду закрытия окна 'Вариант настройки операционного плана (создание) *' в течение 20 секунд
													
	* Проверка заполнения
		Когда открылось окно 'Варианты настроек операционного плана'
		И Я в списке "Варианты настроек операционного плана" по полю "Наименование" ищу и выбираю элемент 'Автотест БДДС' "По точному совпадению"		
		Тогда элемент формы с именем "ВидБюджета" стал равен 'Бюджет движения денежных средств'
		И элемент формы с именем "ВидГоризонта" стал равен 'Скользящий'
		И элемент формы с именем "КолвоПослеЗапятой" стал равен '3'
		И элемент формы с именем "КолвоПослеЗапятойВвод" стал равен '3'
		И элемент формы с именем "КолвоРазрядность" стал равен 'Единицы'
		И элемент формы с именем "КолвоРазрядностьВвод" стал равен 'Единицы'
		И элемент формы с именем "КоличествоПериодов" стал равен '12'
		И элемент формы с именем "Наименование" стал равен 'Автотест БДДС'
		И таблица "НастройкаАналитик" стала равной:
			| 'N'  | 'Аналитика'            | 'Значение аналитики' | 'Использование' | 'Группа' | 'Обязательно' | 'Возможно лимитирование' |
			| '1'  | 'Вид бюджета'          | ''                   | 'В шапке'       | ''       | 'Да'          | 'Да'                     |
			| '2'  | 'Период'               | ''                   | 'В колонке'     | ''       | 'Да'          | 'Да'                     |
			| '3'  | 'Валюта'               | ''                   | 'В шапке'       | ''       | 'Да'          | 'Да'                     |
			| '4'  | 'ЦФО'                  | ''                   | 'В шапке'       | ''       | 'Да'          | 'Да'                     |
			| '5'  | 'Проект'               | ''                   | 'В шапке'       | ''       | 'Нет'         | 'Да'                     |
			| '6'  | 'Направление операции' | 'Расход'             | 'В шапке'       | ''       | 'Да'          | 'Нет'                    |
			| '7'  | 'Статья бюджета'       | ''                   | 'В строке'      | 'Г1'     | 'Да'          | 'Да'                     |
			| '8'  | 'Аналитика1'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '9'  | 'Аналитика2'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '10' | 'Аналитика3'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '11' | 'Аналитика4'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '12' | 'Аналитика5'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '13' | 'Аналитика6'           | ''                   | 'В строке'      | 'Г2'     | 'Да'          | 'Да'                     |
			| '14' | 'Контрагент'           | ''                   | 'В шапке'       | ''       | 'Нет'         | 'Нет'                    |
			| '15' | 'Договор контрагента'  | ''                   | 'В шапке'       | ''       | 'Нет'         | 'Нет'                    |
		
		И элемент формы с именем "НеИспользовать" стал равен 'Нет'
		И элемент формы с именем "ПВХ" стал равен ''
		И элемент формы с именем "ПериодичностьОперативногоПланирования" стал равен 'Месяц'
		И элемент формы с именем "СуммаПослеЗапятой" стал равен '2'
		И элемент формы с именем "СуммаПослеЗапятойВвод" стал равен '2'
		И элемент формы с именем "СуммаРазрядность" стал равен 'Единицы'
		И элемент формы с именем "СуммаРазрядностьВвод" стал равен 'Единицы'

Сценарий: 01.03 Выполнить настройки планов и лимитов по БДР
		И Я открываю АРМ Управление лимитами по виду бюджета 'БДР'
		Когда открылось окно 'Управление планами и лимитами'
		И я нажимаю на кнопку с именем 'ОтчетнаяДатаКоманда'
		Тогда открылось окно 'Параметры контроля бюджета'
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьИнтервал' на элементе формы с именем "Список"
		Тогда открылось окно 'Выберите период'
		И в поле с именем 'DateBegin' я ввожу текст '01.01.2024'
		И в поле с именем 'DateEnd' я ввожу текст ''
		И я нажимаю на кнопку с именем 'Select'
		Тогда открылось окно 'Параметры контроля бюджета'
		И в таблице "Список" я активизирую поле с именем "Период"
		Если в таблице "Список" количество строк "меньше" 1 Тогда
			Когда открылось окно 'Параметры контроля бюджета'
			И Я закрываю окно 'Параметры контроля бюджета'
			Тогда открылось окно 'Управление планами и лимитами'
			И я нажимаю на кнопку с именем 'СледующийПериод'
			Тогда открылось окно '1С:Предприятие'
			И я нажимаю на кнопку с именем 'Button0'
			Тогда открылось окно 'Параметры контроля бюджета (создание)'
			И из выпадающего списка с именем "ПериодЛимитирования" я выбираю точное значение '1 января 2024 г.'
			И из выпадающего списка с именем "СпособОпределенияВалютыЛимитирования" я выбираю точное значение 'В валюте операции'	
			И из выпадающего списка с именем "ПериодичностьПланирования" я выбираю точное значение 'Квартал'
			И из выпадающего списка с именем "ПериодичностьЛимитированияБюджета" я выбираю точное значение 'Квартал'
			И из выпадающего списка с именем "РежимКонтроляРезервов" я выбираю точное значение 'Информировать'
			И я устанавливаю флаг с именем 'ОбязательностьЗаполненияСтатейПриПланированииЗакупок'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Параметры контроля бюджета (создание) *' в течение 20 секунд
		Иначе 
			И Я закрываю окно 'Параметры контроля бюджета'	

		И из выпадающего списка с именем "СпособОпределенияВалютыЛимитирования" я выбираю точное значение 'В валюте операции'	
		И из выпадающего списка с именем "ПериодичностьПланирования" я выбираю точное значение 'Квартал'
		И из выпадающего списка с именем "ПериодичностьЛимитирования" я выбираю точное значение 'Квартал'
		И из выпадающего списка с именем "РежимКонтроляРезервов" я выбираю точное значение 'Информировать'
		И я устанавливаю флаг с именем 'ОбязательностьЗаполненияСтатейПриПланированииЗакупок'
		
		И я нажимаю на гиперссылку с именем 'ДекорацияЛимитированиеЦФО'
		Тогда открылось окно "Параметры лимитирования ЦФО"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Параметры лимитирования ЦФО (создание)"
		И я нажимаю кнопку выбора у поля с именем 'ЦФО'
		Тогда открылось окно "Организационные единицы"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование в программе"  | "Тип организации" |
			| "ВА - ЦФО 6 (вне контроля)" | "ЦФО"             |
		И я нажимаю на кнопку с именем 'Выбрать'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Параметры лимитирования ЦФО (создание) *" в течение 20 секунд
		И Я закрываю окно "Параметры лимитирования ЦФО"

		И я перехожу к закладке с именем "НастройкиЛимитированияСтатейБюджета"		
		
		И Я в таблице статей "СписокСтатей" по полю "Статья бюджета" ищу и выбираю элемент 'ВА - Статья 1' "По точному совпадению"
		И в таблице 'СписокСтатей' я активизирую поле с именем 'СписокСтатейКонтрольРезервов'
		И в таблице "СписокСтатей" я выбираю текущую строку
		И я выбираю из списка 'Информировать'

		И Я в таблице статей "СписокСтатей" по полю "Статья бюджета" ищу и выбираю элемент 'ВА - Статья 2' "По точному совпадению"
		И в таблице 'СписокСтатей' я активизирую поле с именем 'СписокСтатейКонтрольРезервов'
		И в таблице "СписокСтатей" я выбираю текущую строку
		И я выбираю из списка 'Информировать'

		И Я в таблице статей "СписокСтатей" по полю "Статья бюджета" ищу и выбираю элемент 'ВА - Статья 3' "По точному совпадению"
		И в таблице 'СписокСтатей' я активизирую поле с именем 'СписокСтатейКонтрольРезервов'
		И в таблице "СписокСтатей" я выбираю текущую строку
		И я выбираю из списка 'Информировать'
						
		И Я закрываю окно 'Управление планами и лимитами'
								
Сценарий: 01.04 Назначить контрольные аналитики по статьям бюджета
	
	* Назначаем контрольные аналитики для статьей ДДС
		И Я открываю АРМ Управление лимитами по виду бюджета 'БДДС'
		И Я для статьи бюджета с именем 'ВА - Статья 1' устанавливаю контрольные аналитики по виду аналитики 'ВА - Объект расчетов', '', '', '', '', ''
		И Я для статьи бюджета с именем 'ВА - Статья 2' устанавливаю контрольные аналитики по виду аналитики 'Контрагенты', 'Номенклатурные группы', '', '', '', ''
		И Я для статьи бюджета с именем 'ВА - Статья 3' устанавливаю контрольные аналитики по виду аналитики 'Места поставки', '', '', '', ''
		И Я закрываю окно 'Управление планами и лимитами'

	* Назначаем контрольные аналитики для статей ДиР
		И Я открываю АРМ Управление лимитами по виду бюджета 'БДР'
		И Я для статьи бюджета с именем 'ВА - Статья 1' устанавливаю контрольные аналитики по виду аналитики 'ВА - Объект расчетов', '', '', '', '', ''
		И Я для статьи бюджета с именем 'ВА - Статья 2' устанавливаю контрольные аналитики по виду аналитики 'Контрагенты', 'Номенклатурные группы', '', '', '', ''
		И Я для статьи бюджета с именем 'ВА - Статья 3' устанавливаю контрольные аналитики по виду аналитики 'Места поставки', '', '', '', ''
		И Я закрываю окно 'Управление планами и лимитами'

Сценарий: 01.05 Включить использование заявок на расход по договору
	
	И Я устанавливаю в константу "СоздаватьЗаявкиНаРасходПланируемыеДоходы" значение "Истина"

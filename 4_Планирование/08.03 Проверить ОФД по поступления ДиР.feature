﻿#language: ru
@tree

@UH33_Planning_OFD_PL

Функционал: 08.03 Проверить создание ОФД по накладным - поступление

	Как Администратор я хочу
	создать и провести документы поступления (акту, накладные, УПД)
	чтобы проверить автоматическое создание, заполнение и проведение документа Отражение фактических данных по аналитикам планирования

Контекст:
	И Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения		

Переменные:
	ВАПроект = 'ВА - Проект 1'
	ВАЦФО = 'ВА - ЦФО 5 (ДР)'
	ВАСтатья = 'ВА - Статья 4'
	ВАОрганизация = 'ВА - ООО Тест'
	ВАКонтрагент = 'Автотест контрагент'
	ВАСуммаДокумента = '1000'
	ВАФизЛицо = 'Старк Бран'
	ВАСклад = 'ВА - Склад1'
	ВАНоменклатура = 'ВА - Товар1'
	ВАУслуга = 'Услуга1'
	ВАОсновноеСредство = 'ОС1'
	ВАЗемля = 'ОС2'
	ВАТранспорт = 'ВА - Транспорт1'

Сценарий: 08.00 Определеняем тип приложения

	Пусть Инициализация переменных	

Структура сценария: 08.01 Поступление (акты, накладные, УПД)

	* Создаем договор
		Если не существует элемент справочника "ДоговорыКонтрагентов" с "Номер" равным <ТекВидДоговора> Тогда
			И Я создаю договор с именем <ТекВидДоговора> с видом <ТекВидДоговора> 

	* Создаем документ
    	И Я создаю поступление (акты, накладные, УПД) номер 'ВАНомер 1' по виду операции <ТекВидОперации> по договору <ТекВидДоговора>	
	
	* Проверка создания ОФД
        И Я проверяю создание ОФД "Поступление (акты, накладные, УПД)" с параметром "Нет"
		И Я проверяю заполнение аналитик по виду бюджета 'БДР' в ОФД
		И Я проверяю движения по виду бюджета 'БДР' в ОФД

Примеры:
	| ТекВидОперации             | ТекВидДоговора                                 |
	| "Товары (накладная, УПД)"  | "С поставщиком"                                |
	| "Товары (накладная, УПД)"  | "С комиссионером (агентом) на закупку"         |
	| "Услуги (акт, УПД)"        | "С поставщиком"                                |
	| "Услуги (акт, УПД)"        | "С комиссионером (агентом) на продажу"         |
	| "Услуги (акт, УПД)"        | "С комиссионером (агентом) на закупку"         |
	| "Услуги (акт, УПД)"        | "С транспортной компанией (доставка и оплата)" |
	| "Товары, услуги, комиссия" | "С поставщиком"                                |
	| "Товары, услуги, комиссия" | "С комитентом (принципалом) на продажу"        |
	| "Товары, услуги, комиссия" | "С комиссионером (агентом) на закупку"         |
	| "Товары, услуги, комиссия" | "С транспортной компанией (доставка и оплата)" |
//	| "Основные средства"        | "С поставщиком"                                | - не включается в БДР (пропуск по ТЧ Осн.средства)
	| "Материалы в переработку"  | "С покупателем"                                |
	| "Услуги аренды"            | "С поставщиком"                                |
	| "Услуги лизинга"           | "С поставщиком"                                |
	| "Услуги факторинга"        | "Факторинг"                                    |
	| "Оборудование"             | "С поставщиком"                                |
	| "Оборудование"             | "С комиссионером (агентом) на закупку"         |
	| "Объекты строительства"    | "С поставщиком"                                |
	| "Объекты строительства"    | "С комиссионером (агентом) на закупку"         |
//	| "Земельные участки"        | "С поставщиком"                                | - не включается в БДР (пропуск по ТЧ Осн.средства)
	| "Топливо"                  | "С поставщиком"                                |
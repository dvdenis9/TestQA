﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание, проведение, дивжение и печать документа
*Создадим документа продажи
	И В командном интерфейсе я выбираю 'Продажи' 'Документы продаж'
	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
	Тогда открылось окно 'Продажа товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1,00'
	И я нажимаю на кнопку с именем 'ФормаПровести'
*Проверим движение по регистру взаиморасчетов
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Контрагент'                | 'Сумма' | 'Валюта' |
		| '1'            | 'Магазин "Бытовая техника"' | '1,00'  | ''       |
	
*Проверим движение по регистру продаж
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Покупатель'                | 'Товар'       | 'Количество' | 'Сумма' |
		| '1'            | 'Магазин "Бытовая техника"' | 'Sony К3456P' | '1,00'       | '1,00'  |
*Проверим движение по регистру товарных запасов
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" стала равной:
		| 'Номер строки' | 'Товар'       | 'Склад'               | 'Количество' |
		| '1'            | 'Sony К3456P' | 'Склад отдела продаж' | '1,00'       |
	
*Печать расходной накладной
	И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда табличный документ "SpreadsheetDocument" равен:
		| 'Расход товара' | ''                          | ''           | ''      |
		| ''              | ''                          | ''           | ''      |
		| 'Номер'         | '*'                 | ''           | ''      |
		| 'Дата'          | '*'       | ''           | ''      |
		| 'Покупатель'    | 'Магазин "Бытовая техника"' | ''           | ''      |
		| 'Склад'         | 'Склад отдела продаж'       | ''           | ''      |
		| 'Сумма'         | '1 рубль (Один рубль)'      | ''           | ''      |
		| 'Вес'           | ''                          | ''           | ''      |
		| ''              | ''                          | ''           | ''      |
		| 'Товар'         | 'Цена'                      | 'Количество' | 'Сумма' |
		| 'Sony К3456P'   | '1'                         | '1'          | '1'     |
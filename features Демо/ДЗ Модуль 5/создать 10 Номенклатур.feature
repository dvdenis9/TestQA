﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
Сценарий: создать 10 элементов справочника Номенклатура
И Я запоминаю значение выражения '0' в переменную "Шаг"
И я делаю 10 раз
	И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
	И Я запоминаю значение выражения '"НоваяНоменклатура" + $Шаг$' в переменную "Наименование"
	И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'Description_ru' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | '$Наименование$' |
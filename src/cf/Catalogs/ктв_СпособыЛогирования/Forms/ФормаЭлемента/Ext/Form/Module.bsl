﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	СсылкаНаОбъект = Объект.Ссылка;
	Если Параметры.Свойство("ЗначениеКопирования") Тогда
		Если ЗначениеЗаполнено(Параметры.ЗначениеКопирования) Тогда
			СсылкаНаОбъект = Параметры.ЗначениеКопирования;
		КонецЕсли;
	КонецЕсли;
	
	ктв_сб_ОбработкиОбслуживания.ОбъектПриСозданииНаСервере(Отказ
													   , СтандартнаяОбработка
													   , ЭтаФорма
													   , СсылкаНаОбъект
													   , ОбработкаПараметры.ПутьКДаннымОбработка
													   , ОбработкаПараметры.ПутьКДаннымОбработкаАдресВХранилище
													   , ОбработкаПараметры.ПутьКДаннымОбработкаПредставление
													   , ОбработкаПараметры.ИмяЭлементаВыбораОбработкиНаФорме
													   , ОбработкаПараметры.ПутьКДаннымОбработкаНастройки
													   , ОбработкаПараметры.ПутьКДаннымОбработкаНастройкиАдресВХранилище);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
	Если ИмяСобытия = "ИзмененыНастройки" И Параметр = ЭтаФорма Тогда
		Модифицированность = Истина;
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	ктв_сб_ОбработкиОбслуживания.ОбъектПередЗаписьюНаСервере(Отказ
														, ТекущийОбъект
														, ПараметрыЗаписи
														, ЭтаФорма
														, ОбработкаПараметры.ПутьКДаннымОбработка
														, ОбработкаПараметры.ПутьКДаннымОбработкаАдресВХранилище
														, ОбработкаПараметры.ПутьКДаннымОбработкаНастройки
														, ОбработкаПараметры.ПутьКДаннымОбработкаНастройкиАдресВХранилище);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ОбработкаОбслуживанияНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ктв_сб_ОбработкиОбслуживанияКлиент.ОбработкаОбслуживанияНачалоВыбора(Элемент
																	, ДанныеВыбора
																	, СтандартнаяОбработка
																	, ЭтаФорма
																	, ОбработкаПараметры.ПутьКДаннымОбработкаАдресВХранилище
																	, ОбработкаПараметры.ПутьКДаннымОбработкаПредставление
																	, ОбработкаПараметры.ПутьКДаннымОбработкаНастройкиАдресВХранилище
																	, ОбработкаПараметры.ПрефиксОбработки
																	, ОбработкаПараметры.ИмяКонтрольнойПроцедуры
																	, ОбработкаПараметры.ПараметрыКонтрольнойПроцедуры);
																	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОбслуживанияОткрытие(Элемент, СтандартнаяОбработка)
	
	ктв_сб_ОбработкиОбслуживанияКлиент.ОбработкаОбслуживанияОткрытие(Элемент
																, СтандартнаяОбработка
																, ЭтаФорма
																, ОбработкаПараметры.ПутьКДаннымОбработкаАдресВХранилище
																, ОбработкаПараметры.ПутьКДаннымОбработкаНастройкиАдресВХранилище);
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОбслуживанияОчистка(Элемент, СтандартнаяОбработка)
	
	ктв_сб_ОбработкиОбслуживанияКлиент.ОбработкаОбслуживанияОчистка(Элемент
															   , СтандартнаяОбработка
															   , ЭтаФорма
															   , ОбработкаПараметры.ПутьКДаннымОбработкаАдресВХранилище
															   , ОбработкаПараметры.ПутьКДаннымОбработкаПредставление);
															   
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

#КонецОбласти

//Заполняем значения стандартных параметров для работы с обработками обслуживания
ОбработкаПараметры = Новый Структура();

//Начало имени обработки для отбора обработок конфигурации
ОбработкаПараметры.Вставить("ПрефиксОбработки"								, "ктв_Лог_");

//Путь к реквизиту объекта, в котором хранится обработка
ОбработкаПараметры.Вставить("ПутьКДаннымОбработка"							, "Обработка");

//Путь к реквизиту формы, в котором хранится адрес обработки во временном хранилище
ОбработкаПараметры.Вставить("ПутьКДаннымОбработкаАдресВХранилище"			, "ОбработкаАдресВХранилище");

//Путь к реквизиту формы, в котором хранится представление обработки
ОбработкаПараметры.Вставить("ПутьКДаннымОбработкаПредставление"				, "ОбработкаПредставление");

//Имя элемента формы, в котором выполняется выбор обработки обслуживания
ОбработкаПараметры.Вставить("ИмяЭлементаВыбораОбработкиНаФорме"				, "ОбработкаОбслуживания");

//Путь к реквизиту объекта, в котором хранятся настройки обработки
ОбработкаПараметры.Вставить("ПутьКДаннымОбработкаНастройки"					, "ОбработкаНастройки");

//Путь к реквизиту формы, в котором хранится адрес настроек обработки во временном хранилище
ОбработкаПараметры.Вставить("ПутьКДаннымОбработкаНастройкиАдресВХранилище"	, "ОбработкаНастройкиАдресВХранилище");

//Имя функции модуля объекта обработки, вызываемой для проверки, что обработка является обработкой обслуживания
ОбработкаПараметры.Вставить("ИмяКонтрольнойПроцедуры"						, "ЭтоОбработкаЛогирования");

//Парметры функции, вызываемой для проверки
ОбработкаПараметры.Вставить("ПараметрыКонтрольнойПроцедуры"					, Неопределено);

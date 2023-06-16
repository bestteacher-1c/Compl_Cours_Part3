Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	
	Если ПолучитьФункциональнуюОпцию("УчетПоПодразделениям"
		, Новый Структура("ПФО_Организация", Организация)) = Ложь Тогда
	
		  Индекс = ПроверяемыеРеквизиты.Найти("Подразделение");
			ПроверяемыеРеквизиты.Удалить(Индекс);
			
	
	КонецЕсли;                      
	
	Если ПолучитьФункциональнуюОпцию("ВалютныйУчет"
		, Новый Структура("ПФО_Организация", Организация)) = Ложь Тогда
	
		  Индекс = ПроверяемыеРеквизиты.Найти("Валюта");
			ПроверяемыеРеквизиты.Удалить(Индекс);
			
	
	КонецЕсли;                      
	
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)

	Движения.Проводки.Записывать = Истина;
	
	Движение = Движения.Проводки.Добавить();
	
	Движение.Период = Дата;
	Движение.Организация = Организация;
	Движение.Сумма = СерверныйСВызовом.ПересчитатьИзВалютыВВалютуНаСервере(Валюта,,Сумма,Дата);;
	Движение.СодержаниеПроводки = "Поступили денежные средства";
	
	Движение.СчетДт = ?(Наличные,ПланыСчетов.Счета.Касса, ПланыСчетов.Счета.СчетВБанке);
	Серверный.ЗаполнитьПодразделениеСтороныПроводки(Движение,Подразделение,"Дт");
	Серверный.ЗаполнитьВалютуСтороныПроводки(Движение,Валюта, Сумма,"Дт");
	
	Движение.СчетКт = КорСчет;
	Серверный.ЗаполнитьСубконтоСтороныПроводки(Движение,1,КорСубконто1,"Кт");
	Серверный.ЗаполнитьСубконтоСтороныПроводки(Движение,2,КорСубконто2,"Кт");
	Серверный.ЗаполнитьПодразделениеСтороныПроводки(Движение,Подразделение,"Кт");
	Серверный.ЗаполнитьВалютуСтороныПроводки(Движение,Валюта, Сумма,"Кт");
	

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

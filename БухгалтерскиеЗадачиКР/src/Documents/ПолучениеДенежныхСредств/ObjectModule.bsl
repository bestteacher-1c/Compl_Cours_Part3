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
	Движение.Сумма = НаСервереМожноВызватьСКлиента.ПересчитатьИзВалютыВВалюту(Валюта,,Сумма,Дата);
	Движение.СодержаниеПроводки = "Поступили денежные средства";
	
	Движение.СчетДт = МестоХраненияДенежныхСредств.СчетУчета;
	БухгалтерияНаСервере.ЗаполнитьПодразделениеСтороныПроводки(Движение,Подразделение,"Дт");
	БухгалтерияНаСервере.ЗаполнитьСубконтоСтороныПроводки(Движение,"ДвиженияДенежныхСредств",ДвижениеДенежныхСредств,"Дт");
//	БухгалтерияНаСервере.ЗаполнитьВалютуСтороныПроводки(Движение,Валюта, Сумма,"Дт");

	
	Движение.СчетКт = КорСчет;
	БухгалтерияНаСервере.ЗаполнитьСубконтоСтороныПроводки(Движение,1,КорСубконто1,"Кт");
	БухгалтерияНаСервере.ЗаполнитьСубконтоСтороныПроводки(Движение,2,КорСубконто2,"Кт");
	БухгалтерияНаСервере.ЗаполнитьПодразделениеСтороныПроводки(Движение,Подразделение,"Кт");
//	БухгалтерияНаСервере.ЗаполнитьВалютуСтороныПроводки(Движение,Валюта, Сумма,"Кт");
	
	
КонецПроцедуры

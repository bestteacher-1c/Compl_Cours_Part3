
Процедура ОбработкаПроведения(Отказ, Режим)

	Движения.Проводки.Записывать = Истина;
	
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		
		Движение = Движения.Проводки.Добавить();
		
			
		Движение.СчетДт = ТекСтрокаТовары.СчетУчета;
		БухгалтерияНаСервере.ЗаполнитьПодразделениеСтороныПроводки(Движение,Подразделение ,"Дт");
		
		Если Не ТекСтрокаТовары.СчетУчета.Забалансовый Тогда
		
			Движение.СчетКт = ПланыСчетов.Счета.Поставщики;
			БухгалтерияНаСервере.ЗаполнитьПодразделениеСтороныПроводки(Движение,Подразделение ,"Кт");
		
		КонецЕсли; 
		
		Движение.Период = Дата;
		Движение.Сумма = ТекСтрокаТовары.Сумма;
		Движение.СодержаниеПроводки = "Поступили ТМЦ";
		Движение.Организация = Организация;
		
	КонецЦикла;

КонецПроцедуры




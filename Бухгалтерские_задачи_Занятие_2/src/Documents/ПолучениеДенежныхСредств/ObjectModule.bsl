Процедура ОбработкаПроведения(Отказ, Режим)


	Движения.Проводки.Записывать = Истина;
	Движение = Движения.Проводки.Добавить();
	
	Движение.СчетДт = МестоХраненияДенежныхСредств.СчетУчета;
	
	Движение.СчетКт = КорСчет;
	
	Движение.Период = Дата;
	Движение.Сумма = Сумма;
	Движение.СодержаниеПроводки = "Поступление ДС";

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)

	Движения.Проводки.Записывать = Истина;
	Движения.Проводки.БлокироватьДляИзменения = Истина;

	Движение = Движения.Проводки.Добавить();

	Движение.Период = Дата;
	Движение.Организация = Организация;
	Движение.Сумма = Сумма;
	Движение.СодержаниеПроводки = "Поступили денежные средства";

	Движение.СчетДт = КорСчет;
	БухгалтерияНаСервере.ЗаполнитьПодразделениеСтороныПроводки(Движение, Подразделение, "Дт");

	Движение.СчетКт = МестоХраненияДенежныхСредств.СчетУчета;
	БухгалтерияНаСервере.ЗаполнитьПодразделениеСтороныПроводки(Движение, Подразделение, "Кт");

	Движения.Записать();
	
    //-------Проверка остатка -----

	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ПроводкиОстатки.СуммаОстатокДт
	|ИЗ
	|	РегистрБухгалтерии.Проводки.Остатки(&Период, Счет = &СчетУчетаДС, Организация = &Организация) КАК ПроводкиОстатки";

	СчетУчетаДС = МестоХраненияДенежныхСредств.СчетУчета;

	Запрос.УстановитьПараметр("Организация", Организация);
	Запрос.УстановитьПараметр("Период", Новый Граница(МоментВремени(), ВидГраницы.Включая));
	Запрос.УстановитьПараметр("СчетУчетаДС", СчетУчетаДС);

	РезультатЗапроса = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();

	Если ВыборкаДетальныеЗаписи.Следующий() Тогда

		Если ВыборкаДетальныеЗаписи.СуммаОстатокДт < 0 Тогда

			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = "Нехватает денежных средств. Нехвакта " + ВыборкаДетальныеЗаписи.СуммаОстатокДт;
			Сообщение.Поле = "Сумма";
			Сообщение.УстановитьДанные(ЭтотОбъект);
			Сообщение.Сообщить();

			Отказ = Истина;

		КонецЕсли;
	КонецЕсли;

КонецПроцедуры
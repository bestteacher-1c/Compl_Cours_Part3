Процедура ПередЗаписью(Отказ)

	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
				   |	РасчетыПоДоговорам.Значение КАК Значение
				   |ИЗ
				   |	Константа.РасчетыПоДоговорам КАК РасчетыПоДоговорам";

	РезультатЗапроса = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();

	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл

		ДополнительныеСвойства.Вставить("ЗначениеДо", ВыборкаДетальныеЗаписи.Значение);

	КонецЦикла;

КонецПроцедуры

Процедура ПриЗаписи(Отказ)

	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
				   |	РасчетыПоДоговорам.Значение КАК Значение
				   |ИЗ
				   |	Константа.РасчетыПоДоговорам КАК РасчетыПоДоговорам";

	РезультатЗапроса = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();

	ВыборкаДетальныеЗаписи.Следующий();

	ДополнительныеСвойства.Вставить("ЗначениеПосле", ВыборкаДетальныеЗаписи.Значение);

	Если ДополнительныеСвойства.ЗначениеПосле <> ДополнительныеСвойства.ЗначениеДо Тогда

		ОбновитьПовторноИспользуемыеЗначения();

		Если ДополнительныеСвойства.ЗначениеПосле = Истина Тогда
			ВидСубконто = ПланыВидовХарактеристик.ВидыСубконто.Контрагенты;
		Иначе
			ВидСубконто = ПланыВидовХарактеристик.ВидыСубконто.Договоры;
		КонецЕсли;

		Запрос = Новый Запрос;
		Запрос.Текст = "ВЫБРАТЬ
					   |	СчетаВидыСубконто.Ссылка КАК Ссылка
					   |ИЗ
					   |	ПланСчетов.Счета.ВидыСубконто КАК СчетаВидыСубконто
					   |ГДЕ
					   |	СчетаВидыСубконто.ВидСубконто = &ВидСубконто";

		Запрос.УстановитьПараметр("ВидСубконто", ВидСубконто);

		РезультатЗапроса = Запрос.Выполнить();

		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();

		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл

			ДанныеСчета = НаСервереМожноВызватьСКлиента.ПолучитьСвойствоСчета(ВыборкаДетальныеЗаписи.Ссылка);

			ПСОбъект = ВыборкаДетальныеЗаписи.Ссылка.ПолучитьОбъект();

			Если ДополнительныеСвойства.ЗначениеПосле = Истина Тогда
				//Добавить
				Если ДанныеСчета.КоличествоСубконто = 2 Тогда

					Продолжить;

				КонецЕсли;

				НоваяСтрока = ПСОбъект.ВидыСубконто.Добавить();
				НоваяСтрока.ВидСубконто = ПланыВидовХарактеристик.ВидыСубконто.Договоры;

			Иначе
				//Удалить
				СтрокаДляУдаления = ПСОбъект.ВидыСубконто.Найти(ПланыВидовХарактеристик.ВидыСубконто.Договоры,
					"ВидСубконто");

				ПСОбъект.ВидыСубконто.Удалить(СтрокаДляУдаления);

			КонецЕсли;

			ПСОбъект.Записать();

		КонецЦикла;

	КонецЕсли;
КонецПроцедуры
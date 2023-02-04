Процедура ПередЗаписью(Отказ, Замещение)

	Проводки = ЭтотОбъект;

	Если (Количество() = 0) Тогда
		Возврат;
	КонецЕсли;

	Период = Проводки[0].Период;
	ВалютаУчета = Константы.ВалютаУчета.Получить();
	ВалютаХолдинга = Константы.ВалютаХолдинга.Получить();

	КроссКурс = БухгалтерияСервер.ПолучитьКроссКурсВалют(ВалютаУчета, ВалютаХолдинга, Период);

	Для Каждого Проводка Из Проводки Цикл
		
		Если (Проводка.СуммаХолдинга = 0) Тогда
			Проводка.СуммаХолдинга = Проводка.Сумма * КроссКурс;
		КонецЕсли;
		
	КонецЦикла;

КонецПроцедуры
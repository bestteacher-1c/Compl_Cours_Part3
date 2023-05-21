
////////////////////////////////////////////////////////////////////////////////
// РЕДАКТИРОВАНИЕ СТРОКИ ТЧ

&НаКлиенте
Процедура ТоварыНоменклатураПриИзменении(Элемент)
	
	ВычислитьСуммуВТекущейСтрокеТЧ();
	
	ТекДанные = Элементы.Товары.ТекущиеДанные;
	
	ТекДанные.СчетУчета = НаСервереМожноВызватьСКлиента.ПолучитьСчетУчетаНоменклатуры(ТекДанные.Номенклатура, Объект.Организация);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ВычислитьСуммуВТекущейСтрокеТЧ();
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ВычислитьСуммуВТекущейСтрокеТЧ();
	
КонецПроцедуры

&НаКлиенте
Процедура ВычислитьСуммуВТекущейСтрокеТЧ()
	
	ТекДанные = Элементы.Товары.ТекущиеДанные;
	ТекДанные.Сумма = ТекДанные.Цена * ТекДанные.Количество;
	
КонецПроцедуры

//---

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ОрганизацияПриИзмененииНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОрганизацияПриИзмененииНаСервере()

	ПараметрыФО = Новый Структура;
	ПараметрыФО.Вставить("ПФО_Организация", Объект.Организация);
	
	УстановитьПараметрыФункциональныхОпцийФормы(ПараметрыФО);
	

КонецПроцедуры

&НаКлиенте
Процедура ОрганизацияПриИзменении(Элемент)
	ОрганизацияПриИзмененииНаСервере();
КонецПроцедуры

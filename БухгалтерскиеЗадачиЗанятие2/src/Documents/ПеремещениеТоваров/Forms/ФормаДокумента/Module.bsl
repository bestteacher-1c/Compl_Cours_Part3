&НаКлиенте
Процедура ТоварыНоменклатураПриИзменении(Элемент)

	ТекДанные = Элементы.Товары.ТекущиеДанные;
	
	ТекДанные.СчетУчета = НаСервереМожноВызватьСКлиента.ПолучитьСчетУчетаНоменклатуры(ТекДанные.Номенклатура, Объект.Организация);
	ТекДанные.НовыйСчетУчета = НаСервереМожноВызватьСКлиента.ПолучитьСчетУчетаНоменклатуры(ТекДанные.Номенклатура, Объект.Организация);
	
КонецПроцедуры

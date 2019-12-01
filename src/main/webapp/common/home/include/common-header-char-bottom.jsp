
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:set var="lang" value="%{currentLocale}"/>

<script>

	var widgetTotalFound='<s:property value="%{widget.getCommonFound()}"/>';
	var widgetPersonalFound='<s:property value="%{widget.getPersonalFound()}"/>';
	var widgetTotalSanction='<s:property value="%{widget.getSanctions()}"/>';
	var widgetDataInfos='<s:property value="%{widget.toJSONArray()}"/>';
	var widgetLoanAmount='<s:property value="%{widget.getLoan().getAmount()}"/>';
	var widgetLoanDate ='<s:text name="loan.column.date.remb"/>:<span class="mr-2 text-danger"><s:property value="%{widget.getLoan().getLoanDateBack()}"/></span>';

	var widget = {
		widgetTotalFound: widgetTotalFound,
		widgetPersonalFound: widgetPersonalFound,
		widgetTotalSanction: widgetTotalSanction,
		widgetLoanAmount:widgetLoanAmount,
		widgetLoanDate:widgetLoanDate
	};

	var data = ["Banana", "Orange", "Apple", "Mango"];
	var labels = ["Banana", "Orange", "Apple", "Mango"];
	labels.fill("Kiwi");

	var widgetDataInfo = {
		month: widgetTotalFound,
		amount: widgetPersonalFound
	};
	var lng='<s:property  value="%{#lang}" />';
	ChartManager.loadWidgets({widgetInfo: widget});
	DSCharManager.chartLoan({lang:lng,widgetDataInfo: widgetDataInfos});
</script>





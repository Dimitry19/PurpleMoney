
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:set var="lang" value="%{currentLocale}"/>

<script>

	var widgetTotalFound='<s:property value="%{widget.getCommonFound()}"/>';

	var widgetPersonalFound='<s:property value="%{widget.getPersonalFound()}"/>';
	var widgetTotalSanction='<s:property value="%{widget.getSanctions()}"/>';
	<s:set var="widgetLoanInfoChart" value="%{widget.retrieveWidgetLoanInfosChart()}"/>
	<s:set var="widgetFrequenceInfoChart" value="%{widget.retrieveWidgetFrequenceInfosChart()}"/>
	var widgetLoanAmount='<s:property value="%{widget.getLoan().getAmount()}"/>';
	var widgetLoanDate ='<s:text name="loan.column.date.remb"/>:<span class="mr-2 text-danger"><s:property value="%{widget.getLoan().getLoanDateBack()}"/></span>';

	var widget = {
		widgetTotalFound: widgetTotalFound,
		widgetPersonalFound: widgetPersonalFound,
		widgetTotalSanction: widgetTotalSanction,
		widgetLoanAmount:widgetLoanAmount,
		widgetLoanDate:widgetLoanDate
	};


	var lng='<s:property  value="%{#lang}" />';
	var wlic='<s:property  value="%{#widgetLoanInfoChart}" />';
	var wfic='<s:property  value="%{#widgetFrequenceInfoChart}" />';


	var widgetLoanInfosChart = new Array();
	var widgetFrequenceInfosChart = new Array();
	widgetLoanInfosChart = wlic.split(',','12');
	widgetFrequenceInfosChart = wfic.split(',','3');

	DSCharManager.loadWidgets({widgetInfo: widget});
	DSCharManager.chartFrequence({lang: lng});
	DSCharManager.chartLoan({lang:lng});
</script>





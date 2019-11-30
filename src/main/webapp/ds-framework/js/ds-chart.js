var ChartManager;
ChartManager = function () {
	var debug = true;


	function loadWidgetInfos(jsonObj){

		$('#totalFound').html("€ "+widgetTotalFound);
		$('#personalFound').html("€ "+widgetPersonalFound);
		$('#totalLoan').html("€ "+widgetLoanAmount);
		$('#totalSanction').html("€ "+widgetTotalSanction);
		//$('#totalLoanMsg').html("Date:"+"<span class='mr-2 text-danger'>"+widgetLoanDate+"</span>");
		$('#totalLoanMsg').html(widgetLoanDate);
		$('#totalLoanMsg').css({"margin-left": "86px","margin-bottom":"-28px"});
	//'<span class="mr-2 text-danger">+widgetLoanDate</span>';
	}

	return {
		loadWidgets:function(jsonObj){
			loadWidgetInfos(jsonObj);
		}
	}

}();

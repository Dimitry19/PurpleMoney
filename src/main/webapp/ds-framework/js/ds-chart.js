var ChartManager;
ChartManager = function () {
	var debug = true;


	function loadWidgetInfos(jsonObj){
		//var totalFound=jsonObj
		console.log(jsonObj.widgetInfo)
		$('#totalFound').html("€ "+widgetTotalFound);
		$('#personalFound').html("€ "+widgetPersonalFound);
		$('#totalLoan').html("€ "+widgetLoans);
		$('#totalSanction').html("€ "+widgetTotalSanction);
	}

	return {
		loadWidgets:function(jsonObj){
			loadWidgetInfos(jsonObj);
		}
	}

}();

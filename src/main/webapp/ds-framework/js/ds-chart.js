var DSCharManager;
DSCharManager = function () {
// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';
	var mois=['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Decembre']
	var months=['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'Agust', 'September', 'October', 'November', 'December']
	var mesi=['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Guigno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre']
	var labelsFr=['Absences', 'Presences','Restants']
	var labelsEn=['Absences', 'Presences','Rest']
	var labelsIt=['Assenze', 'Presenze','Rimanenti']
	var debug = true;


	var optionsLoan={
		type: 'bar',
		data: {
			//labels: months,
			datasets: [{
				data: [],
				backgroundColor:[
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(6, 66, 5, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255,1)',
					'rgba(255, 159, 64, 1)',
					'rgba(87, 58, 120, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(219, 0, 0, 0.89)',
					'rgba(142, 239, 97, 1)',
					'rgba(129, 58, 19, 1)',
					'rgba(255, 159, 64, 1)'
				],
				hoverBackgroundColor: "#7bf4f2",
				borderWidth: 2
			}]
		},
		options: {
			/*maintainAspectRatio: false,
			layout: {
				padding: {
					left: 10,
					right: 25,
					top: 25,
					bottom: 0
				}
			},*/
			responsive:true,
			scales: {
				xAxes: [{
					time: {
						unit: 'month'
					},
					gridLines: {
						display: false,
						drawBorder: false
					},
					ticks: {
						//maxTicksLimit: 6
					},
					maxBarThickness: 15,
					stacked: true,
				}],
				yAxes: [{
					ticks: {
						beginAtZero: true,
						min: 0,
						max: 2000,
						maxTicksLimit: 5,
						padding: 10,
						// Include a dollar sign in the ticks
						callback: function(value, index, values) {
							return Number(value)+'€';
						}
					},
					gridLines: {
						color: "rgb(234, 236, 244)",
						zeroLineColor: "rgb(234, 236, 244)",
						drawBorder: false,
						borderDash: [2],
						zeroLineBorderDash: [2]
					}
				}]
			},
			legend: {
				display: false
			},
			tooltips: {
				titleMarginBottom: 10,
				titleFontColor: '#e31932',
				titleFontSize: 14,
				backgroundColor: "#292937",
				bodyFontColor: "#dddfeb",
				borderColor: '#dddfeb',
				borderWidth: 1,
				xPadding: 15,
				yPadding: 15,
				displayColors: false,
				caretPadding: 10,
				callbacks: {
					title: function(tooltipItem, data) {
						return data['labels'][tooltipItem[0]['index']];
					},
					label: function(tooltipItem, data) {
						return data['datasets'][0]['data'][tooltipItem['index']]+'€';
					},
					afterLabel: function(tooltipItem, data) {
						var dataset = data['datasets'][0];
						var percent = Number(tooltipItem.yLabel)+'€'
						return ;
					}
				}
			},
		}
	}
	var optionsFrequence={
		type: 'doughnut',
		data: {
			datasets: [{
				data: [],
				backgroundColor: ['#fe5252','#1cc88a','#4180e3'],
				hoverBackgroundColor: ['#FE5252', '#1cc88a','#4180e3'],
				hoverBorderColor: "rgba(234, 236, 244, 1)",
			}],
		},
		options: {
			maintainAspectRatio: false,
			responsive:true,
			tooltips: {
				backgroundColor: "rgb(255,255,255)",
				bodyFontColor: "#858796",
				borderColor: '#dddfeb',
				borderWidth: 1,
				xPadding: 15,
				yPadding: 15,
				displayColors: false,
				caretPadding: 10,
			},
			legend: {
				display: false
			},
			tooltips: {
				callbacks: {
					title: function(tooltipItem, data) {
						return data['labels'][tooltipItem[0]['index']];
					},
					label: function(tooltipItem, data) {
						return data['datasets'][0]['data'][tooltipItem['index']];
					},
					afterLabel: function(tooltipItem, data) {
						var dataset = data['datasets'][0];
						var percent = Math.round((dataset['data'][tooltipItem['index']] / dataset["_meta"][0]['total']) * 100)
						return '(' + percent + '%)';
					}
				}
			},
			cutoutPercentage: 80,
		},
	}

	var ctxLoan = document.getElementById('loan');
	var ctxFrequence = document.getElementById("frequence");

	function frequenceChart(jsonObj){

		var lang=jsonObj.lang;
		var label=labelCustom(lang,2);
		optionsFrequence.data.labels=label;

		var freqChart = new Chart(ctxFrequence, optionsFrequence);
		var data = widgetFrequenceInfosChart.map(function (x) {
			return parseInt(x,10);
		});
		addData(freqChart,label,data);
		//loanChart.update();

	}


	function loadChart(jsonObj){

		var lang=jsonObj.lang;
		var m=labelCustom(lang,1);

		optionsLoan.data.labels=labelCustom(lang,1);
		var loanChart = new Chart(ctxLoan, optionsLoan);
		var data = widgetLoanInfosChart.map(function (x) {
			return parseFloat(x);
		});
		addData(loanChart,m,data);
		//loanChart.update();

	}
	function addData(chart, label, data) {
		chart.data.labels.push(label);
		for(var i in data){
			chart.data.datasets.forEach((dataset) => {
				dataset.data.push(data[i]);
			});
			chart.update();
		}

	}

	function labelCustom(lang,freq) {
		var  label;

		switch(freq) {
			case 1:
				if(lang == 'it'){
					label=mesi;
				}
				if(lang == 'en'){
					label=months;
				}
				if(lang == 'fr'){
					label=mois;
				}
				break;
			case 2:
				if(lang == 'it'){
					label=labelsIt;
				}
				if(lang == 'en'){
					label=labelsEn;
				}
				if(lang == 'fr'){
					label=labelsFr;
				}
				break;
		}

		return label;
	}
	function removeData(chart) {
		chart.data.labels.pop();
		chart.data.datasets.forEach((dataset) => {
			dataset.data.pop();
		});
		chart.update();
	}
	function loadWidgetInfos(jsonObj){

		$('#totalFound').html("€ "+widgetTotalFound);
		$('#personalFound').html("€ "+widgetPersonalFound);
		$('#totalLoan').html("€ "+widgetLoanAmount);
		$('#totalSanction').html("€ "+widgetTotalSanction);
		//$('#totalLoanMsg').html("Date:"+"<span class='mr-2 text-danger'>"+widgetLoanDate+"</span>");
		$('#totalLoanMsg').html(widgetLoanDate);
		//$('#totalLoanMsg').css({"margin-left": "86px","margin-bottom":"-28px"});
		//'<span class="mr-2 text-danger">+widgetLoanDate</span>';
	}

	return {
		chartLoan:function(jsonObj){
			loadChart(jsonObj);
		},
		loadWidgets:function(jsonObj){
			loadWidgetInfos(jsonObj);
		},
		chartFrequence:function(jsonObj){
			frequenceChart(jsonObj);
		}
	}

}();






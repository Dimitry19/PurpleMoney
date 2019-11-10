var DSCharManager;
DSCharManager = function () {
// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';
	var debug = true;

	function number_format(number, decimals, dec_point, thousands_sep) {
		// *     example: number_format(1234.56, 2, ',', ' ');
		// *     return: '1 234,56'
		number = (number + '').replace(',', '').replace(' ', '');
		var n = !isFinite(+number) ? 0 : +number,
			prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
			sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
			dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
			s = '',
			toFixedFix = function(n, prec) {
				var k = Math.pow(10, prec);
				return '' + Math.round(n * k) / k;
			};
		// Fix for IE parseFloat(0.55).toFixed(0) = 0;
		s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
		if (s[0].length > 3) {
			s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		}
		if ((s[1] || '').length < prec) {
			s[1] = s[1] || '';
			s[1] += new Array(prec - s[1].length + 1).join('0');
		}
		return s.join(dec);
	}
	var mois=['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Decembre']
	var months=['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'Agust', 'September', 'October', 'November', 'December']
	var mesi=['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Guigno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre']


	var options={
		type: 'bar',
		data: {
			//labels: months,
			datasets: [{
				//label: 'Prets',
				//ata: [1200, 900, 350, 255, 200, 300, 1520,600,254,883,550,1980],
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
							return '€' + number_format(value);
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
				titleFontColor: '#6e707e',
				titleFontSize: 14,
				backgroundColor: "rgb(255,255,255)",
				bodyFontColor: "#858796",
				borderColor: '#dddfeb',
				borderWidth: 1,
				xPadding: 15,
				yPadding: 15,
				displayColors: false,
				caretPadding: 10,
				callbacks: {
					label: function(tooltipItem, chart) {
						var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
						return datasetLabel + ': €' + number_format(tooltipItem.yLabel);
					}
				}
			},
		}
	}

	var ctx = document.getElementById('loan').getContext('2d');


	function loadChart(jsonObj){

		var lang=jsonObj.lang;
		var widgetInfo=jsonObj.widgetInfo;
		console.log(JSON.stringify(widgetDataInfos));
		var m;

		if(lang == 'it'){
			m=mesi;
		}
		if(lang == 'en'){
			m=months;
		}
		if(lang == 'fr'){
			m=mois;
		}

		options.data.labels=m;
		var loanChart = new Chart(ctx, options);
		var data=1520;
		addData(loanChart,m,data);
		//loanChart.update();

	}
	function addData(chart, label, data) {
		chart.data.labels.push(label);
		chart.data.datasets.forEach((dataset) => {
			dataset.data.push(data);
		});
		chart.update();
	}

	function removeData(chart) {
		chart.data.labels.pop();
		chart.data.datasets.forEach((dataset) => {
			dataset.data.pop();
		});
		chart.update();
	}

	return {
		chartLoan:function(jsonObj){
			loadChart(jsonObj);
		}
	}

}();





		
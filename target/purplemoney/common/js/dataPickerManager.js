var DataPickerManager = function () {


	var mois = ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Decembre']
	var months = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'Agust', 'September', 'October', 'November', 'December']
	var mesi = ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Guigno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre']

	var jour = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi']
	var jourMin = ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam']
	var giorni = ['Domenica', 'Lunedi', 'Martedi', 'Mercoledi', 'Giovedi', 'Venerdi', 'Sabato']
	var giorniMin = ['Dom', 'Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab']

	var altDateFormat="DD d MM yy"
	var dateFormat = "dd/mm/yy";

	var animation = {
		slideDown: 'slideDown',
		fadeIn: 'fadeIn',
		blind: 'blind',
		bounce: 'bounce',
		clip: 'clip',
		drop: 'drop',
		fold: 'fold',
		slide: 'slide'
	}
	var globalOptions;
	var options = {
		dateFormat:dateFormat,
		language: null,
		minDate: 0,
		/*monthNames: null,
		dayNames: null,
		dayNamesMin: null,
		// buttonText: "Choose",
		// changeMonth: true,
		altField: null,*/
		altFormat: altDateFormat,
		showAnim: animation.fadeIn,
		changeMonth: true,
		numberOfMonths: 2
	}


	function init(json) {

		var idFrom = '#' + json.idFrom;
		var alternateFrom = '#' + json.alternateFrom;
		var idTo = '#' + json.idTo;
		var alternateTo = '#' + json.alternateTo;
		
		var lang = json.lang;
		var m, dn, dnm;


		if (lang == 'it') {
			m = mesi;
			dn = giorni;
			dnm = giorniMin;
		}
		if (lang == 'en') {
			m = months;
		}
		if (lang == 'fr') {
			m = mois;
			dn = jour;
			dnm = jourMin;
		}

		options.language=lang;
		options.minDate=0;
		options.monthNames=m;
		options.dayNames=dn;
		options.dayNamesMin=dnm;
		if(alternateFrom!=null && alternateFrom!='#undefined'){
			options.altField=alternateFrom;
		}


		
		if (idTo!=null && idTo!='#undefined') {
			if(alternateTo!=null && alternateTo!='#undefined'){
				options.altField=alternateTo;
			}

			var from = $(idFrom)
					.datepicker(options)
					.on( "change", function() {
						to.datepicker( "option", "minDate", getDate( this ) );
					}),
				to = $(idTo).datepicker(options)
					.on("change", function() {
						from.datepicker( "option", "maxDate", getDate( this ) );
					});
		}else{
			$(idFrom).datepicker(options);
		}
	}

	function getDate( element ) {
		var date;
		try {
			console.log(element.value);
			date = $.datepicker.parseDate( dateFormat, element.value );
		} catch( error ) {
			date = null;
		}

		return date;
	}


	return {

		init: function (json) {
			init(json);
		}
	}

}();
var DataPickerManager = function () {


	var mois = ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Decembre']
	var months = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'Agust', 'September', 'October', 'November', 'December']
	var mesi = ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Guigno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre']

	var jour = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi']
	var jourMin = ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam']
	var giorni = ['Domenica', 'Lunedi', 'Martedi', 'Mercoledi', 'Giovedi', 'Venerdi', 'Sabato']
	var giorniMin = ['Dom', 'Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab']

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

	function enablejQueryDatePicker(json) {

		var id = '#' + json.id;
		var alternate = '#' + json.alternate;
		var lang = json.lang;
		var m, dn, dnm;
		var dateFormat = "dd/mm/yy";

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

		var options = {
			dateFormat: dateFormat,
			language: lang,
			minDate: 0,
			monthNames: m,
			dayNames: dn,
			dayNamesMin: dnm,
			// buttonText: "Choose",
			// changeMonth: true,
			altField: alternate,
			altFormat: "DD d MM yy",
			showAnim: animation.fadeIn
		}
		//$(id).datepicker({ dateFormat:dateFormat,language: lang,  minDate:0 });
		$(id).datepicker(options);
		//$(id).datepicker($.datepicker.regional[ lang ]);

	}

	return {

		enable: function (json) {

			enablejQueryDatePicker(json);
		}

	}

}();
var Select2Manager;
Select2Manager = function () {

    var debug = true;

	function autocomplete(jsonObj) {

		var lang=jsonObj.lang;
		var selectItem='Seach a name';
		if(lang==="it"){
			selectItem='Ricerca un nome';
		}
		if(lang==="fr"){
			selectItem='Rechercer un nom';
		}

		$('.select-autocomplete-s2').select2({
			placeholder: selectItem,
			minimumInputLength: 2,
			language: lang,
			ajax: {
				url: 'autocompleteMember.do',
				dataType: 'json',
				data:  function (params){
					var query= {
						userInput: params.term, // search term
					}
					return query;
				},
				/*results: function (data) { // parse the results into the format expected by Select2.
					// since we are using custom formatting functions we do not need to alter the remote JSON data
					console.log(data);
					return { results: data };
				},*/
				processResults: function (data) { //Return Response

					if(data.length>0){
						enableButton({idButton:'btnSearchMember', idField:'membersNames'});
					}

					var results = $.map(data, function (obj) {
						return {
							id: obj.id.name + " " + obj.surname,
							text: obj.id.name + " " + obj.surname
						};
					});
					console.log(results);   //Printing Response
					return {
						results: results,
					};
				},
				"more": true,
				cache: true//,
				//formatSelection: format,
				//formatResult: format,
			}
		});
	}


	function format(obj) {
		console.log(JSON.stringify(obj));
		//return "<img class='flag' src='images/flags/" + state.id.toLowerCase() + ".png'/>" + state.text; au cas ou on veut add la photo
		return obj.id.name  ;
	}

	function enableButton(jsonObj) {

		var id = '#' + jsonObj.idButton;
		$(id).prop("disabled",false);
	}

    return {
        autocomlete:function (jsonObj) {
            autocomplete(jsonObj);
        }
    }

}();

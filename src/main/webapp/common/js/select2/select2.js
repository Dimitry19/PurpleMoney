var Select2Manager;
Select2Manager = function () {

    var debug = true;

    function parameters(jsonObj){
    	var params={
    		select2lang:"",
		    select2Form:"",
		    select2Type:"",
		    select2Url:"",
		    select2Button:"",
		    select2Placeholder:""
	    };

	    params.select2Form=jsonObj.idForm;
	    params.select2lang=jsonObj.lang;
	    params.select2Type=jsonObj.type;
	    params.select2Url=jsonObj.url;
	    params.select2Button=jsonObj.button;

	    if(params.select2lang==="it"){

	    	if(params.select2Type==="role"){
			    params.select2Placeholder='Inserire un ruole';
		    }else{
			    params.select2Placeholder='Inserire un partecipante';
		    }
		    return params;
	    }
	    if(params.select2lang==="fr"){
		    if(params.select2Type==="role"){
			    params.select2Placeholder='Inserer un role';
		    }else {
			    params.select2Placeholder = 'Inserer un membre';
		    }
		    return params;
	    }
	    if(params.select2lang==="en"){
		    if(params.select2Type==="role"){
			    params.select2Placeholder='Input a role';
		    }else {
		        params.select2Placeholder='Input a member';
		    }
		    return params;
	    }
    }

	function autocomplete(jsonObj) {
    	var params=parameters(jsonObj);

    	$('.select-autocomplete-s2').select2({
			placeholder: params.select2Placeholder,
			minimumInputLength: 2,
			language: params.select2lang,
			ajax: {
				url: params.select2Url,
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
						if(params.select2Form==="formSearchMember"){
							enableButton({idButton:params.select2Button, idField:'membersNames'});
						}

						if(params.select2Form==="formRegister"){
							enableButton({idButton:params.select2Button, idField:'role'});
						}
						if(params.select2Form==="formAddAmount"){
							enableButton({idButton:params.select2Button, idField:'membersNames'});
						}
						if(params.select2Form==="formRegisterLoan"){
							enableButton({idButton:params.select2Button, idField:'membersNames'});
						}
						if(params.select2Form==="formEventAdd"){
							enableButton({idButton:params.select2Button, idField:'membersNames'});
						}
					}

					var results;
					if(params.select2Type==="member"){
						 results = $.map(data, function (obj) {
							return {
								id: obj.id.name,
								text: obj.id.name + " " + obj.surname
							};
						});
					}
					if(params.select2Type==="role"){
						 results = $.map(data, function (obj) {
							return {
								id: obj.id.role,
								text:obj.description
							};
						});
					}
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

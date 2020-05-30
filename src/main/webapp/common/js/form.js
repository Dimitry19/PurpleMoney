var FormManager;
FormManager = function () {

	var debug = true;


	function unfilled(jsonObj) {
		var idForm = '#' + jsonObj.idForm;
		console.log(idForm);
		$(idForm).find('input').val('');


	}

	function disableAllField(jsonObj) {
		var idForm = '#' + jsonObj.idForm;
		console.log(idForm);
		$(idForm).find('input').prop("readonly", true);
		$(idForm).find('input').val("");
		$('select').attr('disabled', true);

	}

	function hideButton(jsonObj) {
		var idBtn = '#' + jsonObj.idButton;
		$(idBtn).attr('display', none);

	}


	function formValidation(json) {
		console.log("formValidation");
		var idSubmit = '#' + json.idSubmit;
		var idForm = '#' + json.idForm;


		$(idSubmit).click(function (event) {
			//Fetch form to apply custom Bootstrap validation
			var form = $(idForm)

			if (form[0].checkValidity() === false) {
				event.preventDefault()
				event.stopPropagation()
			}

			form.addClass('was-validated');
		});
	}


	function disableButton(jsonObj) {

		var id = '#' + jsonObj.idButton;
		$(id).prop("disabled", true);
	}

	function enableButton(jsonObj) {

		var id = '#' + jsonObj.idButton;
		var idField = '#' + jsonObj.idField;
		var val = $(idField).val();
		if (val===null ) {
			//$("#dialog").dialog();
			//ModalManager.showModal();
			//$(id).prop("disabled", true);
		} else {

			$(id).prop("disabled", false);
		}
	}

	function onChecked(jsonObj) {
		var id = '#' + jsonObj.id;
		$(id).prop("checked", true );
	}
	function check(elt,jsonObj) {
		var id = '#' + jsonObj.id;

		if($(elt).is(":checked")){
			if($(id).is(":checked")){
				$(id).prop("checked", false );
			}
		}
	/*	else if($(elt).is(":not(:checked)")){
			if($(id).is(":not(:checked)")){
				$(elt).prop("checked", true);
			}
		}*/

	}
	function phone(jsonObj) {
		var value = '#' + jsonObj.idPhone;
		$(value).usPhoneFormat({
			format: '(xxx) xxx-xxxx'
		});
	}

	function blockResend() {
		if ( window.history.replaceState ) {
			window.history.replaceState( null, null, window.location.href );
		}

	}
	function loadImage(elt, json) {

		var id = '#' + json.id;

		var eltId = '#'+$(elt).attr("id");
		if (elt.files && elt.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
				$(id).attr('src', e.target.result);
			}
			console.log(elt.files[0]);
			reader.readAsDataURL(elt.files[0]);
			$(eltId).css("display", "none");
		}
	}


	return {
		validationForm: function (jsonObj) {
			formValidation(jsonObj);
		},
		disableBtn: function (jsonObj) {
			disableButton(jsonObj)
		},
		enableBtn: function (jsonObj) {
			enableButton(jsonObj)
		},
		disableAllFields: function (jsonObj) {
			disableAllField(jsonObj);
		}
		,
		checkboxClick: function (elt,jsonObj) {
			check(elt,jsonObj);
		},
		onChecked: function (jsonObj) {
			onChecked(jsonObj);
		},
		unfilledAllFields: function (jsonObj) {
			unfilled(jsonObj);
		},
		hideButton: function (jsonObj) {
			hideButton(jsonObj);
		},
		blockResendForm:function () {
			blockResend();
		},
		loadAndSaveImage: function (elt,json) {
			loadImage(elt,json);
		}
	}

}();

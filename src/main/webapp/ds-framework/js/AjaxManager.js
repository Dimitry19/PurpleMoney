var AjaxManager;
AjaxManager = function () {
	var debug = true;


	function makeAjaxCall(json){

		var action=json.action;
		var object=json.obj;
		var container='#'+json.container;
	    var idForm='#'+json.idForm;

	    var allInputs='#'+json.idForm + ' input,'+'#'+json.idForm+' select';


	    var cUrl;
		var jsons= {"userSearch.id.name" : "","userSearch.association" : "P10"};
		var url = action+"?";//action+"?"+object+"="+JSON.stringify(jsons);//QSManager.appendParameters(jsonObj.url+'&printerInfo.printerName='+printerName);

		$(allInputs).each(
			function(index){
				var input = $(this);
				//alert('Type: ' + input.attr('type') + 'Name: ' + input.attr('name') + 'Value: ' + input.val());
				console.log(index+"- Type: "+input.attr('type'));
				console.log(index+"- Name: "+input.attr('name'));
				console.log(index+"- Value: "+input.val());

				var name=input.attr('name');
				var val=input.val();

//http://javahonk.com/struts-2-ajax-jquery-json-example/


				if(input.attr('type')=='hidden'){
					cUrl=QSManager.appendParameters(url+'&'+name+'='+val);
				}
			}
		);




		/*$.ajax({
			url: json.url,
			type: 'POST',
			//dataType: 'json',
			success:function(response){
				$(container).html(response);
			},
			error:function(jqXhr, textStatus, errorThrown){
				alert(textStatus);
			}
		});*/
	}







		function retrieveParameters(elt) {

		var params='';
			if(elt==='#formSearchMember'){
				var userSearchName=$('#membersNames').val();
				var userSearchAssociation=$('#userSearchAssociation').val();

				var params="?userSearch.id.name="+userSearchName+"&userSearch.association="+userSearchAssociation+"";
				console.log(params);
			}


			return 	params;
		}


		function reloadListProjet(json) {
			// URL de l'action AJAX
			var url=json.url;
			var container='#'+json.container;
			var idForm='#'+json.idForm;
			var params=retrieveParameters(idForm);
			// Action AJAX en POST
			jQuery.post(
				url+params,
				function (data) {
					console.log(data);
					$(container).html(data);
				})
				.fail(function () {
					alert("Une erreur s'est produite.");
				});
		}


	function saveImage(json) {
		// URL de l'action AJAX
		var id = '#' + json.id;

		var data=$(id).attr('src');
		var entity=json.entity;
		var url=json.url;
		var user=json.user;
		var ass=json.ass;
		var params='';
		console.log(data);



		if(entity==='member'){
			var url="saveImage.do";
			 params=url+"?userInfo.filePictureStr="+data+"&userInfo.id.name="+user+"&userInfo.id.associationId="+ass+"";
			console.log(params);
			// Action AJAX en POST
			jQuery.post(
				params,
				function (data) {
					console.log(data);
					//NotificationManager.showMessage('success', response.result);
					//$(container).html(data);
				})
				.fail(function () {
					alert("Une erreur s'est produite.");
				});
		}


		}
	return {
		callAction:function(jsonObj){
			reloadListProjet(jsonObj);
		},
		saveImage:function(jsonObj){
			saveImage(jsonObj);
		}
	}

}();

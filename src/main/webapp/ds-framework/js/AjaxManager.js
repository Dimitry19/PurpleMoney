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







		function retrieveParameters(idForm) {

		var params='';
			if(idForm==='#formSearchMember'){
				var userSearchName=$('#membersNames').val();
				var userSearchAssociation=$('#userSearchAssociation').val();

				var params="?userSearch.id.name="+userSearchName+"&userSearch.association="+userSearchAssociation+"";
				console.log(params);
			}

			return 	params;
		}


		function reloadListProjet(json) {
			// URL de l'action AJAX
			var action=json.action;
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


		function sendRequest(json) {
			var action=json.action;

			var container='#'+json.container;
			var idForm='#'+json.idForm;

			var dataToSend = $(idForm).serialize();




			var url = QSManager.appendParameters(jsonObj.url+'&printerInfo.printerName='+printerName);
			if(debug){
				console.log('Url invocato: ' + url);
			}

			gs.executeAction({url:url,
				manageResult:function(data){
					eval('var response='+data );
					NotificationManager.showMessage('success', response.result);

				}});
		}
	function call(json) {
		console.log("Ajax call");

				var action=json.action;

				var container='#'+json.container;
				var idForm='#'+json.idForm;

				var dataToSend = $(idForm).serialize();

				var url=json.url+'/'+action+'?'+JSON.stringify(dataToSend);

				console.log(url);

				$.ajax({
					url:action,
					type: "POST",
					data:  dataToSend,
					dataType: 'json',
					//contentType:"application/json;charset=utf-8",
					async: true,
					success:function(result){
						alert(result);
						$(container).html(result);
					},error: function(data) {
						alert('woops!');
					}
				});



		function buildUrl(context,action) {


			$("#save").on({click:function () {
					if (!($("#subcategory").val().length == 0)) {
						$.ajax({
							url:"savecategory",
							data:$("#savecategoryform").serialize(),
							type:"post",
							dataType:"json",
							success:function (data) {
								alert("Successfully Saved");
							}});
					}
				}});
		}



	}
	return {
		callAction:function(jsonObj){
			reloadListProjet(jsonObj);
		}
	}

}();

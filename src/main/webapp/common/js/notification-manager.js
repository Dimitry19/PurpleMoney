var NotificationManager = function(){

    var persistentToastr;
    var nextAction;

    var persistentMessageContainerId = 'panthera-offline-container';

    //Default per messaggi persistenti
    var defaultPersistent = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-bottom-full-width",
        "onclick": null,
        "showDuration": "1000",
        "hideDuration": "0",
        "timeOut": "0",
        "extendedTimeOut": "0",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut",
        onHidden: function(){
            if(nextAction) {
                toastr.options = defaultoptions;
                toastr[nextAction.type](nextAction.msg, '');
                nextAction = null;
            }
        }
    };

    var defaultoptions = {
        "closeButton": false,
        "debug": false,
        "positionClass": "toast-top-right",
        "onclick": null,
		"showDuration": "1000",
		"hideDuration": "2000",
		"timeOut": "4000",
		"extendedTimeOut": "500",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    var showPantheraOfflineMessage = function(/*type, msg*/){

		if($('#'+persistentMessageContainerId).hasClass('hide')){
			$('#'+persistentMessageContainerId).removeClass('hide');
		}
    };

	var showPersistentMessage = function(type, msg){

		 toastr.options = defaultPersistent;
		 persistentToastr = toastr[type](msg, ''); // Wire up an event handler to a button in the toast, if it exists

	};

    var showMessage = function(type, msg){

        if(persistentToastr){
            nextAction = {type: type, msg: msg};
            persistentToastr.click();
            persistentToastr = null;
        }else{
            toastr.options = defaultoptions;
            var $toast = toastr[type](msg, ''); // Wire up an event handler to a button in the toast, if it exists
        }

    };

    var removePersistenceMessage = function () {

    	if(persistentToastr){
            persistentToastr.click();
        }

	};

	var hidePantheraOfflineMessage = function () {

		if(!$('#'+persistentMessageContainerId).hasClass('hide')){
			$('#'+persistentMessageContainerId).addClass('hide');
		}

	};

    return {

        showMessage: function(type, msg){
            showMessage(type, msg);
        },
		showPantheraOfflineMessage: function () {
			showPantheraOfflineMessage();
		},
		hidePantheraOfflineMessage: function () {
			hidePantheraOfflineMessage();
		},
        showPersistentMessage: function(type, msg){
            showPersistentMessage(type, msg);
        },
		removePersistenceMessage: function () {
			removePersistenceMessage();
		}

    }

}();
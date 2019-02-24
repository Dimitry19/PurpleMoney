var TelManager;
TelManager = function () {

    var debug = true;
    var emptyString="";
    var idErrorModal='#error-modal';
    var modal='<div class="modal fade" id="error-modal" role="dialog">' +
        '<div class="modal-dialog modal-sm">' +
        '<div class="modal-content"><div class="modal-header">' +
        '<button type="button" class="close" data-dismiss="modal">&times;</button>' +
        '<h4 class="modal-title"><span style="color:red">Errore</span></h4>' +
        '</div>' +
        '<div class="modal-body">' +
        '<p><span style="color:red">Scegliere la stampante</span></p>' +
        '</div>' +
        '<div class="modal-footer">' +
        '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>' +
        '</div></div></div></div>';

    function printLabel(jsonObj){

        sendRequest(jsonObj);
    }

    function printWorking(jsonObj){
        sendRequest(jsonObj);

    }




    function sendRequest(jsonObj) {

        var idTable='#'+jsonObj.idTable; //id della tabella dalla quale si fa la richiesta

        var printerName = $('#printer').val();
        if(printerName==emptyString){

            showErrorMessage(idTable,idErrorModal);
        }
        else{
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
    }


    function  showErrorMessage(id,idErrorModal){
        $(id).append(modal);
        $(idErrorModal).modal('show');
    }

    function fonetel(json){
        var id='#'+json.idTel;
        var input = document.querySelector(id);
        window.intlTelInput(input,({
            utilsScript:'/intlTelInput/build/js/utils.js', //file from google’s libphonenumber library
            autoPlaceholder:true

    }));

    }
    function formatTel(json) {
        var id='#'+json.idTel;
        console.log(id);
          $(id).intlTelInput({
              utilsScript:'/intlTelInput/build/js/utils.js', //file from google’s libphonenumber library
              autoPlaceholder:true
          });
    }

    function telFormat(json) {
        formatTel(json);
        //fonetel(json);
    }

    return {
        telFormat:function(json){
            telFormat(json);
        }
    }

}();

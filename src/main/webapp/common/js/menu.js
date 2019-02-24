$('#menuButton').click(
		function(){
        $('.menu').animate({"left":"0px"}, 1000);
       });

$('.closeButton').click(function(){
		        $('.menu').animate({"left":"-200px"}, 1000);
		});







/* GESTIONE STAMPE */
var PrinterManager;
PrinterManager = function () {

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

    function sendRequestToShowDetails(jsonObj) {

        if(jsonObj.prevOrderEsecAtv!=emptyString){
            var params='?orderEsecAtv.primaryQtaRcs='+jsonObj.primaryQtaRcs+'&orderEsecAtv.primaryQtaPrd='+jsonObj.primaryQtaPrd+'&orderEsecAtv.primaryQtaSca='+jsonObj.primaryQtaSca;
            var url = QSManager.appendParameters(jsonObj.url+params);
            if(debug){
                console.log('Url invocato: ' + url);
            }

            gs.executeAction({url:url,
                manageResult:function(data){
                    eval('var response='+data );
                    NotificationManager.showMessage('success', response.quantityProduced);
                }});
        }


    }

    function showErrorMessage(id,idErrorModal){
        $(id).append(modal);
        $(idErrorModal).modal('show');
    }

    function showDetails(jsonObj){
        sendRequestToShowDetails(jsonObj);
    }

    return {
        printWorking:function(jsonObj){
            printWorking(jsonObj);
        },
        printLabel:function (jsonObj) {
            printLabel(jsonObj);
        },
        showModal:function (jsonObj) {
            showDetails(jsonObj);
        }
    }

}();

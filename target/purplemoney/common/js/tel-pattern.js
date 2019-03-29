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





    function  showErrorMessage(id,idErrorModal){
        $(id).append(modal);
        $(idErrorModal).modal('show');
    }

    function formatTel(json) {
        var id='#'+json.idTel;
        var lang=json.lang;

        console.log(lang);
        console.log(id);
          $(id).CcPicker({
              dataUrl:"data.json",
              "countryCode":lang
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

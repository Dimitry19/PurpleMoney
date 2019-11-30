

var ModalManager;
ModalManager = function () {

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


var dialog='<div class="modal fade" id="modal-dialog" tabindex="-1" role="dialog" aria-labelledby="message-dialog" aria-hidden="true">'+
		'<div class="modal-dialog" role="document">'+
		'<div class="modal-content">'+
		'<div class="modal-header">'+
		'<h5 class="modal-title" id="message-dialog"><s:text name="common.show.detail"></h5>'+
		'<button type="button" class="close" data-dismiss="modal" aria-label="Close">'+
		'<span aria-hidden="true">&times;</span>'+
        '</button>'+
        '</div>'+
        '<div class="modal-body">TEST</div>'+
        '<div class="modal-footer">'+
        '<button type="button" class="btn btn-secondary" data-dismiss="modal"><s:text name="common.label.btn.close"></button>'+

        '</div>'+
        '</div>'+
        '</div>'+
        '</div>';

    function showDetails(){
        var modalId='#modal-dialog';
	    $(modalId).modal('show');
    }





    return {

        showModal:function (jsonObj) {
            showDetails(jsonObj);
        }
    }

}();

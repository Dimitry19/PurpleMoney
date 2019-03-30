var EventManager;
EventManager = function () {

    var debug = true;



    function disableAllField(json) {
        var idForm='#'+json.formId;
        console.log(idForm);
        $(idForm).find('input').prop("readonly", true);

    }
    function enableAllField() {
        //jQuery.noConflict();
        $('#eventDate').datepicker();

    }

    function enable() {
        enableAllField()
    }

    function disable(jsonObj) {
        disableAllField(jsonObj)
    }


    return {
        enablePickDate:function(){
            enable();
        },
        disableFields:function (jsonObj) {
            disable(jsonObj)
        }
    }

}();

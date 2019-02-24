var MembersManager;
MembersManager = function () {

    var debug = true;

    function disable(formName){

    }

    function disableAllField(json) {
        var idForm='#'+json.formId;
        console.log(idForm);
        $(idForm).find('input').prop("readonly", true);

    }
    function enableAllField(json) {
        var idForm='#'+json.formId;
            console.log(idForm);
            /* editer seulement certains champs*/
        $(idForm).find('input').removeAttr('readonly');
        $(idForm).find('input[id="sex"]').prop("readonly", true);
        $(idForm).find('input[id="role"]').prop("readonly", true);
        $(idForm).find('input[id="nameId"]').prop("readonly", true);
        $(idForm).find('input[id="associationId"]').prop("readonly", true);

    }

    function enable(jsonObj) {
        enableAllField(jsonObj)
    }

    function disable(jsonObj) {
        disableAllField(jsonObj)
    }


    return {
        enableFields:function(jsonObj){
            enable(jsonObj);
        },
        disableFields:function (jsonObj) {
            disable(jsonObj)
        }
    }

}();

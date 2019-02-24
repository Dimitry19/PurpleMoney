var FormManager;
FormManager = function () {

    var debug = true;

    function emailValidation(json) {
        console.log("emailValidation");
        var idForm='#'+json.idForm;
        $(idForm).bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                email: {
                    validators: {
                        notEmpty: {
                            message: 'Adresse email'
                        },
                        regexp: {
                            regexp: '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
                            message: 'Entrer une adresse email valide'
                        }
                    }
                },
            }
        });
    }

    function formValidation(json) {
        console.log("formValidation");
        var idSubmit='#'+json.idSubmit;
        var idForm='#'+json.idForm;


        $(idSubmit).click(function(event) {
            //Fetch form to apply custom Bootstrap validation
            var form = $(idForm)

            if (form[0].checkValidity() === false) {
                event.preventDefault()
                event.stopPropagation()
            }

            form.addClass('was-validated');
    });

    }

    function actionCall(url) {
        window.location=url;
    }



    function popolateField(jsonObj){
        console.log(JSON.stringify(jsonObj));

        var value='#'+jsonObj.val;
        var selectId=jsonObj.selectId;

        if(selectId=='member'){
            $("#aMember").val(value);
        }

        if(selectId=='member1'){
            $("#aMember").val(value);
        }
        if(selectId=='member2'){
            $("#aMember").val(value);
        }
        //actionCall("retrieveMemberAction.do?member="+value);


        /*if(value.length!=0){
            gs.sendForm({containerId:'machineContainer',formId:'activities-form',actionUrl:'reloadMachines.do?department='+value});
        }*/
    }
    $("#select").change(function(e){
        var value = $(this).val();
       // $("#aMember").val(value);
        //submit a form or make ajax call or use window.location
    });

    var orderEsecSelector = function (ev, selection) {
        if(debug){
            console.log(JSON.stringify(selection));
        }

        if(selection.value == ''){
            clearOrderEsecSelectorData();
        }else{
            $('#itemsOrderEsecAc').typeahead('val', defaultAutocompleteDescription(selection));
            $('#itemOrderEsecCode').val(selection.value);
            $('#acOrderEsecDesc').html(selection.shortDescription);
        }

    }


    function fillField(jsonObj){
        popolateField(jsonObj)
    }

    function validationForm(jsonObj) {
        formValidation(jsonObj)
    }

    return {
        validationForm:function(jsonObj){
            validationForm(jsonObj);
        },
        fillField:function (jsonObj) {
            fillField(jsonObj)
        }
    }

}();

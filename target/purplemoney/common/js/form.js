var FormManager;
FormManager = function () {

    var debug = true;


    function unfilled(jsonObj) {
        var idForm='#'+jsonObj.idForm;
        console.log(idForm);
        $(idForm).find('input').val('');


    }
    function disableAllField(jsonObj) {
        var idForm='#'+jsonObj.idForm;
        console.log(idForm);
        $(idForm).find('input').prop("readonly", true);
        $('select').attr('disabled', true);

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


    function disableButton(jsonObj) {

        var id = '#' + jsonObj.idButton;
        $(id).prop("disabled",true);
    }
    function phone(jsonObj) {
        var value='#'+jsonObj.idPhone;
        $(value).usPhoneFormat({
            format: '(xxx) xxx-xxxx'
        });
    }


    function validationForm(jsonObj) {
        formValidation(jsonObj)
    }


    return {
        validationForm:function(jsonObj){
            validationForm(jsonObj);
        },
        disableBtn:function (jsonObj) {
            disableButton(jsonObj)
        },
        disableAllFields:function (jsonObj) {
            disableAllField(jsonObj);
        }
        ,
        unfilledAllFields:function (jsonObj) {
            unfilled(jsonObj);
        }
    }

}();

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


    function toaster(json) {
        console.log("formValidation");
        var type=+json.type;
        var msg='#'+json.idForm;

        toastr.options = {
            "closeButton": true, // true/false
            "debug": false, // true/false
            "newestOnTop": false, // true/false
            "progressBar": false, // true/false
            "positionClass": "md-toast-top-right", // md-toast-top-right / md-toast-top-left / md-toast-bottom-right /
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300", // in milliseconds
            "hideDuration": "1000", // in milliseconds
            "timeOut": "5000", // in milliseconds
            "extendedTimeOut": "1000", // in milliseconds
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
    }

        //toastr["info"]("I was launched via jQuery!");
        toastr["info"]("I was launched via jQuery!");

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
    }
    $("#select").change(function(e){
        var value = $(this).val();
       // $("#aMember").val(value);
        //submit a form or make ajax call or use window.location
    });



    function fillField(jsonObj){
        popolateField(jsonObj)
    }

    function validationForm(jsonObj) {
        formValidation(jsonObj)
    }
    function toastWindows(jsonObj) {
        toaster(jsonObj)
    }

    return {
        validationForm:function(jsonObj){
            validationForm(jsonObj);
        },
        fillField:function (jsonObj) {
            fillField(jsonObj)
        },
        notification:function (jsonObj) {
            toastWindows(jsonObj);
        }
    }

}();

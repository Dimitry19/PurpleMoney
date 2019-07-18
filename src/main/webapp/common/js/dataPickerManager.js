var DataPickerManager = function(){


    var dateFormat="dd/MM/yyyy";


    function enablejQueryDatePicker(json) {

		    var id='#'+json.id;
		    var lang=json.lang;

		    console.log(lang);
		    $(id).datepicker($.datepicker.regional[ lang ]);


	   /* $( function() {
		    var id='#'*json.btn;
		    var lang=json.lang;
		    $(id).datepicker($.datepicker.regional[ lang ]);
	    } );*/



    }



    return {

        enable: function(json){

                enablejQueryDatePicker(json);
            }

    }

}();
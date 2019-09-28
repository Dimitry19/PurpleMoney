var DataPickerManager = function(){

    var dateFormat="dd/mm/yy";


    function enablejQueryDatePicker(json) {

		    var id='#'+json.id;
		    var lang=json.lang;

	    var options = {
		    format: dateFormat,
		    language: lang
	    };
	        $(id).datepicker({ dateFormat:dateFormat,language: lang });
		    //$(id).datepicker($.datepicker.regional[ lang ]);

    }

    return {

        enable: function(json){

                enablejQueryDatePicker(json);
            }

    }

}();
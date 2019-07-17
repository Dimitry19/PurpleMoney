var AutocompleteManager;
AutocompleteManager = function () {

    var debug = true;

    function autocomplete(){

	    $("#autocomplete").autocomplete({
		    source : function(request, response) {
			    $.ajax({
				    url : "autocompleteMember",
				    type : "POST",
				    data : {
					    term : request.term
				    },
				    dataType : "json",
				    success : function(result) {
					    response(result.membersNames);
				    }
			    });
		    }
	    });

    }


    function autocomplete(){
        autocomplete()
    }


    return {
        autocomleteMember:function () {
            autocomplete();
        }
    }

}();

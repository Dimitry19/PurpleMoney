var AutocompleteManager;
AutocompleteManager = function () {

    var debug = true;

    function autocomplete(){

        $.subscribe('onCompleteLoading', function(event, data) {
            alert("hi");
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

var MapManager;
MapManager=function(){



    function autocomplete(json) {
        var idInput='#'+json.formId;
        console.log(idInput);
        jeoquery.defaultData.userName = 'dimitridevelopper';
        $(idInput).jeoCityAutoComplete();

    }

    function autocompleteCity(jsonObj) {
        autocomplete(jsonObj)
    }
    return {
        autocompleteCity:function(jsonObj){
            autocompleteCity(jsonObj);
        }
    }
}();

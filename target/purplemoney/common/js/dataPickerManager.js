var DataPickerManager = function(){


    var dateFormat="dd/MM/yyyy";
    function enableBootstrapDataPicker(id) {

        console.log("enableBootstrapDataPicker");
        $(id).datetimepicker();

    }

    function enablejQueryDatePicker(id) {

        console.log("enablejQueryDatePicker");
      //  $(id).datepicker();

        //$(id).datepicker({dateFormat: dateFormat});
    }



    return {

        enable: function(json){
            var   id='#'+json.id;
            console.log(id);
            var   isBootstrap=json.isBootstrap;
            if(isBootstrap==true){
                enableBootstrapDataPicker(id);
            }else{

                enablejQueryDatePicker(id);
            }
        }
    }

}();
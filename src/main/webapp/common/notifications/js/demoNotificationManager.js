var DemoNotificationManager;
DemoNotificationManager=function () {


    function notificate(jsonObj){
        console.log("notificate");


        var message=jsonObj.message;
        var type=jsonObj.type;
        var toHide=''+jsonObj.toHide;

	    $("#notification").fadeIn("slow").append(message);
	    $(".dismiss").click(function(){
		    $("#notification").fadeOut("slow");
	    });

        console.log(message);


    }



    return {

        displayNotification:function (jsonObj) {
            notificate(jsonObj)
        }
    }
}();

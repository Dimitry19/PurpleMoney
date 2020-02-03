var NotificationManager;
NotificationManager=function () {


    function notificate(jsonObj){
        console.log("notificate");

        var message=jsonObj.message;
        var type=jsonObj.type;
        var toHide=''+jsonObj.toHide;

        console.log(message);
        var notification = new NotificationFx({
            message : message,//'<span class="icon icon-megaphone"></span><p>'+message+'</p>',
            layout : 'growl',// layout type: growl|attached|bar|other	layout : 'other',
            effect : 'jelly',//layout : 'jelly','slidetop',boxspinner,
            type : type, // notice,success,warning or error
            wrapper : document.body,
            ttl : 160000,
            onClose : function() { return false; },
            onOpen : function() {
               if(type==='error'){
                   $(".ns-box").css("background", "#ff6666")
               }
                if(type==='success'){
                    $(".ns-box").css("background", "#80ffa8")
                }
                if(type==='warning'){
                    $(".ns-box").css("background", "#ffff33")
                }
            }
        });
        //setBackgroundNotification(type);
        notification.show();
	    //hide(toHide);


    }

    function setBackgroundNotification(type) {
        if(type==='error'){
            $(".ns-box").css("background", "#dc3545")
        }
        if(type==='success'){
            $(".ns-box").css("background", "#00c851")
        }
        if(type==='warning'){
            $(".ns-box").css("background", "#B47F87")
        }

    }
    function hide(elt) {
	    document.getElementById(elt).style.display = "none";

    }

    return {

        displayNotification:function (jsonObj) {
            notificate(jsonObj)
        }
    }
}();

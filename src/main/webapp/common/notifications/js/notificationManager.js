var NotificationManager;
NotificationManager=function () {


    function notificate(jsonObj){
        console.log("notificate");

        var message=jsonObj.message;
        var type=jsonObj.type;

        console.log(message);
        var notification = new NotificationFx({
            message : message,//'<span class="icon icon-megaphone"></span><p>'+message+'</p>',
            layout : 'bar',// layout type: growl|attached|bar|other
            effect : 'slidetop',
            type : type, // notice,success,warning or error
            wrapper : document.body,
            ttl : 6000,
            onClose : function() { return false; },
            onOpen : function() {
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
        });
        //setBackgroundNotification(type);
        notification.show();

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

    return {

        displayNotification:function (jsonObj) {
            notificate(jsonObj)
        }
    }
}();

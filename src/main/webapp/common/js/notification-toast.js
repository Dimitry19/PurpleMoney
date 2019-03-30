var NotifManager;
NotifManager = function () {


    function toasternotif() {

        console.log("TOAST")
        $('.notifSuccess').hide(1000);
    }
    function toaster() {
        toasternotif();

    }

    return {
        notif:function(){
            toaster();
        }
    }
}();

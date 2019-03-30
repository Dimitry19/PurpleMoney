var UtilsManager;
UtilsManager = function () {
    function isActivate(e){

        ct = e.keyCode?e.keyCode:e.which;
        sh = e.shiftKey?e.shiftKey:((ct == 16)?true:false);
        document.getElementById('passmajactive').style.visibility =(((ct >= 65 && ct <= 90) && !sh)||((ct >= 97 && ct <= 122) && sh))?'visible':'hidden';
    }

    function toogle(){
        $("#inputPassword").password('toggle');
    }


    return {
        activated:function(e){
            isActivate(e);
        },
        passwordToogle:function(){

            toogle();

        }
    }
}();
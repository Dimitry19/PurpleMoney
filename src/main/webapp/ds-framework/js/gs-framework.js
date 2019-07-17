/*
 * Lorenzo Messori (2015-11-02)
 * 
 * Framework Gruppo Sinapsi S.r.l.
 * 
 */

(function() {

    'use strict';

    window.gs = {
        version: '1.0.0',
        revisionDate: '2016-05-27',
        metronic: false,
        debug: false,
        authuser: null,
        selectedLanguage: 'IT',
        selectedCountry: 'it',
        i18n: 'it_IT',
        dateFormat: 'dd/mm/yyyy',
        menuManager: null,
        formValidator: null,
        resBreakpointMd: null,
        floaterWidthSettings: [{id: 'stableLayer', width: 796, height: 600}],
        GLOBALS: {AUTOCOMPLETE_TEXT: 'Iniziare a digitare...'},
        ajaxContentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        ajaxDefaultData: 'FormatAjaxMark=true',
        registeredObjects: null,
        requestedAction: null,
        msgDeleteConfirm: 'L\'elemento verr\u00E0 eliminato definitivamente, proseguire?',
        msgSaveConfirm: 'Confermi il salvataggio?',
        genericErrorMessage: 'Si \u00E9 verificato un problema durante l\'elaborazione della richiesta:',
        showResponseMessage:'visualizzare il contenuto della risposta?',
        serverNotResponding: 'Errore di comunicazione con il server',
        sessionExpiredMessage: 'Sessione scaduta! Andare alla pagina di login?',
        modalBoxTitles: {'session_expired' : 'Sessione scaduta', 'validation_error' : 'Errore durante la validazione', 'force' : 'Forzare il salvataggio', 'generic_error' : 'Errore durante l\'elaborazione della richiesta', '404' : 'Risorsa non trovata', '403' : 'Accesso non autorizzato', '500' : 'Errore durante l\'elaborazione della richiesta'},
        errorsConfiguration: {open: '<span class="help-block help-block-error control-label text-left">', close: '</span>', closestSelector: '.form-group', closestErrorClass: 'has-error', helpBlockClass: 'help-block-error'},
        beginErrorComment: '<!-- BEGIN ERROR -->',
        endErrorComment: '<!-- END ERROR -->',
        dataLoadCheckerName: 'dataLoad',
        useLoader: true,
        init: function(appId, def, userRoles){
            this.registeredObjects= new Array();

        },

        sendForm: function (paramObj) {
        	paramObj.action = 'send-form';

            var elementCont = $('#'+paramObj.containerId);
            var frm = $('#'+paramObj.formId);

            if(elementCont.length > 0){

                if(paramObj.history && !paramObj.back && Modernizr.history){
                    history.pushState({ajaxCallType: "sendForm", jsonObj: JSON.stringify(paramObj)}, null,  null);
                }


                if(paramObj.onstart){
                    paramObj.onstart();
                }


                //Valido il form
                if(this.formValidator && frm.length > 0){
                    if(!this.formValidator.validate(paramObj.formId)){



                        return false;
                    }
                }

                //Se esiste il form proseguo
                if(frm.length > 0 && paramObj.formId){
                    var url = (paramObj.actionUrl ? paramObj.actionUrl : frm.prop('action'));

                    var offsetParam = (paramObj.offset) ? "&offset=" + paramObj.offset:"";

                    if(paramObj.enctype == 'multipart/form-data'){
                        var formData = new FormData(frm[0]);
                    }

                    var jqxhr = $.ajax({
                        url:url,
                        type: 'POST',
                        cache: false,
                        contentType: formData!=null ? false : gs.ajaxContentType,
                        processData: formData!=null ? false : true,
                        data: formData!=null ? formData : frm.serialize() + '&' + gs.ajaxDefaultData + offsetParam
                    })
                        .always(function() {})
                        .fail(function(jqXHR, textStatus) {

                            gs.manageAJAXErrors(textStatus, jqXHR);
                        })
                        .done(function(data, textStatus, jqXHR) {

                            if(false){


                                //Scateno la funzione specificata per l'onerror
                                if(paramObj.onerror){

                                }
                                return data;
                            }else{

                                if(paramObj.beforeEnd){
                                    paramObj.beforeEnd();
                                }

                                if (false){
                                    //Scateno la funzione specificata per l'onerror
                                    if(paramObj.onerror){

                                    }

                                   // gs.customAlert(data);
                                } else {

                                    if(false){
                                        if(gs.metronic){

                                            var md = {};

                                            md.id = paramObj.containerId;
                                            md.title = paramObj.title;
                                            md.body = data;


                                        }else{

                                        }

                                    }else{
                                        //Modifica che permette di appendere al container invece di sostiuire il contenuto
                                        if(paramObj.append){
                                            elementCont.append(data);
                                        }else{
                                            elementCont.html(data);
                                        }
                                    }
                                }

                                // Se l'elemento in cui visualizzer� la response � nascosto lo
                                // visualizzo
                                elementCont.show();

                               // gs.commonActions(paramObj);

                                return data;
                            }

                        });

                }else throw "Nessun fomr: " + paramObj.formId;
            }else throw "Nessun container: " + paramObj.containerId;
        },



        executeAction: function (paramObj) {
			paramObj.action = 'execute-action';


            var container = paramObj.containerId ? $('#' + paramObj.containerId) : null;

            if(paramObj.loading && paramObj.loading.message){

                container.html(paramObj.loading.message);
            }else{

            }

            if(paramObj.formId){

                var frm = $('#'+paramObj.formId);

                var url = (paramObj.actionUrl ? paramObj.actionUrl : frm.prop('action'));

                var offsetParam = (paramObj.offset) ? "&offset=" + paramObj.offset:"";

                var jqxhr = $.ajax({
                    url:url,
                    type: 'POST',
                    cache: false,
                    contentType: gs.ajaxContentType,
                    data: frm.serialize() + '&' + gs.ajaxDefaultData + offsetParam
                })
                    .always(function() {})
                    .fail(function(jqXHR, textStatus) {
                        gs.renableElement(paramObj);

                        gs.manageAJAXErrors(textStatus, jqXHR);
                    })
                    .done(function(data, textStatus, jqXHR) {


                        if(false){


                            //Scateno la funzione specificata per l'onerror
                            if(paramObj.onerror){
                                if(eval(paramObj.onerrorCondition)){
                                    paramObj.onerror();
                                }
                            }
                            return data;
                        }else{

                            if(paramObj.beforeEnd){
                                paramObj.beforeEnd();
                            }

                            if (paramObj.isJsResponse){
                                //Scateno la funzione specificata per l'onerror
                                if(paramObj.onerror){
                                    if(eval(paramObj.onerrorCondition)){
                                        paramObj.onerror();
                                    }
                                }

                            }

                            if(paramObj.beforeEnd){
                                paramObj.beforeEnd();
                            }

                            if(paramObj.manageResult){
                                paramObj.manageResult(data);
                            }



                            if(paramObj){
                                if(paramObj.onend){
                                    //eval(paramObj.onend);
                                    paramObj.onend();
                                }
                            }



                            return data;
                        }

                    });

            }else{

                var completeUrl=paramObj.url;//QSManager.appendParameters(paramObj.url,{"current-env-code":"currentEnvCode"});

                var jqxhr = $.ajax({
                    url: completeUrl,
                    type: 'POST',
                    cache: false,
                    contentType: gs.ajaxContentType,
                    data: gs.ajaxDefaultData
                })
                    .always(function() {})
                    .fail(function(jqXHR, textStatus) {
                        gs.renableElement(paramObj);

                        gs.manageAJAXErrors(textStatus, jqXHR);
                    })
                    .done(function(data, textStatus, jqXHR) {


                        if(false){
                            if(data){
                                data.noScroll = paramObj.noScrollOnError;
                            }
                        }

                        if(false){
                            return data;
                        }else{

                            if(false){
                                paramObj.beforeEnd();
                            }

                            if(paramObj.manageResult){
                                paramObj.manageResult(data);
                            }




                            return data;
                        }
                    });
            }
        },

        print: function (jsonObj){
            if(jsonObj){
                var form = document.getElementById(jsonObj.formId);
                if(form){
                    //mi memorizzo la action dell'esportazione excel
                    var fAction = form.action;
                    var fTarget = form.target;

                    //imposto l'azione di scarico documenti
                    form.action = jsonObj.url;
                    form.target = '_blank';
                    form.submit();

                    //rimetto al form azione e target originale per esportazione excel
                    form.action = fAction;
                    form.target = fTarget;
                }
            }
        },

        manageAJAXErrors: function (response, xhr, requestDate){
            var msg;

            var responseDate = new Date();

            var statusCode = parseInt(xhr.status, 10);

            var tit = this.modalBoxTitles[statusCode];
            var ms = gs.beginErrorComment, me = gs.endErrorComment;

            //Se lo stato della richiesta � SUCCESS significa che si � verificato un errore Javascript
            if(xhr.status == '200'){

                var start = xhr.responseText.indexOf(ms) + ms.length;
                var end = xhr.responseText.indexOf(me);

                var bodyHtml = xhr.responseText.substring(start, end);

                if(bodyHtml != ''){



                }else{

                    msg = gs.genericErrorMessage + '\n' +gs.showResponseMessage;

                    alert(msg);

                }

            }else{//Se lo stato della richiesta non � SUCCESS significa che il server ha restituito un errore e lo visualizzo

                if(xhr.status != '620'){

                    //Se la sessione browser scade la richiesta ajax successiva ottiene questo codice di errore
                    //xhr.status == '302' ||
                    if(xhr.status == '0'){
//							alert(gs.serverNotResponding);
                        if(console){
                            console.log(gs.serverNotResponding + ': ' + JSON.stringify(xhr));
                        }

//							location.href = welcomeURL;
                        gs.retryAction();
                    }

                    //var statusCode = 12001;

                    if(!(statusCode == 0 || (statusCode >= 12000 && statusCode <= 12170))){

                        var start = xhr.responseText.indexOf(ms) + ms.length;
                        var end = xhr.responseText.indexOf(me);

                        var bodyHtml = xhr.responseText.substring(start, end);

                        if(bodyHtml != ''){

                            this.modalMessage({title: tit, body: bodyHtml});

                            this.appendLoader(false);

                        }else{


                        }
                    }else{

                    }
                }

            }

        },

        parseJSON: function(jsonString){

            if(gs.debug){
                console.log("parseJSON: " + jsonString);
            }

            var obj = null;

            if(jsonString && jsonString !== ''){
                eval('obj = ' + jsonString);
            }

            return obj;
        }


    };
}());

$(document).ready(function(){

    gs.init();

});
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link  rel="stylesheet"  href="<s:url value="/common/fullcalendar-master/assets/css/fullcalendar.print.css"/>">
    <link  rel="stylesheet"  href="<s:url value="/common/fullcalendar-master/assets/css/fullcalendar.css"/>">


    <script src="<s:url value="/common/fullcalendar-master/assets/js/jquery-1.10.2.js"/>"></script>
    <script src="<s:url value="/common/fullcalendar-master/assets/js/jquery-ui.custom.min.js"/>"></script>
    <script src="<s:url value="/common/fullcalendar-master/assets/js/fullcalendar.js"/>"></script>
    <script>

        $(document).ready(function() {


            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();


            /*All Events*/
            var events= [
                {
                    title: 'All Day Event',
                    start: new Date(y, m, 1)
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d-3, 16, 0),
                    allDay: false,
                    className: 'info'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d+4, 16, 0),
                    allDay: false,
                    className: 'info'
                },
                {
                    title: 'Meeting',
                    start: new Date(y, m, d, 10, 30),
                    allDay: false,
                    className: 'important'
                },
                {
                    title: 'Lunch',
                    start: new Date(y, m, d, 12, 0),
                    end: new Date(y, m, d, 14, 0),
                    allDay: false,
                    className: 'important'
                },
                {
                    title: 'Birthday Party',
                    start: new Date(y, m, d+1, 19, 0),
                    end: new Date(y, m, d+1, 22, 30),
                    allDay: false,
                },
                {
                    title: 'Click for Google',
                    start: new Date(y, m, 28),
                    end: new Date(y, m, 29),
                    url: 'http://google.com/',
                    className: 'success'
                }
            ];


            /*language lib*/
            var 	monthNames= ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','Aout','Septembre','Octobre','Novembre','Decembre'];
            var 	monthNamesShort= ['Jan','Fev','Mar','Avr','Mai','Juin','Juil','Aout','Sept','Oct','Nov','Dec'];
            var 	dayNames= ['Dimance','Lundi','Mardi','Mercredi','Jeudi','Vendre','Samedi'];
            var 	dayNamesShort=['Dim','Lun','Mar','Mer','Jeu','Ven','Sam'];

            /*custom defaults settings*/

            var settings={
                monthNames:monthNames,
                monthNamesShort:monthNamesShort,
                dayNames:dayNames,
                dayNamesShort:dayNamesShort,
                dayRightclick: function (date, jsEvent, view) {
                    alert('rightclicked on day ' + date.format());
                    // Prevent browser context menu:
                    return false;
                },
                eventRightclick: function (event, jsEvent, view) {
                    alert('rightclicked on event ' + event.title);
                    // Prevent browser context menu:
                    return false;
                },
                /*header: {
                    left: 'title',
                    center: 'agendaDay,agendaWeek,month,listWeek',
                    right: 'prev,next today'
                },*/
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listWeek'
                },
                editable: true,
                firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
                selectable: true,
                defaultView: 'month',

                axisFormat: 'h:mm',
                columnFormat: {
                    month: 'ddd',    // Mon
                    week: 'ddd d', // Mon 7
                    day: 'dddd M/d',  // Monday 9/7
                    agendaDay: 'dddd d'
                },
                titleFormat: {
                    month: 'MMMM yyyy', // September 2009
                    week: "MMMM yyyy", // September 2009
                    day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
                },
                allDaySlot: true,
                selectHelper: true,
                select: function(start, end, allDay) {
                    var title = prompt('Event Title:');
                    if (title) {
                        calendar.fullCalendar('renderEvent',
                            {
                                title: title,
                                start: start,
                                end: end,
                                allDay: allDay
                            },
                            true // make the event "stick"
                        );
                    }
                    calendar.fullCalendar('unselect');
                },
                droppable: true, // this allows things to be dropped onto the calendar !!!
                drop: function(date, allDay) { // this function is called when something is dropped

                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');

                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }

                },

                events:events,
            }



            /*  className colors

                className: default(transparent), important(red), chill(pink), success(green), info(blue)

            */


            /* initialize the external events
            -----------------------------------------------------------------*/

            $('#external-events div.external-event').each(function() {

                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                };

                // store the Event Object in the DOM element so we can get to it later
                $(this).data('eventObject', eventObject);

                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });

            });


            /* initialize the calendar
            -----------------------------------------------------------------*/
            var calendar =  $('#calendar').fullCalendar(settings);
            load('fr');


            function load(lang){
                if(lang==='fr'){
                    $( '.fc-button-agendaDay' ).empty();
                    $( '.fc-button-agendaDay' ).html('Jour');
                    $( '.fc-button-agendaWeek' ).empty();
                    $( '.fc-button-agendaWeek' ).html('Semaine');
                    $( '.fc-button-month' ).empty();
                    $( '.fc-button-month' ).html('Mois');
                    $( '.fc-button-today' ).empty();
                    $( '.fc-button-today' ).html('Aujourd\'hui');
                    $( '.fc-agenda-axis' ).empty();
                    $( '.fc-agenda-axis' ).html('Jour entier');
                }
            }
        });

    </script>
    <link  rel="stylesheet"  href="<s:url value="/common/fullcalendar-master/assets/css/perso.css"/>">
</head>
<body>
<div id='wrap'>
    <div id='calendar'></div>
    <div style='clear:both'></div>
</div>
</body>
</html>

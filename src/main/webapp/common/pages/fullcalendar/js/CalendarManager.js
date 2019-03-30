var CalendarManager;
CalendarManager=function () {


    function build(jsonObj){
        var idCal='#'+jsonObj.idCalendar;
        console.log("CalendarManager:"+idCal);

        var events=[
            {
                title: 'All Day Event',
                start: '2019-01-01'
            },
            {
                title: 'Long Event',
                start: '2019-01-07',
                end: '2019-01-10'
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: '2019-01-09T16:00:00'
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: '2019-01-16T16:00:00'
            },
            {
                title: 'Conference',
                start: '2019-01-11',
                end: '2019-01-13'
            },
            {
                title: 'Meeting',
                start: '2019-01-12T10:30:00',
                end: '2019-01-12T12:30:00'
            },
            {
                title: 'Lunch',
                start: '2019-01-12T12:00:00'
            },
            {
                title: 'Meeting',
                start: '2019-01-12T14:30:00'
            },
            {
                title: 'Happy Hour',
                start: '2019-01-12T17:30:00'
            },
            {
                title: 'Dinner',
                start: '2019-01-12T20:00:00'
            },
            {
                title: 'Birthday Party',
                start: '2019-01-13T07:00:00'
            },
            {
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2019-01-28'
            },
            {
                title: 'right-click me!',
                start: moment(),
                allDay: false
            }
        ];
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        today = yyyy + '-' + mm + '-' + dd;

        $(idCal).fullCalendar({
            defaultDate: today,
            locale: 'fr',
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: events,
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
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,basicWeek,basicDay,agendaWeek,agendaDay'
            },
            buttonText: {
                basicWeek: 'basicWeek',
                basicDay: 'basicDay',
                agendaWeek: 'agendaWeek',
                agendaDay: 'agendaDay'
            },
            scrollTime: moment(),
            allDaySlot: false
        });
    }
    return{
        buildCalendar:function(jsonObj){
          build(jsonObj);
        },
    }

}();

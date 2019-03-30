
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Fullcalendar Basic Demo</title>
    <link href="css/fullcalendar.min.css" rel="stylesheet" />
    <link href="css/fullcalendar.min-custom.css" rel="stylesheet" />
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link href="css/fullcalendar.print.min.css" rel="stylesheet" media="print" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/fullcalendar-rightclick.js"></script>
    <script src="js/CalendarManager.js"></script>
    <script>
        $(document).ready(function() {
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

            $('#calendar').fullCalendar({
                defaultDate: '2019-01-12',
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

        });

    </script>
    <style>
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            font-size: 14px;
        }
        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<div id='calendar'></div>

</body>
</html>
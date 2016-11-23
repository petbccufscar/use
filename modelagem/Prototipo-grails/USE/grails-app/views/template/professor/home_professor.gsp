<html>
<head>
    <meta name="layout" content="main"/>
    <title>Home Professor</title>
    <!-- FullCalendar -->
    <asset:stylesheet src="fullcalendar/dist/fullcalendar.min.css"/>
</head>

<body>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-6 col-xs-12 col-sm-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Minha Agenda</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li>
                                <!-- <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> -->
                            </li>
                        </ul>

                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">

                        <div id='calendar'></div>

                    </div>
                </div>
            </div>

            <div class="col-md-6 col-xs-12 col-sm-12">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-exclamation-circle"></i>
                            </div>

                            <div class="count">Opção 1</div>

                            <h3>Descrição</h3>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-check-square-o"></i>
                            </div>

                            <div class="count">Opção 2</div>

                            <h3>Descrição</h3>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-sort-amount-desc"></i>
                            </div>

                            <div class="count">Opção 3</div>

                            <h3>Descrição</h3>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="tile-stats">
                            <div class="icon"><i class="fa fa-comments-o"></i>
                            </div>

                            <div class="count">Opção 4</div>

                            <h3>Descrição</h3>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
</div>
<!-- /page content -->

<!-- calendar modal -->
<div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Nova entrada</h4>
            </div>

            <div class="modal-body">
                <div id="testmodal" style="padding: 5px 20px;">
                    <form id="antoform" class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Titulo</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="title" name="title">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Descrição</label>

                            <div class="col-sm-9">
                                <textarea class="form-control" style="height:55px;" id="descr" name="descr"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default antoclose" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary antosubmit">Salvar</button>
            </div>
        </div>
    </div>
</div>

<div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel2">Edit Calendar Entry</h4>
            </div>

            <div class="modal-body">

                <div id="testmodal2" style="padding: 5px 20px;">
                    <form id="antoform2" class="form-horizontal calender" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Title</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="title2" name="title2">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Description</label>

                            <div class="col-sm-9">
                                <textarea class="form-control" style="height:55px;" id="descr2" name="descr"></textarea>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary antosubmit2">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>

<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
<!-- /calendar modal -->

<content tag="javascript">
    <!-- FullCalendar -->
    <asset:javascript src="moment/min/moment.min.js"/>
    <asset:javascript src="fullcalendar/dist/fullcalendar.min.js"/>

    <!-- FullCalendar -->
    <script>
        $(window).load(function () {
            var date = new Date(),
                    d = date.getDate(),
                    m = date.getMonth(),
                    y = date.getFullYear(),
                    started,
                    categoryClass;

            var calendar = $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                selectable: true,
                selectHelper: true,
                select: function (start, end, allDay) {
                    $('#fc_create').click();

                    started = start;
                    ended = end;

                    $(".antosubmit").on("click", function () {
                        var title = $("#title").val();
                        if (end) {
                            ended = end;
                        }

                        categoryClass = $("#event_type").val();

                        if (title) {
                            calendar.fullCalendar('renderEvent', {
                                        title: title,
                                        start: started,
                                        end: end,
                                        allDay: allDay
                                    },
                                    true // make the event "stick"
                            );
                        }

                        $('#title').val('');

                        calendar.fullCalendar('unselect');

                        $('.antoclose').click();

                        return false;
                    });
                },
                eventClick: function (calEvent, jsEvent, view) {
                    $('#fc_edit').click();
                    $('#title2').val(calEvent.title);

                    categoryClass = $("#event_type").val();

                    $(".antosubmit2").on("click", function () {
                        calEvent.title = $("#title2").val();

                        calendar.fullCalendar('updateEvent', calEvent);
                        $('.antoclose2').click();
                    });

                    calendar.fullCalendar('unselect');
                },
                editable: true,
                events: [{
                    title: 'All Day Event',
                    start: new Date(y, m, 1)
                }, {
                    title: 'Long Event',
                    start: new Date(y, m, d - 5),
                    end: new Date(y, m, d - 2)
                }, {
                    title: 'Meeting',
                    start: new Date(y, m, d, 10, 30),
                    allDay: false
                }, {
                    title: 'Lunch',
                    start: new Date(y, m, d + 14, 12, 0),
                    end: new Date(y, m, d, 14, 0),
                    allDay: false
                }, {
                    title: 'Birthday Party',
                    start: new Date(y, m, d + 1, 19, 0),
                    end: new Date(y, m, d + 1, 22, 30),
                    allDay: false
                }, {
                    title: 'Click for Google',
                    start: new Date(y, m, 28),
                    end: new Date(y, m, 29),
                    url: 'http://google.com/'
                }]
            });
        });
    </script>
    <!-- /FullCalendar -->
</content>
</body>
</html>
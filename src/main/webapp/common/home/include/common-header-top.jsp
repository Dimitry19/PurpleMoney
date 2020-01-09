<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<link rel="stylesheet" href="<s:url value="/common/Player/css/styles.css"/>">


<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
            <%--<div class="sidebar-brand-icon rotate-n-15">--%>
            <div class="sidebar-brand-icon"><i class="fa fa-home"></i></div>
            <%--<div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>--%>
            <div class="sidebar-brand-text"><s:text name="common.page.title"/></div>
        </a>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">
        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="<s:url action="home"/>"><i class="fas fa-fw fa-tachometer-alt"></i><span>Dashboard</span></a>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider">
        <!-- Heading -->
        <div class="sidebar-heading"><s:text name="common.menu.language"/></div>
        <!-- Nav Item - Sessions Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menuLanguages" aria-expanded="true" aria-controls="collapseLanguage"><i class="fa fa-language"></i><span><s:text name="common.menu.language"/></span></a>
            <div id="menuLanguages" class="collapse" aria-labelledby="menuLanguages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <s:url var="indexEN" action="locale">
                        <s:param name="rlocale">en</s:param>
                    </s:url>
                    <s:url var="indexFR" action="locale">
                        <s:param name="rlocale">fr</s:param>
                    </s:url>
                    <s:url var="indexIT" action="locale">
                        <s:param name="rlocale">it</s:param>
                    </s:url>
                    <h6 class="collapse-header"><s:text name="common.menu.language.english"/></h6>
                    <a class="collapse-item" href="<s:property value="#indexEN" />"><span class="flag-icon flag-icon-us flag-icon-squared"></span>&nbsp;<s:text name="common.menu.language.english"/></a>
                    <h6 class="collapse-header"><s:text name="common.menu.language.french"/></h6>
                    <a class="collapse-item" href="<s:property value="#indexFR" />"><span class="flag-icon flag-icon-fr flag-icon-squared"></span>&nbsp;<s:text name="common.menu.language.french"/></a>
                    <h6 class="collapse-header"><s:text name="common.menu.language.italian"/></h6>
                    <a class="collapse-item" href="<s:property value="#indexIT" />"><span class="flag-icon flag-icon-it flag-icon-squared"></span>&nbsp;<s:text name="common.menu.language.italian"/></a>
                </div>
            </div>
        </li>
        <s:if test="currentMember.isAdmin()== true">
            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading"><i class="fas fa-fw fa-cog"></i><s:text name="common.admin.title"/></div>
            <!-- Nav Item - Admin Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#addOperation"
                   aria-expanded="true" aria-controls="collapseAddOperation"><%--<i class="fas fa-fw fa-cog"></i>--%><i class="fa fa-plus"></i><span><s:text name="common.admin.add.operations"/></span></a>
                <div id="addOperation" class="collapse" aria-labelledby="addOperation" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><s:text name="common.menu.founds.add"/>:</h6>
                        <a class="collapse-item" href="<s:url action="addingSessionAction"/>"><i class="fas fa-money" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.founds.add"/></a>
                        <h6 class="collapse-header"><s:text name="common.menu.loan.add"/>:</h6>
                        <a class="collapse-item" href="<s:url action="loanAddAction"/>"><i class="fa fa-landmark" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.loan.add"/></a>
                        <h6 class="collapse-header"><s:text name="common.menu.members.add"/>:</h6>
                        <a class="collapse-item" href="<s:url action="menuAddMemberAction"/>"><i class="fa fa-user-plus"  aria-hidden="true"></i>&nbsp;<s:text name="common.menu.members.add"/></a>
                        <h6 class="collapse-header"><s:text name="event.add.title"></s:text>:</h6>
                        <a class="collapse-item" href="<s:url action="addingEvent"/>"><i class="far fa-calendar-plus" aria-hidden="true"></i>&nbsp;<s:text name="event.add.title"></s:text></a>
                        <h6 class="collapse-header"><s:text name="fund.add.title"></s:text>:</h6>
                        <a class="collapse-item" href="<s:url action="fundAddAction"/>"><i class="fa fa-suitcase" aria-hidden="true"></i>&nbsp;<s:text name="fund.add.title"></s:text></a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#editOperation"
                   aria-expanded="true" aria-controls="collapseEditOperation"><i class="fa fa-edit"></i><span><s:text name="common.admin.edit.operations"/></span>
                </a>
                <div id="editOperation" class="collapse" aria-labelledby="editOperation"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><s:text name="common.menu.members.edit"/>:</h6>
                        <a class="collapse-item" href="<s:url action="editMemberAction"/>"><i class="fa fa-edit" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.members.edit"/></a>
                            <%--<a class="collapse-item" href="cards.html">Cards</a>--%>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#mail" aria-expanded="true"
                   aria-controls="collapseMail">
                    <i class="fas fa-satellite-dish"></i><span><s:text name="common.menu.communication"/></span>
                </a>
                <div id="mail" class="collapse" aria-labelledby="mail" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><s:text name="common.menu.mail"/>:</h6>
                        <a class="collapse-item" href="<s:url action="addingMailAction"/>"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.mails.send"/></a>
                    </div>
                </div>
            </li>
        </s:if>

        <!-- Divider -->
        <hr class="sidebar-divider">
        <!-- Heading -->
        <div class="sidebar-heading"><s:text name="common.menu.members"/></div>
        <!-- Nav Item - Members Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menuMembers"
               aria-expanded="true" aria-controls="collapsePages"><i class="fa fa-users"></i><span><s:text name="common.menu.members.all"/></span>
            </a>
            <div id="menuMembers" class="collapse" aria-labelledby="menuMembers" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header"><s:text name="common.menu.members.all"/></h6>
                    <a class="collapse-item" href="<s:url action="allMembersAction"/>"><i class="fa fa-users" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.members.all"/></a>
                    <h6 class="collapse-header"><s:text name="common.menu.about.user"/></h6>
                    <a class="collapse-item" href="<s:url action="infoMemberAction"/>"><i class="fa fa-id-card" aria-hidden="true"></i>&nbsp;<s:text  name="common.menu.about.user"/></a>
                </div>
            </div>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider">
        <!-- Heading -->
        <div class="sidebar-heading"><s:text name="common.menu.loans"/></div>
        <!-- Nav Item - loans Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menuLoans" aria-expanded="true"
               aria-controls="collapsePages">
                <i class="fa fa-landmark"></i>
                <span><s:text name="loan.title"/></span>
            </a>
            <div id="menuLoans" class="collapse" aria-labelledby="menuLoans" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header"><s:text name="common.menu.loans"/></h6>
                    <a class="collapse-item" href="<s:url action="loansAction"/>"><i class="fa fa-hand-holding-usd" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.loans"/></a>
                    <h6 class="collapse-header"><s:text name="common.menu.about.user"/></h6>
                    <a class="collapse-item" href="<s:url action="infoMemberAction"/>"><i class="fa fa-id-card" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.about.user"/></a>
                </div>
            </div>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider">
        <!-- Heading -->
        <div class="sidebar-heading"><s:text name="common.menu.founds"/></div>
        <!-- Nav Item - Sessions Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menuSessions"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-coins"></i>
                <span><s:text name="common.menu.founds"/></span>
            </a>
            <div id="menuSessions" class="collapse" aria-labelledby="menuSessions" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header"><s:text name="common.menu.founds.open"/></h6>
                    <a class="collapse-item" href="<s:url action="sessionConsultAction"/>"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.founds.open"/></a>
                    <h6 class="collapse-header"><s:text name="common.menu.founds.all"/></h6>
                    <a class="collapse-item" href="<s:url action="sessions"/>"><i class="far fa-money-bill-alt"></i>&nbsp;<s:text name="common.menu.founds.all"/></a>
                </div>
            </div>
        </li>
        <hr class="sidebar-divider">
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menuFunds"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-coins"></i>
                <span><s:text name="fund.title"/></span>
            </a>
            <div id="menuFunds" class="collapse" aria-labelledby="menuSessions" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header"><s:text name="fund.all.title"/></h6>
                    <a class="collapse-item" href="<s:url action="funds"/>">
                        <i class="fas fa-coins"></i>&nbsp;<s:text name="fund.title"/></a>
                </div>
            </div>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider">
        <li class="nav-item">
            <a class="nav-link" href="<s:url action="allEvents"/>"><i class="fa fa-book" aria-hidden="true"></i>&nbsp;<s:text name="event.all.title"/></a>
        </li>
        <hr class="sidebar-divider">
        <li class="nav-item">
            <a class="nav-link" href="<s:url action="gmapAction"/>"><i class="fas fa-map-marked-alt"></i>&nbsp;<s:text name="footer.link.map"></s:text></a>
        </li>
        <hr class="sidebar-divider">
        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="charts.html"><i class="fas fa-fw fa-chart-area"></i><span>Charts</span></a>
        </li>
        <hr class="sidebar-divider">
        <li class="nav-item">
            <a class="nav-link" href="#!"><i class="fas fa-hands-helping"></i>&nbsp;<s:text name="footer.link.help"></s:text></a>
        </li>
        <hr class="sidebar-divider">
        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="tables.html"><i class="fas fa-fw fa-table"></i><span>Tables</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
                <!-- Topbar Search -->
                <s:form id="" action="searchAction"
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <s:textfield placeholder="%{getText('common.menu.search')}"
                                     class="form-control bg-light border-0 small" aria-label="Search"
                                     aria-describedby="basic-addon2"/>
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button"><i class="fas fa-search fa-sm"></i></button>
                        </div>
                    </div>
                </s:form>

                <div class="container plyer">
                    <audio id="audio" preload="none" tabindex="0">
                        <source src="<s:url value="/common/Player/data/KM.mp3"/>" data-track-number="1"/>
                        <source src="<s:url value="/common/Player/data/MM.mp3"/>" data-track-number="2"/>
                        <source src="<s:url value="/common/Player/data/Larissa.mp3"/>" data-track-number="3"/>
                        <source src="<s:url value="/common/Player/data/nikeles.mp3"/>" data-track-number="4"/>
                        Your browser does not support HTML5 audio.
                    </audio>

                    <div class="player">
                        <div class="large-toggle-btn">
                            <i class="large-play-btn"><span class="screen-reader-text">Large toggle button</span></i>
                        </div>
                        <!-- /.play-box -->

                        <div class="info-box">
                            <div class="track-info-box">
                                <div class="track-title-text"></div>
                                <div class="audio-time">
                                    <span class="current-time">00:00</span> /
                                    <span class="duration">00:00</span>
                                </div>
                            </div>
                            <!-- /.info-box -->

                            <div class="progress-box">
                                <div class="progress-cell">
                                    <div class="progress">
                                        <div class="progress-buffer"></div>
                                        <div class="progress-indicator"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.progress-box -->

                        <div class="controls-box">
                            <i class="previous-track-btn disabled"><span class="screen-reader-text">Previous track button</span></i>
                            <i class="next-track-btn"><span class="screen-reader-text">Next track button</span></i>
                        </div>
                        <!-- /.controls-box -->

                    </div>
                    <!-- /.player -->

                    <div class="play-list" style="display: none;">

                        <div class="play-list-row" data-track-row="1">
                            <div class="small-toggle-btn">
                                <i class="small-play-btn"><span
                                        class="screen-reader-text">Small toggle button</span></i>
                            </div>
                            <div class="track-number">
                                1.
                            </div>
                            <div class="track-title">
                                <a class="playlist-track" href="#" data-play-track="1">Lion Dx - Kylian Mbappe</a>
                            </div>
                        </div>
                        <div class="play-list-row" data-track-row="2">
                            <div class="small-toggle-btn">
                                <i class="small-play-btn"><span
                                        class="screen-reader-text">Small toggle button</span></i>
                            </div>
                            <div class="track-number">
                                2.
                            </div>
                            <div class="track-title">
                                <a class="playlist-track" href="#" data-play-track="2">Lion Dx - Me & Myself</a>
                            </div>
                        </div>
                        <div class="play-list-row" data-track-row="3">
                            <div class="small-toggle-btn">
                                <i class="small-play-btn"><span
                                        class="screen-reader-text">Small toggle button</span></i>
                            </div>
                            <div class="track-number">
                                3.
                            </div>
                            <div class="track-title">
                                <a class="playlist-track" href="#" data-play-track="3">Lion Dx - Larissa</a>
                            </div>
                        </div>
                        <div class="play-list-row" data-track-row="4">
                            <div class="small-toggle-btn">
                                <i class="small-play-btn"><span
                                        class="screen-reader-text">Small toggle button</span></i>
                            </div>
                            <div class="track-number">
                                4.
                            </div>
                            <div class="track-title">
                                <a class="playlist-track" href="#" data-play-track="4">Bantou Posi - Nikeles</a>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="example">
                    <%-- <input type="file" id="rll" />
                   <audio  id="audioPlayer" controls>
                        <source src="" id="rlly" />
                    </audio>

                    function handleFiles(event) {
                         var files = event.target.files;
                         $("#rlly").attr("src", URL.createObjectURL(files[0]));
                         document.getElementById("rllly").load();
                     }

                         document.getElementById("rll").addEventListener("change", handleFiles, false);
                    --%>
                </div>
                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                        <!-- Dropdown - Alerts -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">
                                Alerts Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 7, 2019</div>
                                    $290.29 has been deposited into your account!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 2, 2019</div>
                                    Spending Alert: We've noticed unusually high spending for your account.
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                        </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-envelope fa-fw"></i>
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter">7</span>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">
                                Message Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60"
                                         alt="">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                        problem I've been having.
                                    </div>
                                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60"
                                         alt="">
                                    <div class="status-indicator"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">I have the photos that you ordered last month, how would
                                        you like them sent to you?
                                    </div>
                                    <div class="small text-gray-500">Jae Chun · 1d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60"
                                         alt="">
                                    <div class="status-indicator bg-warning"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Last month's report looks great, I am very happy with the
                                        progress so far, keep up the good work!
                                    </div>
                                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                         alt="">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told
                                        me that people say this to all dogs, even if they aren't good...
                                    </div>
                                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"><s:property
                                    value="%{currentMember.getId().getName()}"/></span> <%--<s:property value="%{user.username}" /></span>--%>
                            <img class="img-profile rounded-circle"
                                 src="<s:url value="/common/template/img/login-jo.jpeg"/>">

                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="<s:url action="infoMemberAction"/>">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"
                                   aria-hidden="true"></i>&nbsp;<s:text name="common.menu.about.user"/>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"><i
                                    class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400" aria-hidden="true"></i>&nbsp;<s:text
                                    name="common.menu.logout"/></a>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- End of Topbar -->
            <!-- Begin Page Content -->
            <div class="container-fluid">
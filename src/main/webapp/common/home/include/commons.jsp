<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<meta name="robots" content="noindex">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>;url=../portggal.jsp" />
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="<s:url value="/theme/img/logo-draft.png" />">

	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">


	<!-- Custom styles for this template -->
	<link  rel="stylesheet"  href="<s:url value="/common/css/custom.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/footer.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/datatable/datatable.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/datatable/responsive.css"/>">
	<link rel="stylesheet" 	 href="<s:url value="/common/css/powered/normalize.css"/>">
	<link rel="stylesheet"   href="<s:url value="/common/css/powered/normalize.min.css"/>">
	<link rel="stylesheet"   href="<s:url value="/common/css/powered/powered.css"/>">
	<link rel="stylesheet"   href="<s:url value="/common/css/flag-icon/css/flag-icon.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/utils/google/css/map.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/menu/css/menu.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/modal/modal.css"/>">
	<!-- NOTIFICATION MANAGER FILE CSS-->
	<link  rel="stylesheet"  href="<s:url value="/common/NotificationStyles/css/normalize.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/NotificationStyles/css/normalize.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/NotificationStyles/css/ns-default.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/NotificationStyles/css/ns-style-bar.css"/>">




	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.15/css/mdb.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">

	<!-- JQuery -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- NOTIFICATION MANAGER  FILES JS-->
	<script src="<s:url value="/common/NotificationStyles/js/modernizr.custom.js"/>"></script>
	<!--[if IE]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script src="<s:url value="/common/NotificationStyles/js/classie.js"/>"></script>
	<script src="<s:url value="/common/NotificationStyles/js/notificationFx.js"/>"></script>
	<script src="<s:url value="/common/notifications/js/notificationManager.js"/>"></script>


	<script src="<s:url value="/common/js/powered/console_runner.js"/>"></script>
	<script src="<s:url value="/common/js/powered/css_reload.js"/>"></script>

	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.21.0/moment.min.js" type="text/javascript"></script>


	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>


	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<script src="<s:url value="/event/js/event.js"/>"></script>
	<script src="<s:url value="/common/js/bootstrap/datepicker/js/bootstrap-datepicker.js"/>"></script>
	<link  rel="stylesheet"  href="<s:url value="/common/css/datatable/customdatable.css"/>">

	<title class="bg-success"><s:text name="common.page.title"/> </title>
	<s:head /><!-- pour la validation-->


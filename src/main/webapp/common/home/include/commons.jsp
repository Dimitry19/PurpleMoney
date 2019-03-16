<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<meta name="robots" content="noindex">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<meta charset="UTF-8">

	<!--Bootstrap- select plugin-->
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">


		<!--Bootstrap- select plugin-->
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">

		<!-- Custom styles for this template -->
		<link  rel="stylesheet"  href="<s:url value="/common/css/custom.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/common/css/footer.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/common/css/datatable/datatable.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/common/css/datatable/responsive.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/common/js/intlTelInput/build/css/intlTelInput.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/common/css/teloveride.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/common/css/jquery/ui/1.12.1/jquery-ui.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/common/css/bootstrap/build/css/bootstrap-datetimepicker.css"/>">
		<link rel="stylesheet" 	 href="<s:url value="/common/css/powered/normalize.css"/>">
		<link rel="stylesheet"   href="<s:url value="/common/css/powered/normalize.min.css"/>">
		<link rel="stylesheet"   href="<s:url value="/common/css/powered/powered.css"/>">
	    <link rel="stylesheet"   href="<s:url value="/common/css/flag-icon/css/flag-icon.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/utils/google/css/map.css"/>">
		<link  rel="stylesheet"  href="<s:url value="/common/menu/css/menu.css"/>">

		<script src="<s:url value="/common/js/powered/console_runner.js"/>"></script>
    	<script src="<s:url value="/common/js/powered/css_reload.js"/>"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"></script>
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
		<script src="<s:url value="/common/js/jquery/ui/1.12.1/jquery-ui.js"/>"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.21.0/moment.min.js" type="text/javascript"></script>
		<script src="<s:url value="/common/js/bootstrap/build/js/bootstrap-datetimepicker.min.js"/>"></script>
		<%--<script src="<s:url value="/common/js/bootstrap/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js"></script>--%>
	<%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs-3.3.7/jq-2.2.4/jszip-3.1.3/pdfmake-0.1.27/dt-1.10.15/b-1.3.1/b-colvis-1.3.1/b-flash-1.3.1/b-html5-1.3.1/b-print-1.3.1/cr-1.3.3/fc-3.2.2/fh-3.1.2/kt-2.2.1/r-2.1.1/rg-1.0.0/rr-1.2.0/sc-1.4.2/se-1.2.2/datatables.min.css"/>
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs-3.3.7/jq-2.2.4/jszip-3.1.3/pdfmake-0.1.27/dt-1.10.15/b-1.3.1/b-colvis-1.3.1/b-flash-1.3.1/b-html5-1.3.1/b-print-1.3.1/cr-1.3.3/fc-3.2.2/fh-3.1.2/kt-2.2.1/r-2.1.1/rg-1.0.0/rr-1.2.0/sc-1.4.2/se-1.2.2/datatables.min.js"></script>

--%>


	<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
	<title class="bg-success"><s:text name="common.page.title"/> </title>
	<s:head /><!-- pour la validation-->


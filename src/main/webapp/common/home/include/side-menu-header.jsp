<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<meta charset="utf-8">
	<meta name="robots" content="noindex">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!--Bootstrap- select plugin-->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">



	<!-- Bootstrap CSS CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<!-- Our Custom CSS -->
	<link rel="stylesheet" href="<s:url value="/common/menu/css/side-bar-menu.css"/>">
	<!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

	<!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>


	<!-- Custom styles for this template -->
	<link  rel="stylesheet"  href="<s:url value="/common/css/custom.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/datatable/datatable.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/js/intlTelInput/build/css/intlTelInput.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/teloveride.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/jquery/ui/1.12.1/jquery-ui.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/bootstrap/build/css/bootstrap-datetimepicker.css"/>">
	<link rel="stylesheet" 	 href="<s:url value="/common/css/powered/normalize.css"/>">
	<link rel="stylesheet"   href="<s:url value="/common/css/powered/normalize.min.css"/>">
	<link rel="stylesheet"   href="<s:url value="/common/css/powered/powered.css"/>">
	<link rel="stylesheet"   href="<s:url value="/common/css/flag-icon/css/flag-icon.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/utils/google/css/map.css"/>">

	<!-- Latest compiled and minified JavaScript -->
	<title class="bg-success"><s:text name="common.page.title"/> </title>
	<s:head /><!-- pour la validation-->


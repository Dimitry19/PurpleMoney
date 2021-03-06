<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0 shrink-to-fit=no" />
	<%--<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>;url=<%=request.getContextPath()%>/common/home/index.jsp" />--%>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval()%>; url=<%=request.getContextPath()%>/timeout.do">
	<meta name="description" content="">
	<meta name="author" content="Dimitri S.">
	<link rel="icon" type="image/png" href="<s:url value="/theme/img/logo-draft.png" />">

	<link  rel="stylesheet"  href="<s:url value="/common/css/custom.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/footer.css"/>">
	<link  rel="stylesheet"   href="<s:url value="/common/css/flag-icon/css/flag-icon.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/utils/google/css/map.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/modal/modal.css"/>">
	<link  rel="stylesheet"  type="text/css" media="all" href="<s:url value="/common/css/version-application-style.css"/>">

	<link rel="stylesheet" type="text/css" href="<s:url value="/common/css/datatable/customdatable.css"/>">
	<title class="bg-success"><s:text name="common.page.title"/></title>

	<s:include value="mdb-header.jsp"/>
	<!-- Custom fonts for this template-->
	<link  rel="stylesheet"  type="text/css" href="<s:url value="/common/template/fontawesome-free/css/all.min.css"/>">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
	<link rel="stylesheet" href="<s:url value="/common/template/css/sb-admin-2.min.css"/> ">
	<link rel="stylesheet" href="<s:url value="/common/template/datatables/dataTables.bootstrap4.min.css"/>" >

	<link  rel="stylesheet"  href="<s:url value="/common/js/select2/dist-4.0.10/css/select2.min.css"/>">
	<link  rel="stylesheet"  href="<s:url value="/common/css/select2-custom.css"/>">
	<script src="<s:url value="/common/Player/js/jquery-1.7.2.min.js"/>"></script>
	<script src="<s:url value="/common/Player/js/jquery-ui-1.8.21.custom.min.js"/>"></script>
	<script src="<s:url value="/common/Player/js/controls.js"/>"></script>
	<script src="<s:url value="/common/js/refresh-page.js"/>"></script>
	<link  rel="stylesheet"  href="<s:url value="/common/home/expired/css/font-awesome.min.css"/>">

	<%--<link href="http://fonts.googleapis.com/css?family=Raleway:400,300,700" rel="stylesheet" type="text/css">--%>











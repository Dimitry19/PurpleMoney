<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
	<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
	<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
	<!--[if !IE]><!-->
	<html lang="it"><!--<![endif]--><!-- BEGIN HEAD --><head>
			<meta charset="utf-8">
			<title>JP - TEST</title>
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta content="width=device-width, initial-scale=1.0" name="viewport">
			<meta http-equiv="Content-type" content="text/html; charset=utf-8">
			<meta content="" name="description">
			<meta content="" name="author">

			<%@ include file="/common/includes/css/webut_main_styles.jspf" %>

			<link rel="shortcut icon" href="favicon.ico">
			</head>
			<!-- BEGIN BODY -->
			<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
			<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
			<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
			<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
			<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
			<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
			<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
			<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
			<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
			<body class="<s:property value="#bodycss"/>" data-first-page="<s:url action="example"/>">
			<!-- BEGIN HEADER -->
			<div class="page-header navbar navbar-fixed-top">
			<!-- BEGIN HEADER INNER -->
			<div class="page-header-inner">
			<!-- BEGIN LOGO -->
			<div class="page-logo">
			<a href="index.html" title="JP - Test">
			<img src="<s:url value="/theme/jp-test/img/logo_gs.png"/>" alt="logo" class="logo-default" width="100">
			</a>
			<div class="menu-toggler sidebar-toggler">
			</div>
			</div>
			<!-- END LOGO -->
			<!-- BEGIN HORIZANTAL MENU -->
			<!-- DOC: Remove "hor-menu-light" class to have a horizontal menu with theme background instead of white background -->
			<!-- DOC: This is desktop version of the horizontal menu. The mobile version is defined(duplicated) in the responsive menu below along with sidebar menu. So the horizontal menu has 2 seperate versions -->
			<div class="hor-menu hor-menu-light hidden-sm hidden-xs">
			<ul class="nav navbar-nav">
			<!-- DOC: Remove data-hover="megadropdown" and data-close-others="true" attributes below to disable the horizontal opening on mouse hover -->
			<li class="classic-menu-dropdown active">
			<a href="<s:url action="welcome"/>" id="home-btn">
			Home <span class="selected"></span>
			</a>
			</li>
			<li id="main-history-btn" class="mega-menu-dropdown"><a
			data-toggle="dropdown" href="javascript:;" class="dropdown-toggle"
			aria-expanded="false"> History <i class="fa fa-angle-down"></i>
			</a>
			<ul class="dropdown-menu" style="min-width: 700px;">
			<li>
			<div class="mega-menu-content">
			<div class="row">
			<div class="col-md-6">
			<ul id="history-list-menu" class="mega-menu-submenu">
			<li>Nessun percorso salvato</li>
			</ul>
			</div>
			</div>
			</div>
			</li>
			</ul></li>
			<li class="mega-menu-dropdown"><a id="main-favorites-btn"
			data-toggle="dropdown" href="javascript:;" class="dropdown-toggle">
			Preferiti <i class="fa fa-angle-down"></i>
			</a>
			<ul class="dropdown-menu" style="min-width: 700px;">
			<li>
			<div class="mega-menu-content ">
			<div class="row">
			<div class="col-md-6">
			<ul id="favorite-list-menu" class="mega-menu-submenu">
			<li>Nessun percorso salvato</li>
			</ul>
			</div>
			</div>
			</div>
			</li>
			</ul>
			</li>
			</ul>
			</div>
			<!-- END HORIZANTAL MENU -->
			<a href="javascript:;" class="menu-toggler responsive-toggler"
			data-toggle="collapse" data-target=".navbar-collapse"> </a>
			<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
			<li class="dropdown dropdown-user"><a href="javascript:;"
			class="dropdown-toggle" data-toggle="dropdown"
			data-hover="dropdown" data-close-others="true"> <span
			class="username"> casaro </span> <i class="fa fa-angle-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-menu-default">
			<li><a
			data-action="{action: 'open-page', url: '/ar/managePrvtUserProfile.do?transientUser.id=104', containerId: 'page'}">
			<i class="icon-user"></i> Gestione profilo
			</a></li>
			<li class="divider" />
			<li><a href="/ar/logout.do?currentEnvCode=ar">Log Out</a></li>
			</ul></li>
			</ul>
			</div>
			</div>
			<!-- END HEADER INNER -->
			</div>
			<!-- END HEADER -->
			<div class="clearfix">
			</div>
			<!-- BEGIN CONTAINER -->

			<div class="page-container">
			<!-- BEGIN SIDEBAR -->
			<div class="page-sidebar-wrapper">
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU1 -->

			<ul
			class="page-sidebar-menu hidden-sm hidden-xs page-sidebar-menu-closed "
			data-keep-expanded="false" data-auto-scroll="true"
			data-slide-speed="200">
			<li class="nav-item"><a class="nav-link nav-toggle"
			title="Produzione"> <i class="fa fa fa-bookmark "></i> <span
			class="title"> Testing </span> <span class="arrow"></span>
			</a>
			<ul class="sub-menu" style="display: none;">
			<li class="nav-item"><a class="nav-link nav-toggle"
			title="Registro Produzione"
			data-action="{action: 'open-page', history: true, url: '<s:url action="example"/>', containerId: 'page', hstore: false}">
			Examples </a></li>
			<li class="nav-item"><a class="nav-link nav-toggle"
			title="Gestione Ordini"
			data-action="{action: 'open-page', history: true, url: '<s:url action="order"/>', containerId: 'page', hstore: false}">
			Gestione Ordini </a></li>
			<li class="nav-item"><a class="nav-link nav-toggle"
			title="Diagnostica"> <i class="glyphicon glyphicon-wrench"></i> <span
			class="title"> Diagnostica </span> <span class="arrow"></span>
			</a>
			<ul class="sub-menu" style="display: none;">
			<li class="nav-item"><a class="nav-link nav-toggle"
			title="File Logs"
			data-action="{action: 'open-page', history: true, url: '<s:url action="runtimeFile"/>', containerId: 'page', hstore: false}">
			<i class="fa fa-file-o" aria-hidden="true"></i>
			<span	class="title"> File Logs</span> </a></li>
			<li class="nav-item"><a class="nav-link nav-toggle"
			title="Diagnostic"
			data-action="{action: 'open-page', history: true, url: '<s:url action="runtimeTraceHome"/>', containerId: 'page', hstore: false}">
			<i class="fa fa-cog fa-spin fa-3x fa-fw" aria-hidden="true"></i><span	class="title">Runtime </span></a></li>
			</ul>
			</li>
			</ul>
			</li>
			</ul>
			<ul class="page-sidebar-menu visible-sm visible-xs"
			data-slide-speed="200" data-auto-scroll="true">
			<li class="nav-item start active"><a href="javascript:;"
			class="nav-link nav-toggle"> Menu principale<span
			class="selected"> </span> <span class="arrow open"> </span>
			</a>
			<ul class="sub-menu">
			<li class="nav-item"><a href="javascript:;"
			class="nav-link nav-toggle"> <i class="fa fa-clock-o"></i> <span
			class="title"> History </span> <span class="arrow"> </span>
			</a>
			<ul id="history-list-side-menu" class="sub-menu">
			</ul></li>
			<li class="nav-item"><a href="javascript:;"
			class="nav-link nav-toggle"> <i class="fa fa-star"></i> <span
			class="title"> Preferiti </span> <span class="arrow"> </span>
			</a>
			<ul id="favorite-list-side-menu" class="sub-menu">
			</ul></li>
			<li class="nav-item"><a class="nav-link nav-toggle"
			title="Testing"> <i class="fa fa fa-bookmark "></i> <span
			class="title"> Testing </span> <span class="arrow"></span>
			</a>
			<ul class="sub-menu" style="display: block;">
			<li class="nav-item"><a class="nav-link nav-toggle"
			title="Examples"
			data-action="{action: 'open-page', history: true, url: '<s:url action="example"/>', containerId: 'page', hstore: false}">
			Examples <span class="arrow"></span>
			</a>
			<ul class="sub-menu">
			</ul></li>
			</ul>
			</li>
			</ul>
			</li>
			</ul>
			<!-- END RESPONSIVE MENU FOR HORIZONTAL & SIDEBAR MENU -->
			</div>
			</div>
			<!-- END SIDEBAR -->
			<!-- BEGIN CONTENT -->
			<div class="page-content-wrapper">
			<div class="page-content">
			<div class="page-content-body" id="page"></div>
			</div>
			</div>
			<!-- END CONTENT -->
			</div>
			<!-- END CONTAINER -->
			<!-- BEGIN FOOTER -->
			<div class="page-footer">
			<div class="page-footer-inner">

			</div>
			<div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
			</div>
			</div>
			<!-- END FOOTER -->




			<!-- END JAVASCRIPTS -->

			<!-- END BODY -->
			</body></html>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
	 <s:hidden name="currentUser"/>
	 <s:set var="currentUs" value="%{currentUser}"/>
	<s:set var="isAdmin" value="%{currentMember.isAdmin()}"/>
	 <nav class="navbar navbar-expand-lg navbar-light bg-purple-light">
	 	<img class="mb-4 img-circle menu-mini-logo" src=" <s:url value="/theme/img/icon-purple.jpg"/>"  width="25" height="25" align="left">
	 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		 	<span class="navbar-toggler-icon"></span>
		 </button>
		 <div class="collapse navbar-collapse" id="navbarSupportedContent">
			 <ul class="navbar-nav mr-auto">
				 <li class="nav-item active">
	 				<a class="nav-link" href="<s:url action="homeAction"/>"><i class="fa fa-home"></i>&nbsp;<s:text name="common.menu.home"/></a>
				 </li>
				 <li class="nav-item dropdown">
				 	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMembersLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	 					<i class="fa fa-users" aria-hidden="true"></i>&nbsp;
						 <s:text name="common.menu.members"/>
					</a>
					 <!-- bloc menu déroulant -->
					 <div class="dropdown-menu" aria-labelledby="navbarDropdownMembersLink">
						<s:if test="currentMember.isAdmin()== true">
						 	<a class="dropdown-item" href="<s:url action="menuAddMemberAction"/>"><i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.members.add"/></a>
							<a class="dropdown-item" href="<s:url action="editMemberAction"/>"><i class="fa fa-edit" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.members.edit"/></a>
						</s:if>
						<a class="dropdown-item" href="<s:url action="allMembersAction"/>"><i class="fa fa-users" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.members.all"/></a>
					 </div>
				 </li>
				 <li class="nav-item dropdown">
					 <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownAmountLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="title"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;
	 					<s:text name="common.menu.founds"/>
	 				</span></a>
					 <!-- bloc menu déroulant -->
					 <div class="dropdown-menu" aria-labelledby="navbarDropdownAmountLink">
					<s:if test="currentMember.isAdmin()== true">
	 					 <a class="nav-link" href="<s:url action="addingSessionAction"/>">
	 							<i class="fa fa-money" aria-hidden="true"></i>&nbsp; <s:text name="common.menu.founds.add"/>
	 					 </a>
					</s:if>
						 <a class="nav-link" href="<s:url action="sessionConsultAction"/>">
	 							<i class="fa fa-eye" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.founds.open"/>
	 					 </a>
	                     <a class="nav-link" href="<s:url action="sessionsAction"/>"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.founds.all"/></a>
						 <a class="nav-link"  href="<s:url action="retrieveCalendar"/>"><i class="fa fa-calendar-o" aria-hidden="true"></i>&nbsp;<s:text name="footer.link.calendar"></s:text></a>
					 </div>
				 </li>
				 <li class="nav-item">
				 	<a class="nav-link" href="#"><i class="fa fa-folder" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.sanctions"/></a>
				 </li>
				 <li class="nav-item">
				 	<a class="nav-link" href="#"><i class="fa fa-book" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.reglements"/></a>
				 </li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownLanguageLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-language" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.language"/>
				</a>
				<!-- bloc menu déroulant -->
				<div class="dropdown-menu" aria-labelledby="navbarDropdownLanguageLink">
					<s:url id="indexEN"  namespace="/" action="locale" >
						<s:param name="request_locale" >en</s:param>
					</s:url>
					<s:url id="indexEN" namespace="/" action="locale" >
						<s:param name="request_locale" >es</s:param>
					</s:url>
					<s:url id="indexFR" namespace="/" action="locale" >
						<s:param name="request_locale" >fr</s:param>
					</s:url>
					<a class="dropdown-item" href="%{#indexEN}"><span class="flag-icon flag-icon-us flag-icon-squared"></span>&nbsp;<s:text name="common.menu.language.english"/></a>
					<a class="dropdown-item" href="%{#indexFR}"><span class="flag-icon flag-icon-fr flag-icon-squared"></span>&nbsp;<s:text name="common.menu.language.french"/></a>
					<a class="dropdown-item" href="%{#indexIT}"><span class="flag-icon flag-icon-it flag-icon-squared"></span></i>&nbsp;<s:text name="common.menu.language.italian"/></a>
				</div>
				</li>
				 <%--<li class="nav-item">--%>
					<%--<a class="nav-link" href="#"><i class="fa fa-mobile" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.contact"/></a>--%>
				 <%--</li>--%>
				 <%--<li class="nav-item">--%>
				 	<%--<a class="nav-link" href="#"><i class="fa fa-info" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.about"/></a>--%>
				 <%--</li>--%>
			 </ul>
			 <div class="top-menu" style="margin-right: 5px;">
				 <ul class="nav navbar-nav pull-right">
					 <li class="dropdown dropdown-user">
						<%--<i class="fa fa-angle-down"></i>--%>
						<a href="" class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-close-others="true"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;<span class="username"><s:property value="%{currentMember.getId().getName()}"/></span>
						</a>
					 <ul class="dropdown-menu dropdown-menu-default">
	 					<%--<li class="divider" />--%>
						<li>
							<a class="nav-link" href="<s:url action="infoMemberAction"/>"><i class="fa fa-id-card" aria-hidden="true"></i>&nbsp;
	 							<s:text name="common.menu.about.user"/>
						 	</a>
						 </li>

						<s:if test="currentMember.isAdmin()== true">
						 <li class="divider" />
						 	<li>
								 <a class="nav-link" href="<s:url action="addingMailAction"/>">
									 <i class="fa fa-envelope" aria-hidden="true"></i>&nbsp; <s:text name="common.menu.mails.send"/>
								 </a>
						 </li>
						</s:if>
						 <li class="divider" />
						 <li>
							<a class="nav-link" href="<s:url action="logoutAction"/>"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.logout"/></a>
						 </li>
					   </ul>
					 </li>
				 </ul>
			 </div>
			 <form action="searchAction" class="form-inline my-2 my-lg-0">
			 		<input class="form-control mr-sm-2"  placeholder=<s:text name="common.menu.search"/> type="search"  aria-label="Search">
			        <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i>&nbsp;<s:text name="common.menu.search"/></button>
			 </form>
		 </div>
	 </nav>









<%--
	 <nav class="navbar navbar-expand-lg navbar-light bg-light">
		 <a class="navbar-brand" href="#">Menu</a>
		 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		 	<span class="navbar-toggler-icon"></span>
		 </button>

		 <div class="collapse navbar-collapse" id="navbarSupportedContent">
			 <ul class="navbar-nav mr-auto">
				 <li class="nav-item active">
				 <a class="nav-link" href="<s:url action="homeAction"/>">Home <span class="sr-only">(current)</span></a>
				 </li>
				 &lt;%&ndash; <li class="nav-item">
					<a class="nav-link" href="<s:url action="articlesAction"/>">Tous les articles</a>
				  </li>&ndash;%&gt;
				 <li class="nav-item">
				 <a class="nav-link" href="<s:url action="amountsAction"/>">Toutes Cotisations</a>
				 </li>
				 <li class="nav-item">
				 <a class="nav-link" href="<s:url action="addingAmountAction"/>">Ajouter une seance cotisation</a>
				 </li>
				 <li class="nav-item dropdown">
				 <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				 Dropdown
				 </a>
				 <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				 <a class="dropdown-item" href="#">Action</a>
				 <a class="dropdown-item" href="#">Another action</a>
				 <div class="dropdown-divider"></div>
				 <a class="dropdown-item" href="#">Something else here</a>
				 </div>
				 </li>
				 <li class="nav-item">
				 <a class="nav-link" href="#">Disabled</a>
				 </li>
			 </ul>
			 <form class="form-inline my-2 my-lg-0">
				 <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			 </form>
			 <ul>
				 <li class="nav-item">
				 	<a class="nav-link" href="<s:url action="logoutAction"/>">Logout</a>
				 </li>
			 </ul>
		 </div>
	 </nav>--%>

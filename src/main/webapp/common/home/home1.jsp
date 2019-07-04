<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="include/side-menu-header.jsp"/>
</head>
 <div class="col">
	<%@ include file = "../../common/footers/footer.jsp" %>
</div>
<body>
<%@ include file="include/header-logo.jsp" %>
<div class="wrapper">
	<%@ include file="../menu/menu.jsp" %>
</div>
<div id="content" class="container text-center" style="width: auto">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<button type="button" id="sidebarCollapse" class="btn btn-info">
					<i class="fas fa-align-left"></i>
					<span>Menu</span>
				</button>
			</div>
		</nav>

<%--<h1 class="h3 mb-3 text-xl-center font-weight-bolder bd-text-purple-bright"><s:text name="common.page.title"/></h1>--%>
	<%@ include file = "../../common/home/include/powered.jsp" %>
</div>

</body>
</html>
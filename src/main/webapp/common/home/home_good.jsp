<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="include/commons.jsp"/>
</head>
    <body>
		<%@ include file="include/header-logo.jsp" %>
		<%@ include file="../menu/menu.jsp" %>
		<div class="container text-center" style="width: auto">
				<%--<h1 class="h3 mb-3 text-xl-center font-weight-bolder bd-text-purple-bright"><s:text name="common.page.title"/></h1>--%>
			<%@ include file = "../../common/home/include/powered.jsp" %>
		</div>

    </body>
 <div class="col">
	<%@ include file = "../../common/footers/footer.jsp" %>
</div> 
</html>
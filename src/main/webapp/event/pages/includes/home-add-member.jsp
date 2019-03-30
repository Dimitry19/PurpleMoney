<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/commons.jsp"/>
<s:head />
</head>
    <body>
	<%@ include file="../../../common/home/include/header-logo.jsp" %>
	<%@ include file="../../../common/menu/menu.jsp" %>
		<div class="container text-center" style="width: auto">
				<%--<h1 class="h3 mb-3 text-xl-center font-weight-bolder bd-text-purple-bright"><s:text name="common.page.title"/></h1>--%>
					<s:if test="hasActionMessages()">
						<%@ include file="../../../common/pages/notifications/save-member-success.jsp" %>
					</s:if>
					<s:if test="hasActionErrors()">
						<%@ include file="../../../common/pages/notifications/save-member-error.jsp" %>
						<%-- <div class="errors-notification">
                             <s:actionerror theme="bootstrap"/>
                         </div>--%>
					</s:if>
			<%@ include file = "../../../common/home/include/powered.jsp" %>
		</div>

    </body>
 <div class="col">
	<%@ include file = "../../../common/footers/footer.jsp" %>
</div> 
</html>
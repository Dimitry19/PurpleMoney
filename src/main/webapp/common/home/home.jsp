<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="include/header.jsp"/>
<s:hidden name="currentUser"/>
<s:set var="currentUs" value="%{currentUser}"/>
<s:set var="isAdmin" value="%{currentMember.isAdmin()}"/>
<s:head /><!-- pour la validation-->
</head>

<%@ include file = "../../common/home/include/common-header-top.jsp" %>
<%@ include file = "../../common/home/include/infos.jsp"%>
<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
</body>

</html>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="gsm" uri="/gsm-tags"  %>
<s:set name="theme" value="'gsm'" scope="page" />

<s:if test="!#alreadyimported">
	<s:set var="alreadyimported" value="%{true}" />
	<%@ include file="./gsm-default-styles.jsp" %>
	<%@ include file="./default-patterns.jsp" %>
</s:if>

                             
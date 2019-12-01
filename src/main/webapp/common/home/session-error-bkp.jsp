<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="include/commons.jsp"/>
</head>
<body>
<div class="container text-center">
        <img class="mb-4 img-circle" src=" <s:url value="/theme/img/icon-purple.jpg"/>"  width="95" height="72">
        <div>
            <h1 class="h3 mb-3 font-weight-normal"><p><s:text name="authentication.text.session-terminated"/></p></h1>
            <a href="<s:url action="login"/>">
                <s:submit  type="button"   id="btnLogin" cssClass="btn btn-sm btn-primary btn-login"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;Go to Login</s:submit>
            </a>
        </div>
        <div class="bd-placeholder-img"></div>
</div>
</body>
<div class="custom-padding col">
    <%@ include file = "../../common/footers/footer.jsp" %>
</div>

</html>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="include/commons.jsp"/>
</head>
<body>
    <div class="container text-center">
        <s:if test="hasActionMessages()">
            <%@ include file="../../common/pages/notifications/logout-success.jsp" %>
        </s:if>
        <s:form action="loginAction" theme="simple"  id="formLogin" class="form-login form-horizontal">
                <img class="mb-4 img-circle" src=" <s:url value="/theme/img/icon-purple.jpg"/>"  width="95" height="72">
                <h1 class="h3 mb-3 font-weight-normal"><s:text name="common.home.login.title"/></h1>
                    <div class="row">
                        <div class="center-div">
                            <div class="form-group">
                                <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                        <s:textfield  key="common.login.username" id="inputUsername"  type="username" placeholder="%{getText('common.login.username')}" name="user.username"  value="%{user.username}" class="form-control form-control-login"  required=" " tooltip="getText('common.login.username.tooltip')" />
                                        <div class="invalid-feedback"><s:text name="common.login.error.username"/></div>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa-fw"></i>
                                    <s:password key="common.login.password" placeholder="%{getText('common.login.password')}" id="inputPassword" name="user.password" value="%{user.password}"  class=" form-control form-control-login" type="Password"  required=" "/>
                                <div class="invalid-feedback"><s:text name="common.login.error.password"/></div>
                                </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <s:select
                                            tooltip="%{getText('common.login.association.tooltip')}"
                                            class="selectpicker" data-live-search="true"
                                            label="Association"
                                            id="association"
                                            list="associations" listKey="id.id"	listValue="%{id.name}"
                                            name="user.association"
                                            emptyOption="false"
                                            headerValue="%{getText('common.login.group.tooltip')}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                  <s:select
                                            tooltip="%{getText('common.login.association.tooltip')}"
                                            class="selectpicker" data-live-search="true"
                                            label="Language"
                                            id="langue"
                                            list="languages" listKey="id" listValueKey="%{getText(description)}"
                                            name="user.language"
                                            emptyOption="false"
                                            headerKey=""
                                            headerValue="%{getText('common.login.language')}"/>
                                </div>
                            </div>
                        </div>
                    </div>
                 <div class="checkbox mb-3 form-group form-check">
                    <s:checkbox id="remember"  cssStyle="" name="user.remember"  value="%{user.remember}" />
                    <label class="form-check-label" for="remember"><s:text name="common.login.remember.me"></s:text></label>
                </div>
                <div>
                    <s:submit  type="button"   id="btnLogin" cssClass="btn btn-sm btn-primary btn-login"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;<s:text name="common.login.submit"></s:text></i></s:submit>
                </div>
                <div class="bd-placeholder-img"></div>
        </s:form>
    </div>
    </body>
    <div class="custom-padding col">
        <%@ include file = "../../common/footers/footer.jsp" %>
    </div>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script>
    FormManager.validationForm({idForm:'formLogin',idSubmit:'btnLogin'})
</script>
</html>
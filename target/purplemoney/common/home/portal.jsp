<%@ taglib prefix="s" uri="/struts-tags" %>
<s:include value="include/commons.jsp"/>

</head>
<body>
<div class="container text-center">
        <s:form action="loginAction" theme="simple"  id="formLogin" class="form-login form-horizontal">
                <img class="mb-4 img-circle-sa" src=" <s:url value="../../common/logo/medio.png"/>"  width="95" height="72">
                <h1 class="h3 mb-3 font-weight-normal"><s:text name="common.home.login.title"/></h1>
                    <div class="row">
                        <div class="center-div">
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon-username">
                                            <strong>
                                                <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                            </strong>
                                       </span>
                                    </div>
                                    <s:textfield  key="common.login.username" id="inputUsername"  type="username" placeholder="%{getText('common.login.username')}" name="user.username"  value="%{user.username}" class="form-control form-control-login"  required=" " tooltip="getText('common.login.username.tooltip')" />
                                    <div class="invalid-feedback"><s:text name="common.login.error.username"/></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon-password">
                                            <strong>
                                                <i class="fa fa-key fa-fw"></i>
                                            </strong>
                                       </span>
                                    </div>
                                    <s:password key="common.login.password" placeholder="%{getText('common.login.password')}" id="inputPassword" name="user.password" value="%{user.password}"  class="form-control form-control-login password-field" type="Password"  data-toggle="password" onkeypress="UtilsManager.activated(event)" required=" "/>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                          <i class="fa fa-eye"></i>
                                        </span>
                                    </div>
                                    <div class="invalid-feedback"><s:text name="common.login.error.password"/></div>
                                </div>
                                <div id="passmajactive" class="cap-activate"><i class="fa fa-lock" aria-hidden="true"></i>&nbsp;<s:text name="common.cap.activted"></s:text></div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon-association">
                                            <strong>
                                                <i class="fa fa-users" aria-hidden="true"></i>
                                            </strong>
                                       </span>
                                    </div>
                                    <s:select
                                            tooltip="%{getText('common.login.association.tooltip')}"
                                            class="browser-default custom-select"  data-live-search="true"
                                            label="Association"
                                            id="association"
                                            list="associations" listKey="id.id"	listValue="%{id.name}"
                                            name="user.association"
                                            emptyOption="false"
                                            headerValue="%{getText('common.login.group.tooltip')}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon-languages">
                                            <strong>
                                                <i class="fa fa-language" aria-hidden="true"></i>
                                            </strong>
                                       </span>
                                    </div>
                                  <s:select
                                            tooltip="%{getText('common.login.association.tooltip')}"
                                            class="browser-default custom-select" data-live-search="true"
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
    <div>
        <s:if test="hasActionErrors()">
            <script>
                var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="common.login.error"/></p>';
               NotificationManager.displayNotification({message:message, type:'error'})
            </script>
        </s:if>
        <s:if test="hasActionMessages()">
            <script>
                var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="common.logout.success"/></p>';
                NotificationManager.displayNotification({message:message, type:'success'})
            </script>
        </s:if>
    </div>
    </body>
    <div class="custom-padding col">
        <%@ include file = "../../common/footers/footer.jsp" %>
    </div>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/detectCap.js"/>"></script>
<script src="<s:url value="/common/js/bootstrap-show-password.min.js"/>"></script>
<script>
    FormManager.validationForm({idForm:'formLogin',idSubmit:'btnLogin'})
</script>
</html>
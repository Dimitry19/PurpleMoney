<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="include/commons.jsp"/>


    <body class="text-center">
 <%--   <div class="container">
        <div class="row">
            <h1 class="text-center">
                <p class="text-primary text-center">PURPLE MONEY - Welcome</p>
            </h1>
        </div>
    </div>--%>
    <div class="container">
        <s:form action="loginAction" theme="simple"  id="formLogin" class="form-login form-horizontal">
                <img class="mb-4 img-circle" src=" <s:url value="/theme/img/icon-purple.jpg"/>"  width="95" height="72">
                <h1 class="h3 mb-3 font-weight-normal"><s:text name="common.home.login.title"/></h1>
                    <div class="row">
                        <div class="center-div">
                            <div class="form-group">
                                <div class="input-group margin-bottom-sm">
                                        <%--<label for="inputUsername" class="sr-only">Username</label>--%>
                                    <span class="input-group-addon"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                    <s:textfield  key="global.login.username" id="inputUsername"  type="username" placeholder="Username" name="user.username"  value="%{user.username}" class="form-control form-control-login"  required=" " autofocus="" tooltip="getText('global.login.username.tooltip')" />
                                <div class="invalid-feedback"><s:text name="global.login.error.username"/></div>
                                </span>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                        <%--<label for="inputPassword" class="sr-only custom-padding">Password</label>--%>
                                    <span class="input-group-addon"><i class="fa fa-key fa-fw"></i>
                                    <s:password key="global.login.password" placeholder="Password"  id="inputPassword" name="user.password" value="%{user.password}"  class=" form-control form-control-login" type="Password"  required=" "/>
                                <div class="invalid-feedback"><s:text name="global.login.error.password"/></div>
                                </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <s:select
                                            tooltip="getText('global.login.group.tooltip')"
                                            class="selectpicker" data-live-search="true"
                                            label="Association"
                                            id="association"
                                            list="associations" listKey="id.id"	listValue="%{id.name}"
                                            name="user.association"
                                            emptyOption="false"
                                            headerValue="getText('global.login.group.tooltip')"/>
                                </div>
                            </div>
                        </div>
                    </div>
                 <div class="checkbox mb-3 form-group form-check">
                    <s:checkbox id="remember"  cssStyle="" name="user.remember"  value="%{user.remember}" />
                    <label class="form-check-label" for="remember"><s:text name="global.login.remember.me"></s:text></label>
                </div>
                <div>
                    <s:submit  type="button"   id="btnLogin" cssClass="btn btn-sm btn-primary btn-login"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;<s:text name="global.login.submit"></s:text></i></s:submit>
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
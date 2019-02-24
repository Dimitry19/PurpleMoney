<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="include/common.jsp"/>


    <body class="text-center">
    <div class="container">
        <div class="row">
            <h1 class="text-center">
                <p class="text-primary text-center">PURPLE MONEY - Welcome</p>
            </h1>
        </div>
    </div>
    <div class="container">
        <s:form action="loginAction" theme="simple"  id="formLogin" class="form-login">
                <img class="mb-4" src=" <s:url value="/theme/img/logo-draft.png"/>" alt="" width="95" height="72">
                <h1 class="h3 mb-3 font-weight-normal">Login</h1>
                <div class="form-group">
                    <label for="inputUsername" class="sr-only">Username</label>
                    <s:textfield  id="inputUsername"  type="username" placeholder="Username" name="user.username"  class="form-control form-control-login"  required=" " autofocus="" tooltip="Enter your Name here"/>
                    <div class="invalid-feedback">Entrer le nom utilisateur</div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="sr-only custom-padding">Password</label>
                    <s:password placeholder="Password"  id="inputPassword" name="user.password"  class=" form-control form-control-login" type="Password"  required=" "/>
                    <div class="invalid-feedback">Entrer la password</div>   <%--<input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">--%>
                </div>
                 <div class="checkbox mb-3 form-group form-check">
                    <s:checkbox id="remember"  cssStyle="" name="user.remember" />
                    <label class="form-check-label" for="remember">Se souvenir de moi</label>
                </div>
                <s:submit value="Entrer" id="btnLogin" cssClass="btn btn-sm btn-primary btn-login"/>
                <div class="bd-placeholder-img"></div>
                <%--<button class="btn btn-lg btn-primary btn-block" type="submit">Entrer</button>--%>
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
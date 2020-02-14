<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="include/header.jsp"/>
</head>

<body class="bg-gradient-primary">

<div class="container">
	<!-- Outer Row -->
	<div class="row justify-content-center">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4"><s:text name="common.page.title"/></h1>
								</div>
								<s:form action="loginAction" theme="simple"  id="formLogin" class="user">
									<div class="md-form form-sm">
										<i class="fas fa-envelope prefix"></i>
										<s:textfield  type="text" class="form-control"   id="inputUsername"  name="user.username"  value="%{user.username}"   required=" "/>
										<label for="inputUsername"><s:text name="common.login.username"/></label>
										<div class="invalid-feedback"><s:text name="common.login.error.username"/></div>
									</div>
									<div class="md-form form-sm">
										<i class="fa fa-key prefix"></i>
										<s:password id="inputPassword" name="user.password" value="%{user.password}"  class="form-control  password-field" type="Password"  data-toggle="password" onkeypress="UtilsManager.activated(event)" required=" "/>
										<label for="inputPassword"><s:text name="common.login.password"/></label>
										<div class="invalid-feedback"><s:text name="common.login.error.password"/></div>

										<div id="passmajactive" class="cap-activate"><i class="fa fa-lock" aria-hidden="true"></i>&nbsp;<s:text name="common.cap.activted"></s:text></div>
									</div>
									<div class="md-form form-sm">
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
									<div class="md-form form-sm">
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
									<div class="md-form form-sm">
										<div class="custom-control custom-checkbox small">
											<s:checkbox id="remember"  class="custom-control-input" name="user.remember"  value="%{user.remember}" />
											<label class="form-check-label custom-control-label" for="remember"><s:text name="common.login.remember.me"></s:text></label>
										</div>
									</div>
									<div class="md-form form-sm">
										<s:submit  type="button"   id="btnLogin" cssClass="btn btn-sm btn-primary btn-login btn btn-primary btn-user btn-block"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;<s:text name="common.login.submit"></s:text></i></s:submit>
									</div>

									</s:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../../common/footers/footer.js.jsp" %>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/detectCap.js"/>"></script>
<script src="<s:url value="/common/js/bootstrap-show-password.min.js"/>"></script>
<script>FormManager.validationForm({idForm:'formLogin',idSubmit:'btnLogin'})</script>

</body>

</html>

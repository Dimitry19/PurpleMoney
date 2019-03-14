<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
</head>
<body>
<%@ include file="../../common/home/include/header-logo.jsp" %>
<%@ include file="../../common/menu/menu.jsp" %>
<div class="container text-center">
    <div class="card card-perso">
        <div class="card-header">
            <h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="member.add.title"/></h1>
        </div>
        <div class="card-body">
            <s:form class="form-horizontal"  action="addMemberAction" id="formRegister">
                <div class="form-group">
                    <s:label value="%{getText('member.label.association')}" id="idnameadd" for="idnameadd"  labelposition="left"></s:label>
                    <div class="input-group">
                        <s:textfield id="userSearchAssociation"   value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true" />
                        <s:hidden  name="userAdding.association" value="%{associationCurrent.id.id}" />
                        <s:hidden  name="userAdding.id.memberId" value="%{associationCurrent.id.id}" />
                    </div>
                </div>
                <div class="form-group">
                    <s:label value="%{getText('member.label.role')}" id="idrole" for="idrole"  labelposition="left"></s:label>
                    <div class="input-group">
                        <s:select
                                tooltip="%{getText('member.add.role.tooltip')}"
                                class="selectpicker" data-live-search="true"
                                label="Role"
                                id="role"
                                list="roles" listKey="id.role"	listValue="%{id.role + '-' + description}"
                                name="userAdding.role"
                                emptyOption="false"
                                headerValue="%{getText('member.add.role.headerValue')}"/>
                    </div>
                </div>
                <div class="form-group">
                    <s:label value="%{getText('member.label.name')}" id="name" for="name"  labelposition="left"></s:label>
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i>
						<s:textfield required="true" type="text" class="form-control" name="userAdding.id.name" id="name"  placeholder="%{getText('member.add.placeholder.name')}" />
						<div class="invalid-feedback"><s:text name="member.add.error.name"/></div>
					</span>
                </div>
                <div class="form-group">
                    <s:label value="%{getText('member.label.surname')}" id="surname" for="surname"  labelposition="left"></s:label>
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i>
						<s:textfield type="text" required="true" class="form-control" name="userAdding.surname" id="surname"  placeholder="%{getText('member.add.placeholder.surname')}" />
						<div class="invalid-feedback"><s:text name="member.add.error.surname"/></div>
					</span>
                </div>
                <div class="form-group">
                    <s:label value="%{getText('member.label.email')}" id="email" for="email"  labelposition="left"></s:label>
                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i>
						<s:textfield type="email" required="true" class="form-control" name="userAdding.email" id="email"  placeholder="%{getText('member.add.placeholder.email')}" />
					   <div class="invalid-feedback"><s:text name="member.add.error.mail"/></div>
					</span>
                </div>
                <div class="form-group">
                    <s:label value="%{getText('member.label.phone')}" id="telephone" for="telephone"  labelposition="left"></s:label>
                    <span class="input-group-addon"><i class="fa fa-mobile" aria-hidden="true"></i>
						<s:textfield type="tel" required="true" class="form-control" name="userAdding.phone" id="telephone"  onfocus="TelManager.telFormat({idTel:'telephone'})" maxlength="14" placeholder="%{getText('member.add.placeholder.phone')}" />
						<div class="invalid-feedback"><s:text name="member.add.error.tel"/></div>
					</span>
                </div>
                <div class="form-group">
                    <s:label value="%{getText('member.label.address')}"  id="address" for="address"  labelposition="left"></s:label>
                    <span class="input-group-addon"><i class="fa fa-map-marker" aria-hidden="true"></i>
						<s:textfield type="text" required="true" class="form-control" name="userAdding.address" id="address"  placeholder="%{getText('member.add.placeholder.address')}" />
					<div class="invalid-feedback"><s:text name="member.add.error.address"/></div>
					</span>
                </div>
                <div class="form-group">
                    <s:radio label="%{getText('member.label.gender')}" list="#{'F':'  Female','M':'  Male'}" name="userAdding.sex"  class="radio-inline" multiple="false"></s:radio>
                </div>
                <div class="checkbox mb-3 form-group form-check">
                    <s:checkbox id="isActive"  cssStyle="" tooltip="%{getText('member.add.active.tooltip')}" name="userAdding.active" />
                    <label class="form-check-label" for="isActive"><s:text name="member.add.error.active"/></label>
                </div>
                <div class="checkbox mb-3 form-group form-check">
                    <s:checkbox id="isAdmin"  cssStyle="" tooltip="%{getText('member.add.admin.tooltip')}" name="userAdding.admin"/>
                    <label class="form-check-label" for="isAdmin"><s:text name="member.add.error.admin"/></label>
                </div>
                <div class="form-group">
                    <s:submit type="button" id="btnRegister" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-save" aria-disabled="true"></i>&nbsp; <s:text name="member.add.register"/></s:submit>
                </div>
            </s:form>
        </div>
        <%--<div class="card-footer bg-transparent border-success">
        </div>--%>
        <s:if test="hasActionMessages()">
            <div class="success-notification">
                <s:actionmessage theme="bootstrap"/>
            </div>
        </s:if>
        <s:if test="hasActionErrors()">
            <div class="errors-notification">
                <s:actionerror theme="bootstrap"/>
            </div>
        </s:if>
    </div>
</div>
</body>
<div class="col">
    <%@ include file = "../../common/footers/footer.jsp" %>
</div>
<%--<script src="<s:url value="/common/js/BootstrapValidator/bootstrapValidator.js"/>"></script>--%>
<script src="<s:url value="/common/js/form.js"/>"></script>
<%--<script src="https://code.jquery.com/jquery-latest.min.js"></script>--%>
<script src="<s:url value="/common/js/notification-manager.js"/>"></script>
<script src="<s:url value="/common/js/intlTelInput/build/js/intlTelInput.js"/>"></script>
<script src="<s:url value="/common/js/tel-pattern.js"/>"></script>
<script>
    //var input = document.querySelector("#telephone");
    //window.intlTelInput(input);
</script>
<script>
    FormManager.validationForm({idForm: 'formRegister',idSubmit:'btnRegister'})
    TelManager.telFormat({idTel:'telephone'})
</script>
</html>


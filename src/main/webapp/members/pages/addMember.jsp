<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
</head>
<body>
<!-- MDB core JavaScript -->
<script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.15/js/mdb.min.js"></script>
<script src="<s:url value="/common/js/form.js"/>"></script>

<%@ include file="../../common/home/include/header-logo.jsp" %>
<%@ include file="../../common/menu/menu.jsp" %>
<s:set var="lang" value="%{currentLocale}"/>
<div class="container text-center">

    <div class="card card-perso">
        <div class="card-header">
            <h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="member.add.title"/></h1>
        </div>
        <div class="card-body">
            <s:form class="form-horizontal"  action="addMemberAction" id="formRegister">
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-association">
                                <strong>
                                    <s:text name="member.label.association"/>
                                   <i class="fa fa-users" aria-hidden="true"></i>
                                 </strong>
                            </span>
                        </div>
                        <s:textfield id="userSearchAssociation"   value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true" />
                        <s:hidden name="userAdding.id.memberId" value="%{associationCurrent.id.id}"/>
                        <s:hidden name="userAdding.association" value="%{associationCurrent.id.id}"/>
                        <s:hidden name="userAdding.associationDesc" value="%{associationCurrent.description}"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-role">
                                <strong>
                                    <%--<s:label value="%{getText('member.label.role')}" id="idrole" for="idrole"  labelposition="left"></s:label>--%>
                                     <s:text name="member.label.role"/>
                                    <i class="fa fa-wrench" aria-hidden="true"></i>
                                 </strong>
                            </span>
                        </div>
                        <s:select
                                tooltip="%{getText('member.add.role.tooltip')}"
                                class="browser-default custom-select" data-live-search="true"
                                label="Role"
                                id="role"
                                list="roles" listKey="id.role"	listValue="%{id.role + '-' + description}"
                                name="userAdding.role"
                                emptyOption="false"
                                headerValue="%{getText('member.add.role.headerValue')}"
                        />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-user-name">
                                <strong>
                                      <%--<s:label value="%{getText('member.label.name')}" id="name" for="name"  labelposition="left"></s:label>--%>
                                     <s:text name="member.label.name"/>
                                    <i class="fa fa-user fa" aria-hidden="true"></i>
                                 </strong>
                            </span>
                        </div>
                        <s:textfield required="true" type="text" class="form-control" name="userAdding.id.name" id="name"  placeholder="%{getText('member.add.placeholder.name')}" />
                        <div class="invalid-feedback"><s:text name="member.add.error.name"/></div>
                    </div>
                    </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon-user-surname">
                                    <strong>
                                          <%--<s:label value="%{getText('member.label.surname')}" id="surname" for="surname"  labelposition="left"></s:label>--%>
                                         <s:text name="member.label.surname"/>
                                        <i class="fa fa-user fa" aria-hidden="true"></i>
                                     </strong>
                                </span>
                        </div>
                        <s:textfield type="text" required="true" class="form-control" name="userAdding.surname" id="surname"  placeholder="%{getText('member.add.placeholder.surname')}" />
                        <div class="invalid-feedback"><s:text name="member.add.error.surname"/></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-email">
                                <strong>
                                     <%--<s:label value="%{getText('member.label.email')}" id="email" for="email"  labelposition="left"></s:label>--%>
                                    <s:text name="member.label.email"/>
                                    <i class="fa fa-envelope fa" aria-hidden="true"></i>
                                 </strong>
                            </span>
                        </div>
						<s:textfield type="email" required="true" class="form-control" name="userAdding.email" id="email"  pattern="^[^@\s]+@([^@\s]+\.)+[^@\s]+$" placeholder="%{getText('member.add.placeholder.email')}" />
					   <div class="invalid-feedback"><s:text name="member.add.error.mail"/></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-phone">
                                <strong>
                                     <%--<s:label value="%{getText('member.label.phone')}" id="telephone" for="telephone"  labelposition="left"></s:label>--%>
                                     <s:text name="member.label.phone"/>
                                     <i class="fa fa-mobile" aria-hidden="true"></i>
                                 </strong>
                            </span>
                        </div>
						<s:textfield type="tel" required="true" class="form-control" name="userAdding.phone" id="telephone" maxlength="14" placeholder="%{getText('member.add.placeholder.phone')}" />
						<div class="invalid-feedback"><s:text name="member.add.error.tel"/></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-address">
                                <strong>
                                      <%--<s:label value="%{getText('member.label.address')}"  id="address" for="address"  labelposition="left"></s:label>--%>
                                      <s:text name="member.label.address"/>
                                      <i class="fa fa-map-marker" aria-hidden="true"></i>
                                 </strong>
                            </span>
                        </div>
						<s:textfield type="text" required="true" class="form-control" name="userAdding.address" id="address"  placeholder="%{getText('member.add.placeholder.address')}" />
					<div class="invalid-feedback"><s:text name="member.add.error.address"/></div>
					</div>
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <s:radio list="#{'M':''}"  label="%{getText('member.label.gender')}"   id="male" class="form-check-input" type="radio"  name="userAdding.sex" value="M" multiple="false"></s:radio>
                        <label class="form-check-label" for="male"><s:text name="member.label.gender.male"/></label>
                    </div>
                    <div class="form-check">
                        <s:radio label="%{getText('member.label.gender')}" list="#{'F':''}" name="userAdding.sex"  id="female" class="form-check-input" type="radio"  multiple="false"></s:radio>
                        <label class="form-check-label" for="female"><s:text name="member.label.gender.female"/></label>
                    </div>
                    <div class="form-check">
                        <s:checkbox id="isActive"  class="form-check-input" type="checkbox" tooltip="%{getText('member.add.active.tooltip')}" name="userAdding.active" />
                        <label class="form-check-label" for="isActive"><s:text name="member.add.error.active"/></label>
                    </div>
                    <div class="form-check">
                        <s:checkbox id="isAdmin"  class="form-check-input" type="checkbox" tooltip="%{getText('member.add.admin.tooltip')}" name="userAdding.admin"/>
                        <label class="form-check-label" for="isAdmin"><s:text name="member.add.error.admin"/></label>
                    </div>
                    <%--<s:radio label="%{getText('member.label.gender')}" list="#{'F':'  Female','M':'  Male'}" name="userAdding.sex"  class="radio-inline" multiple="false"></s:radio>--%>
                </div>
                <div class="form-group">
                    <s:submit type="button" id="btnRegister" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-save" aria-disabled="true"></i>&nbsp; <s:text name="member.add.register"/></s:submit>
                </div>
            </s:form>
        </div>
        <div>
            <s:if test="hasActionMessages()">
                <script>
                     var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="member.add.success.footer"/></p>';
                     NotificationManager.displayNotification({message:message, type:'success'})
                     FormManager.disableAllFields({idForm:'formRegister'})
                     FormManager.disableBtn({idButton:'btnRegister'})
                </script>
            </s:if>
            <s:if test="hasActionErrors()">
                <script>
                    var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="member.add.error.footer"/></p>';
                    NotificationManager.displayNotification({message:message, type:'error'})
                </script>
            </s:if>
        </div>
    </div>
</div>
</body>
<div class="col">
    <%@ include file = "../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/jquery/jquery-input-mask-phone-number.js"/>"></script>
<script>
    FormManager.validationForm({idForm: 'formRegister',idSubmit:'btnRegister'})
</script>
<script>
    $('#telephone').usPhoneFormat({
        format: '(xxx) xxx-xxxx'
    });
</script>

</html>


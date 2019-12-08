<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sx" uri="/struts-json-tags" %>
<s:include value="../../common/home/include/header.jsp"/>
<s:include value="../../common/home/include/notification-header.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="showNotification" value="%{showNotification}"/>
<sj:head jqueryui="true"/>
</head>
<body class="bg-gradient-primary">
<%@ include file = "../../common/home/include/common-header-top.jsp" %>
<%@ include file="../../common/home/include/common-widgets-infos.jsp"%>
<div class="card shadow mb-4">
        <a href="#addMemberCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
            <div class="card-header"><h6 class="m-0 font-weight-bold text-primary"><s:text name="member.add.title"/></h6></div>
        </a>
    <div class="collapse show" id="addMemberCard">
        <div class="card-body">
            <s:form class="form-login form-horizontal user"  action="addMemberAction" id="formRegister">
                    <div class="md-form">
                        <s:textfield id="userSearchAssociation"  type="text" value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true" />
                        <label for="userSearchAssociation"><s:text name="member.label.association"/></label>
                        <s:hidden name="userAdding.id.associationId" value="%{associationCurrent.id.id}"/>
                        <s:hidden name="userAdding.associationDesc" value="%{associationCurrent.description}"/>
                    </div>
                <div class="md-form"></div>
                <div class="md-form">
                        <s:select
                                tooltip="%{getText('member.add.role.tooltip')}"
                                class="browser-default custom-select form-control select-autocomplete-s2"
                                id="role"
                                list="%{{}}" listKey="id.role"	listValue="%{id.role + '-' + description}"
                                name="userAdding.role"
                                emptyOption="false"
                                headerValue="%{getText('member.add.role.headerValue')}"
                        />
                </div>
                <div class="md-form">
                        <s:textfield required="true" type="text" class="form-control" name="userAdding.id.name" id="name"  placeholder="%{getText('member.add.placeholder.name')}" />
                        <label for="name"><s:text name="member.label.name"/></label>
                        <div class="invalid-feedback"><s:text name="member.add.error.name"/></div>
                </div>
                <div class="md-form">
                        <s:textfield type="text" required="true" class="form-control" name="userAdding.surname" id="surname"  placeholder="%{getText('member.add.placeholder.surname')}" />
                        <label for="surname"><s:text name="member.label.surname"/></label>
                        <div class="invalid-feedback"><s:text name="member.add.error.surname"/></div>
                </div>
                <div class="md-form">
						<s:textfield type="email" required="true" class="form-control" name="userAdding.email" id="email"  pattern="^[^@\s]+@([^@\s]+\.)+[^@\s]+$" placeholder="%{getText('member.add.placeholder.email')}" />
                        <label for="email"><s:text name="member.label.email"/></label>
                        <div class="invalid-feedback"><s:text name="member.add.error.mail"/></div>
                </div>
                <div class="md-form">
						<s:textfield type="tel" required="true" class="form-control" name="userAdding.phone" id="telephone" maxlength="14" placeholder="%{getText('member.add.placeholder.phone')}" />
                        <label for="telephone"><s:text name="member.label.phone"/></label>
                        <div class="invalid-feedback"><s:text name="member.add.error.tel"/></div>
                </div>
                <div class="md-form">
                    <s:textfield type="text" required="true" class="form-control" name="userAdding.address" id="address"  placeholder="%{getText('member.add.placeholder.address')}" />
					 <label for="address"><s:text name="member.label.address"/></label>
                    <div class="invalid-feedback"><s:text name="member.add.error.address"/></div>
                </div>
                <div class="row">
                    <div class="form-sm col-sm-1">
                        <div class="custom-control custom-checkbox small">
                            <s:radio list="#{'M':''}"  label="%{getText('member.label.gender')}"   id="male" class="form-check-input" type="radio"  name="userAdding.sex" value="M" multiple="false"></s:radio>
                            <label for="male"><s:text name="member.label.gender.male"/></label>
                        </div>
                    </div>
                    <div class="form-sm col-sm-1">
                        <div class="custom-control custom-checkbox small">
                            <s:radio label="%{getText('member.label.gender')}" list="#{'F':''}" name="userAdding.sex"  id="female" class="form-check-input" type="radio"  multiple="false"></s:radio>
                            <label  for="female"><s:text name="member.label.gender.female"/></label>
                        </div>
                    </div>
                    <div class="form-sm col-sm-2">
                        <div class="custom-control custom-checkbox small">
                            <s:checkbox id="isActive"  class="custom-control-input"  tooltip="%{getText('member.add.active.tooltip')}" name="userAdding.active" />
                            <label class="form-check-label custom-control-label" for="isActive"><s:text name="member.add.error.active"/></label>
                        </div>
                    </div>
                    <div class="form-sm col-sm-2">
                        <div class="custom-control custom-checkbox small">
                            <s:checkbox id="isAdmin"  class="custom-control-input" tooltip="%{getText('member.add.admin.tooltip')}" name="userAdding.admin"/>
                            <label class="form-check-label custom-control-label" for="isAdmin"><s:text name="member.add.error.admin"/></label>
                        </div>
                    </div>
                            <%--<s:radio label="%{getText('member.label.gender')}" list="#{'F':'  Female','M':'  Male'}" name="userAdding.sex"  class="radio-inline" multiple="false"></s:radio>--%>
                    </div>
                <div class="md-form">
                    <s:submit type="button" id="btnRegister" disabled="true"  class="btn  btn-md btn-login-button btn-outline-primary waves-effect save-btn"><i class="fa fa-user-plus" aria-disabled="true"></i>&nbsp; <s:text name="common.label.add"/></s:submit>
                </div>
            </s:form>
        </div>
        </div>
        <div>
            <s:if test="hasActionMessages()">
                <script>
                     var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="member.add.success.footer"/></p>';
                     NotificationManager.displayNotification({message:message, type:'success'})
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
<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/jquery/jquery-input-mask-phone-number.js"/>"></script>
<%@ include file = "../../common/footers/select2-footer.js.jsp" %>
<script>
	var lng='<s:property  value="%{#lang}" />';
    FormManager.validationForm({idForm: 'formRegister',idSubmit:'btnRegister'})
	Select2Manager.autocomlete({lang:lng,idForm:'formRegister', type:'role', url:"autocompleteRole.do"});
</script>
<script>
    $('#telephone').usPhoneFormat({
        format: '(xxx) xxx-xxxx'
    });
</script>

</body>


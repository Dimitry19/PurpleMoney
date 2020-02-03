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
    <a href="#addEventCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
        <div class="card-header"><h6 class="m-0 font-weight-bold text-primary"><s:text name="event.add.title"/></h6></div>
    </a>
    <div class="collapse show" id="addEventCard">
        <div class="card-body">
            <s:form class="form-login form-horizontal user" action="addEvent" id="formEventAdd">
                <div class="md-form">
                        <s:textfield id="userSearchAssociation"   value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true" />
                        <label for="userSearchAssociation"><s:text name="member.label.association"/></label>
                        <s:hidden name="user.admin" value="%{userInfo.admin}"/>
                        <s:hidden  name="user.association" value="%{userInfo.id.memberId}" />
                        <s:hidden  name="user.active" value="%{userInfo.active}" />
                        <s:hidden  name="event.associationId" value="%{associationCurrent.id.id}" />
                </div>
                <div class="md-form">
                    <label for="membersNames"><s:text name="member.label.name"/></label>
                    <s:select
                            tooltip="%{getText('common.login.association.tooltip')}"
                            class="browser-default custom-select form-control select-autocomplete-s2"  data-live-search="true"
                            id="membersNames"
                            list="%{{}}" listKey="id.name"	listValue="%{id.name}"
                            name="event.member"
                            emptyOption="true"
                            headerValue="%{getText('common.login.group.tooltip')}"
                        />
                    <s:hidden  name="event.member" />
                </div>
                 <div class="md-form">
                    <s:textfield id="eventDate" name="event.data"   required="true"   class="form-control"/>
                    <label for="eventDate"><s:text name="common.label.date"/>&nbsp;<i class="fas fa-calendar"></i></label>
                    <div class="invalid-feedback"><s:text name="event.date.error"/></div>
                 </div>
                <label for="eventType"> <s:text name="common.event.type"/></label>
                <div class="md-form">
                    <s:select
                            tooltip="%{getText('member.add.role.tooltip')}"
                            class="browser-default custom-select form-control" data-live-search="true" style="padding-left: 45%;"
                            label="EventType"
                            id="eventType"
                            list="eventTypes" listKey="id"	listValue="%{description}"
                            name="event.eventType"
                            emptyOption="false"
                            headerValue="%{getText('member.add.role.headerValue')}"
                    />
                    <s:hidden  name="event.eventType" value="%{description}" />
                </div>
                <div class="md-form">
                    <div class="row">
                        <div class="col-md-12">
                            <s:submit type="button" id="btnAddEvent" disabled="true"  class="btn  btn-md btn-login-button btn-outline-primary waves-effect save-btn"><i class="fa fa-plus" aria-disabled="true"></i>&nbsp; <s:text name="member.add.register"/></s:submit>
                        </div>
                    </div>
                </div>
            </s:form>
        </div>
    </div>
</div>
<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/dataPickerManager.js"/>"></script>
<%@ include file = "../../common/footers/select2-footer.js.jsp" %>

<script>
	FormManager.validationForm({idForm: 'formEventAdd',idSubmit:'btnAddEvent'})
	var lng='<s:property  value="%{#lang}" />';
	DataPickerManager.enable({id: 'eventDate',lang:lng})
	FormManager.blockResendForm()
	Select2Manager.autocomlete({lang:lng,idForm:'formEventAdd', button:'btnAddEvent',type:'member', url:"autocompleteMember.do"});
</script>
</body>


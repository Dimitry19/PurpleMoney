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
<s:set var="lang" value="%{currentLocale}"/>
                    <div class="card shadow mb-4">
                        <a href="#addSessionCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                            <div class="card-header"><h6 class="m-0 font-weight-bold text-primary"><s:text name="common.menu.founds.add"/></h6></div>
                        </a>

                        <div class="collapse show" id="addSessionCard">
                            <div class="card-body">
                                <s:form class="form-login form-horizontal user"  action="saveSessionAction" id="formAddSession">
                                    <div class="md-form">
                                        <s:textfield id="userSearchAssociation"  type="text" value="%{associationCurrent.description}" class="form-control" readonly="true" />
                                        <label for="userSearchAssociation"><s:text name="member.label.association"/></label>
                                        <s:hidden name="amountSession.id.associationId" value="%{associationCurrent.id.id}"/>
                                    </div>
                                    <div class="md-form">
                                        <div class="md-form">
                                            <label for="membersNames"><s:text name="member.column.name"/></label>
                                        </div>
                                        <s:select
                                                tooltip="%{getText('common.login.association.tooltip')}"
                                                class="browser-default custom-select form-control"  data-live-search="true"
                                                id="membersNames"
                                                list="members" listKey="id.name"	listValue="%{id.name}"
                                                name="amountSession.membre.id.name"
                                                emptyOption="true"
                                                headerValue="%{getText('common.login.group.tooltip')}"/>
                                        <s:hidden  name="amountSession.membre.id.name" />
                                    </div>
                                    <div class="md-form">
                                        <s:textfield id="amountSession" name="amountSession.amount" value="%{associationCurrent.amount}" required="true"  type="number"  pattern="^\d+(\.\d{1,2})?$" readonly="true" class="form-control"/>
                                        <label for="amountSession"><s:text name="session.label.amount"/>&nbsp;<i class="fas fa-euro-sign"></i></label>
                                        <div class="invalid-feedback"><s:text name="session.money.error"/></div>
                                    </div>
                                    <div class="md-form">
                                        <s:textfield id="dateSession" name="amountSession.id.date"   required="true"   class="form-control"/>
                                        <label for="dateSession"><s:text name="common.label.date"/>&nbsp;<i class="fas fa-calendar"></i></label>
                                        <div class="invalid-feedback"><s:text name="session.date.error"/></div>
                                    </div>
                                    <div class="md-form">
                                        <div class="custom-control custom-checkbox small">
                                            <s:checkbox id="status"  class="custom-control-input"   name="amountSession.status"/>
                                            <label class="form-check-label custom-control-label" for="status"><s:text name="session.benef"/></label>
                                        </div>
                                    </div>
                                    <s:submit type="button" id="btnAddAmount" class="btn btn-outline-primary waves-effect"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; <s:text name="session.add.adding"/></s:submit>

                                </s:form>
                            </div>
                            <div>
                                <s:if test="%{#lang}==true">
                                    <s:if test="hasActionMessages()">
                                        <script>
                                            var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="session.add.success"/></p>';
                                            NotificationManager.displayNotification({message:message, type:'success'})
                                        </script>
                                    </s:if>
                                    <s:if test="hasActionErrors()">
                                        <script>
                                            var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="session.add.error"/></p>';
                                            NotificationManager.displayNotification({message:message, type:'error'})
                                        </script>
                                    </s:if>
                                </s:if>
                            </div>
                        </div>
                    </div>
<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/dataPickerManager.js"/>"></script>

<script>
	FormManager.validationForm({idForm: 'formAddAmount',idSubmit:'btnAddAmount'})
	var lng='<s:property  value="%{#lang}" />';
	DataPickerManager.enable({id: 'dateSession',lang:lng})
</script>
</body>



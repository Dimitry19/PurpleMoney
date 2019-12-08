<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:include value="../../common/home/include/header.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="showNotification" value="%{showNotification}"/>
<sj:head jqueryui="true" />
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
                                        <s:textfield id="userSessionAssociation"  type="text" value="%{associationCurrent.description}" class="form-control" readonly="true" />
                                        <label for="userSessionAssociation"><s:text name="member.label.association"/></label>
                                        <s:hidden name="amountSession.id.associationId" value="%{associationCurrent.id.id}"/>
                                    </div>
                                    <div class="md-form">
                                        <s:select
                                                tooltip="%{getText('common.login.association.tooltip')}"
                                                class="browser-default custom-select form-control select-autocomplete-s2"  data-live-search="true"
                                                id="membersNames"
                                                list="%{{}}" listKey="id.name"	listValue="%{id.name}"
                                                name="amountSession.mmember.id.name"
                                                headerValue="%{getText('common.login.group.tooltip')}"
                                        />
                                        <s:hidden  name="amountSession.mmember.id.name" />
                                    </div>
                                    <div class="md-form">
                                        <s:textfield id="amountSession" name="amountSession.amount" value="%{associationCurrent.amount}" required="true"  type="number"  pattern="^\d+(\.\d{1,2})?$" readonly="true" class="form-control"/>
                                        <label for="amountSession"><s:text name="session.label.amount"/>&nbsp;<i class="fas fa-euro-sign"></i></label>
                                        <div class="invalid-feedback"><s:text name="session.money.error"/></div>
                                    </div>
                                    <div class="md-form">
                                        <s:textfield id="dateSession" name="amountSession.id.date"   required="true"   onchange=" FormManager.enableBtn({idButton:'btnAddSession',idField:'membersNames'})" class="form-control"/>
                                        <label for="dateSession"><s:text name="common.label.date"/>&nbsp;<i class="fas fa-calendar"></i></label>
                                        <div class="invalid-feedback"><s:text name="session.date.error"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="form-sm col-sm-1">
                                            <div class="custom-control custom-checkbox small">
                                                <s:radio   list="#{'P':''}"  label="%{getText('session.add.presence')}"   id="presence" class="form-check-input" type="radio"  name="amountSession.frequence" value="P" multiple="false"></s:radio>
                                                <label for="presence"><s:text name="session.add.presence"/></label>
                                            </div>
                                        </div>
                                        <div class="form-sm col-sm-1">
                                            <div class="custom-control custom-checkbox small">
                                                <s:radio  list="#{'A':''}"  label="%{getText('session.add.presence')}"   id="absence" class="form-check-input" type="radio"  name="amountSession.frequence" value="P" multiple="false"></s:radio>
                                                <label for="absence"><s:text name="session.add.absence"/></label>
                                            </div>
                                        </div>
                                        <div class="form-sm col-sm-4">
                                            <div class="custom-control custom-checkbox small">
                                                <s:checkbox id="status"  class="custom-control-input"   name="amountSession.status"/>
                                                <label class="form-check-label custom-control-label" for="status"><s:text name="session.benef"/></label>
                                            </div>
                                        </div>
                                    </div>
                                    <s:submit type="button" id="btnAddSession" disabled="true"  class="btn  btn-md btn-login-button btn-outline-primary waves-effect save-btn"><i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp; <s:text name="common.label.add"/></s:submit>
                                </s:form>
                            </div>
                            <div id="dialog" title="Basic dialog">
                            </div>
                            <div>
                                <s:if test="%{#lang}==true">
                                    <s:if test="hasActionMessages()">
                                        <script>
                                            var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="session.add.success"/></p>';
                                            NotificationManager.displayNotification({message:message, type:'success'})
                                            FormManager.disableBtn({idButton:'btnAddSession'})
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
<%--<script src="<s:url value="/common/js/jquery-ui1.12.1.js"/>"></script>
<script src="<s:url value="/common/js/jquery-1.12.4.js"/>"></script>--%>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/dataPickerManager.js"/>"></script>
<%@ include file = "../../common/footers/select2-footer.js.jsp" %>


<script>
	var lng='<s:property  value="%{#lang}" />';
	FormManager.validationForm({idForm: 'formAddAmount',idSubmit:'btnAddSession'})
	DataPickerManager.enable({id: 'dateSession',lang:lng,alternate:'d'});
	Select2Manager.autocomlete({lang:lng,idForm:'formAddSession', button:'btnAddSession',type:'member', url:"autocompleteMember.do"});
</script>
</body>



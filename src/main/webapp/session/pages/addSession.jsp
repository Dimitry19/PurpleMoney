<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="showNotification" value="%{showNotification}"/>
<sj:head locale="%{#lang}"  jquerytheme="ui-lightness" jqueryui="true" />
</head>
<body>
<%@ include file="../../common/home/include/header-logo.jsp" %>
<%@ include file="../../common/menu/menu.jsp" %>
<div class="container text-center">
    <s:if test="hasActionErrors()">
        <div class="fieldError">
            <s:actionerror escape="false"/>
        </div>
    </s:if>
	<div class="card card-perso">
		<div class="card-header">
			<h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="common.menu.founds.add"/></h1>
		</div>
		<div class="card-body">
			<s:form class="form-horizontal"  action="saveSessionAction" id="formAddSession">
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
						<s:hidden name="amountSession.id.associationId" value="%{associationCurrent.id.id}"/>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-member">
                                <strong>
                                    <s:text name="member.label.name"/>
                                   <i class="fa fa-user" aria-hidden="true"></i>
                                 </strong>
                            </span>
						</div>
							<s:url var="memberURL" action="autocompleteMember"/>
							<sj:autocompleter id="membersNames"
												  name="amountSession.membre.id.name"
												  href="%{memberURL}"
												  loadMinimumCount="2"
												  delay="50"
												  cssClass="custom-select"
												  onCompleteTopics="onCompleteLoading"
								/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-amount">
                                <strong>
                                    <s:text name="session.label.amount"/>
                                   <i class="fa fa-money" aria-hidden="true"></i>
                                 </strong>
                            </span>
                        </div>
                        <s:textfield name="amountSession.amount"   value="%{associationCurrent.amount}" required="true"  type="number"  pattern="^\d+(\.\d{1,2})?$" readonly="true" class="form-control"/>
                        <div class="input-group-append">
                                        <span class="input-group-text">
                                          <i class="fa fa-eur" aria-hidden="true"></i>
                                        </span>
                        </div>
                        <div class="invalid-feedback"><s:text name="session.money.error"/></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-date">
                                <strong>
                                    <s:text name="common.label.date"/>
                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                 </strong>
                            </span>
                        </div>
                        <sj:datepicker
                                id="sessionData"
                                name="amountSession.id.date"
                                parentTheme="bootstrap4"
                                tooltip="Date"
                                cssClass="form-control"
                                elementCssClass="col-sm-3"
                                showOn="focus"
                                label="%{getText('common.label.date')}"
                                displayFormat="dd/mm/yy"
                                minDate="%{new java.sql.Date()}"
                                inputAppendIcon="calendar"
                        />
                        <div class="invalid-feedback"><s:text name="session.date.error"/></div>
                    </div>
                <div class="form-group">
                    <div class="form-check">
                        <s:checkbox id="status"  class="form-check-input" type="checkbox"  name="amountSession.status"/>
                        <label class="form-check-label" for="status"><s:text name="session.benef"/></label>
                    </div>
                </div>
                <div class="form-group ">
                    <s:submit type="button" id="btnAddAmount" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; <s:text name="session.add.adding"/></s:submit>
                </div>
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
</div>
</body>
<div class="col">
	<%@ include file = "../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script>
    FormManager.validationForm({idForm: 'formAddAmount',idSubmit:'btnAddAmount'})
</script>
</html>
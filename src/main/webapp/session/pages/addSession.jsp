<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:include value="../../common/home/include/header.jsp"/>
<s:include value="../../common/home/include/notification-header.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="showNotification" value="%{showNotification}"/>
<sj:head locale="%{#lang}"  jquerytheme="ui-lightness" jqueryui="true" />


</head>
<body class="bg-gradient-primary">
<%@ include file = "../../common/home/include/common-header-top.jsp" %>
<%@ include file="../../common/home/include/common-widgets-infos.jsp"%>
        <div class="container">
                <s:if test="hasActionErrors()">
                    <div class="fieldError">
                        <s:actionerror escape="false"/>
                    </div>
                </s:if>
                <div class="row justify-content-center">
                    <div class="col-xl-10 col-lg-12 col-md-9">
                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <a href="#addSessionCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                        <h6 class="m-0 font-weight-bold text-primary"><s:text name="common.menu.founds.add"/></h6>
                                    </a>
                                </div>
                                <div class="collapse show" id="addSessionCard">
                                    <div class="card-body p-0">
                                        <s:form class="form-login form-horizontal user"  action="saveSessionAction" id="formAddSession">
                                            <div class="form-group">
                                                <s:textfield id="userSearchAssociation"  value="%{associationCurrent.description}" class="form-control form-control-user" readonly="true" />
                                                <s:hidden name="amountSession.id.associationId" value="%{associationCurrent.id.id}"/>
                                            </div>
                                            <div class="form-group">
                                                <s:url var="memberURL" action="autocompleteMember"/>
                                                <sj:autocompleter id="membersNames"
                                                                      name="amountSession.membre.id.name"
                                                                      href="%{memberURL}"
                                                                      loadMinimumCount="2"
                                                                      delay="50"
                                                                      cssClass="custom-select form-control form-control-user"
                                                                      onCompleteTopics="onCompleteLoading"
                                                    />
                                            </div>
                                            <div class="form-group">
                                                <s:textfield name="amountSession.amount"    key="common.login.username" value="%{associationCurrent.amount}" required="true"  type="number"  pattern="^\d+(\.\d{1,2})?$" readonly="true" class="form-control form-control-user"/>
                                                <span class="input-group-text"><i class="fas fa-euro-sign"></i></span>
                                                <div class="invalid-feedback"><s:text name="session.money.error"/></div>
                                            </div>
                                            <div class="form-group">
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
                                                <div class="custom-control custom-checkbox small">
                                                    <s:checkbox id="status"  class="custom-control-input"   name="amountSession.status"/>
                                                    <label class="form-check-label custom-control-label" for="status"><s:text name="session.benef"/></label>
                                                </div>
                                            </div>
                                            <div>
                                                <s:submit type="button" id="btnAddAmount" class="btn btn-sm btn-primary btn-login btn btn-primary btn-user btn-block"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; <s:text name="session.add.adding"/></s:submit>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script>
	FormManager.validationForm({idForm: 'formAddAmount',idSubmit:'btnAddAmount'})
</script>

</body>



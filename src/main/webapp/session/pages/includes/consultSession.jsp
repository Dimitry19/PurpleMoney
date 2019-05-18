<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:include value="../../../common/home/include/commons.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<sj:head locale="%{#lang}"  jquerytheme="smoothness" jqueryui="true" />
<body>
<%@ include file="../../../common/home/include/header-logo.jsp" %>
<%@ include file="../../../common/menu/menu.jsp" %>
<div class="container text-center">
    <div class="card card-perso">
        <div class="card-header">
            <h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="session.consult.title"/></h1>
        </div>
        <div class="card-body">
            <s:form class="form-horizontal"  action="specificSessionAction" id="sessionsViewer">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
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
                                                  name="sessionSearchWr.member.id.name"
                                                  href="%{memberURL}"
                                                  loadMinimumCount="2"
                                                  delay="50"
                                                  cssClass="custom-select-sa"
                                                  onCompleteTopics="onCompleteLoading"
                                    />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon-date-from">
                                                <strong>
                                                    <s:text name="session.consult.from"/>
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                 </strong>
                                            </span>
                                        </div>
                                        <sj:datepicker
                                                id="sessionDataFrom"
                                                name="sessionSearchWr.from"
                                                parentTheme="bootstrap4"
                                                tooltip="Date from"
                                                cssClass="form-control"
                                                elementCssClass="col-sm-3"
                                                showOn="focus"
                                                label="%{getText('session.consult.from')}"
                                                displayFormat="dd/mm/yy"
                                                minDate="%{new java.sql.Date()}"
                                                inputAppendIcon="calendar"
                                        />
                                        <div class="invalid-feedback"><s:text name="session.date.error"/></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon-date-to">
                                                <strong>
                                                    <s:text name="session.consult.to"/>
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                 </strong>
                                            </span>
                                        </div>
                                        <sj:datepicker
                                                id="sessionDataTo"
                                                name="sessionSearchWr.to"
                                                parentTheme="bootstrap"
                                                tooltip="Date To"
                                                cssClass="form-control"
                                                elementCssClass="col-sm-3"
                                                showOn="focus"
                                                label="%{getText('session.consult.to')}"
                                                displayFormat="dd/mm/yy"
                                                minDate="%{new java.sql.Date()}"
                                                inputAppendIcon="calendar"
                                        />
                                        <div class="invalid-feedback"><s:text name="session.date.error"/></div>
                                        <s:hidden id="amountCompId" name="sessionSearchWr.companyId" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_GROUP}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-check">
                                    <s:checkbox id="status"  class="form-check-input" type="checkbox" tooltip="%{getText('session.benef')}" name="sessionSearchWr.status"/>
                                    <label class="form-check-label" for="status"><s:text name="session.benef"/></label>
                                </div>
                            </div>
                        </div>
                     </div>
                <div class="form-group">
                    <s:submit type="button" id="btnSessionSearch" class="btn btn-primary btn-md btn-login-button">
                        <i class="fa fa-search" aria-hidden="true"></i>&nbsp;<s:text name="session.consult.search"/>
                    </s:submit>
                </div>
            </s:form>
            </div>
        </div>
    </div>
</body>
<div class="col">
	<%@ include file = "../../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/dataPickerManager.js"/>"></script>
<script>
    DataPickerManager.enable({id:'fromDate', isBootstrap:false})
    DataPickerManager.enable({id:'toDate', isBootstrap:false})
</script>
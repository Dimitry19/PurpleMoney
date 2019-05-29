<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<sj:head locale="%{#lang}"  jquerytheme="ui-lightness" jqueryui="true" />
<s:head/>
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
 <%--   <s:if test="hasActionMessages()">
        <%@ include file="../../common/pages/notifications/save-program-success.jsp" %>
    </s:if>
    <s:if test="hasActionErrors()">
        <%@ include file="../../common/pages/notifications/save-program-error.jsp" %>
       &lt;%&ndash; <div class="errors-notification">
            <s:actionerror theme="bootstrap"/>
        </div>&ndash;%&gt;
    </s:if>--%>
    <div class="card card-perso">
        <div class="card-header">
            <h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="event.add.title"/></h1>
        </div>
        <div class="card-body">
            <s:form class="form-horizontal"  action="addEvent" id="formEventAdd">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
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
                                <s:hidden name="user.admin" value="%{userInfo.admin}"/>
                                <s:hidden  name="user.association" value="%{userInfo.id.memberId}" />
                                <s:hidden  name="user.active" value="%{userInfo.active}" />
                                <s:hidden  name="event.associationId" value="%{associationCurrent.id.id}" />
                            </div>
                        </div>
                        <div class="col-md-6">
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
                                                  name="event.member"
                                                  href="%{memberURL}"
                                                  loadMinimumCount="2"
                                                  delay="50"
                                                  cssClass="form-control"
                                                  onCompleteTopics="onCompleteLoading"
                                />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">

                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon-date-from">
                                        <strong>
                                            <s:text name="common.label.date"/>
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                         </strong>
                                    </span>
                                </div>
                                <sj:datepicker
                                        id="eventDate"
                                        name="event.data"
                                        parentTheme="bootstrap4"
                                        tooltip="Date"
                                        cssClass="form-control"
                                        elementCssClass="col-sm-3"
                                        showOn="focus"
                                        displayFormat="dd/mm/yy"
                                        inputAppendIcon="calendar"
                                />
                            </div>
                            <div class="invalid-feedback"><s:text name="event.date.error"/></div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon-role">
                                        <strong>
                                             <s:text name="common.event.type"/>
                                           <i class="fa fa-arrows-alt" aria-hidden="true"></i>
                                         </strong>
                                    </span>
                                </div>
                                <s:select
                                        tooltip="%{getText('member.add.role.tooltip')}"
                                        class="browser-default custom-select" data-live-search="true"
                                        label="EventType"
                                        id="eventType"
                                        list="eventTypes" listKey="id"	listValue="%{description}"
                                        name="event.eventType.id"
                                        emptyOption="false"
                                        headerValue="%{getText('member.add.role.headerValue')}"
                                />
                                <s:hidden  name="event.eventType.description" value="%{description}" />
                                <s:hidden  name="event.eventType.language" value="%{#lang}" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">

                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <s:submit type="button" id="btnAdd" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-save" aria-disabled="true"></i>&nbsp; <s:text name="member.add.register"/></s:submit>
                        </div>
                    </div>
                </div>
            </s:form>
        </div>
    </div>
</div>
</body>
<div class="col">
    <%@ include file = "../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script>
    FormManager.validationForm({idForm:'formEventAdd',idSubmit:'btnAdd'})
</script>
</html>


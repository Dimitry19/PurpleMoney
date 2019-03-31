<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
<sj:head locale="it" jquerytheme="ui-lightness" jqueryui="true" />
</head>
<body>
<%@ include file="../../common/home/include/header-logo.jsp" %>
<%@ include file="../../common/menu/menu.jsp" %>
<s:set var="lang" value="%{currentLocale}"/>
<div class="container text-center">
    <s:if test="hasActionMessages()">
        <%@ include file="../../common/pages/notifications/save-program-success.jsp" %>
    </s:if>
    <s:if test="hasActionErrors()">
        <%@ include file="../../common/pages/notifications/save-program-error.jsp" %>
       <%-- <div class="errors-notification">
            <s:actionerror theme="bootstrap"/>
        </div>--%>
    </s:if>
    <div class="card card-perso">
        <div class="card-header">
            <h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="event.add.title"/></h1>
        </div>
        <div class="card-body">
            <s:form class="form-horizontal"  action="addEvent" id="formEventRegister">
                <div class="form-group">
                    <s:label value="%{getText('member.label.association')}" id="idnameadd" for="idnameadd"  labelposition="left"></s:label>
                    <div class="input-group">
                        <s:textfield id="userSearchAssociation"   value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true" />
                        <s:hidden name="event.member" value="%{userInfo.id.memberId}"/>
                        <s:hidden name="user.admin" value="%{userInfo.admin}"/>
                        <s:hidden  name="user.association" value="%{userInfo.id.memberId}" />
                        <s:hidden  name="user.active" value="%{userInfo.active}" />
                    </div>
                </div>
                <div class="form-group">
                    <s:label value="%{getText('member.label.name')}" id="idnamesearch" for="idnamesearch"  labelposition="left"></s:label>
                    <div class="input-group">
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
                <div class="form-group">
                        <div class="col-sm-3 controls">
                            <s:label value="%{getText('common.label.date')}" id="eventDate" class="control-label"  for="eventDate"  labelposition="left"></s:label>
                            <i class="fa fa-calendar" aria-hidden="true"></i>
                        </div>
                        <div class="input-group">
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
                        <div class="invalid-feedback"><s:text name="amount.date.error"/></div>
                </div>
                <div class="form-group">
                    <s:submit type="button" id="btnRegister" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-save" aria-disabled="true"></i>&nbsp; <s:text name="member.add.register"/></s:submit>
                </div>
            </s:form>
        </div>
    </div>
</div>
</body>
<div class="col">
    <%@ include file = "../../common/footers/footer.jsp" %>
</div>
</html>


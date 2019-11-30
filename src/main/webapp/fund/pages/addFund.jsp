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
<%@ include file="../../common/home/include/common-header-top.jsp" %>
<%@ include file="../../common/home/include/common-widgets-infos.jsp" %>
<div class="card shadow mb-4">
    <a href="#addFundCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true"
       aria-controls="collapseCardExample">
        <div class="card-header"><h6 class="m-0 font-weight-bold text-primary"><s:text name="fund.add.title"/></h6>
        </div>
    </a>
    <div class="collapse show" id="addFundCard">
        <div class="card-body">
            <s:form class="form-login form-horizontal user" action="addFundAction" id="formRegisterFund">
                <div class="md-form">
                    <s:textfield id="userSearchAssociation" type="text" value="%{associationCurrent.description}"
                                 class="form-control form-control-login" readonly="true"/>
                    <label for="userSearchAssociation"><s:text name="member.label.association"/></label>
                    <s:hidden name="fund.associationId" value="%{associationCurrent.id.id}"/>

                </div>
                <div class="md-form"></div>
                <div class="md-form">
                    <s:select
                            tooltip="%{getText('common.login.association.tooltip')}"
                            class="browser-default custom-select form-control select-autocomplete-s2"
                            data-live-search="true"
                            id="membersNames"
                            list="%{{}}" listKey="id.name" listValue="%{id.name}"
                            name="fund.id.mmember"
                            emptyOption="true"
                            headerValue="%{getText('common.login.group.tooltip')}"
                    />
                    <s:hidden name="fund.id.mmember"/>
                </div>
                <div class="md-form">
                    <s:textfield id="amountFund" name="fund.amount" value="%{associationCurrent.amount}"
                                 required="true" type="number"
                                 onchange="FundManager.calcolateAmountToBack(this,{taxLoan:'taxLoan', totalLoan:'totalLoan'})"
                                 pattern="^\d+(\.\d{1,2})?$" class="form-control"/>
                    <label for="amountFund"><s:text name="session.label.amount"/>&nbsp;<i class="fas fa-euro-sign"></i></label>
                    <div class="invalid-feedback"><s:text name="session.money.error"/></div>
                </div>
                <div class="row">
                    <div class="md-form form-sm col-sm-6">
                        <s:textfield id="dateFund" name="fund.date" required="true" class="form-control"/>
                        <label for="dateFund"><s:text name="fund.column.date.add"/>&nbsp;<i
                                class="fas fa-calendar"></i></label>
                        <div class="invalid-feedback"><s:text name="session.date.error"/></div>
                    </div>
                    <div class="md-form form-sm col-sm-6">
                        <s:textfield id="alternate-dateFund" size="30" readonly="true" class="form-control"/>
                    </div>
                </div>
                <div class="md-form">
                    <s:submit type="button" id="btnRegisterFund" disabled="false"
                              class="btn  btn-md btn-login-button btn-outline-primary waves-effect save-btn"><i
                            class="fa fa-save" aria-disabled="true"></i>&nbsp; <s:text
                            name="member.add.register"/></s:submit>
                </div>
            </s:form>
        </div>
        <div id="dialog" title="Basic dialog">
            <p><s:text name="session.add.member.error"/></p>
        </div>
    </div>
    <div>
        <s:if test="%{#lang}==true">
            <s:if test="hasActionMessages()">
                <script>
					var message = '<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="loan.add.success"/></p>';
					NotificationManager.displayNotification({message: message, type: 'success'})
					FormManager.disableBtn({idButton: 'btnRegisterFund'})
                </script>
            </s:if>
            <s:if test="hasActionErrors()">
                <script>
					var message = '<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="loan.add.error"/></p>';
					NotificationManager.displayNotification({message: message, type: 'error'})
                </script>
            </s:if>
        </s:if>
    </div>
</div>
<%@ include file="../../common/home/include/common-header-bottom.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%--<script src="<s:url value="/common/js/jquery-ui1.12.1.js"/>"></script>
<script src="<s:url value="/common/js/jquery-1.12.4.js"/>"></script>--%>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/dataPickerManager.js"/>"></script>
<script src="<s:url value="/loan/js/LoanManager.js"/>"></script>
<%@ include file="../../common/footers/select2-footer.js.jsp" %>
<script>
	var lng = '<s:property  value="%{#lang}" />';
	FormManager.validationForm({idForm: 'formRegisterLoan', idSubmit: 'btnRegisterLoan'})
	DataPickerManager.enable({id: 'dateLoan', lang: lng, alternate: 'alternate-dateLoan'});
	DataPickerManager.enable({id: 'dateLoanRemb', lang: lng, alternate: 'alternate-dateLoanRemb'});
	Select2Manager.autocomlete({lang: lng, idForm: 'formRegisterLoan', button:'btnRegisterLoan',type: 'member', url: "autocompleteMember.do"});

</script>
</body>


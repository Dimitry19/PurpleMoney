<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
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
    <a href="#addLoanCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true"
       aria-controls="collapseCardExample">
        <div class="card-header"><h6 class="m-0 font-weight-bold text-primary"><s:text name="loan.add.title"/></h6>
        </div>
    </a>
    <div class="collapse show" id="addLoanCard">
        <div class="card-body">
            <s:form class="form-login form-horizontal user" action="addLoanAction" id="formRegisterLoan">
                <div class="md-form">
                    <s:textfield id="userLoanAssociation" type="text" value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true"/>
                    <label for="userLoanAssociation"><s:text name="member.label.association"/></label>
                    <s:hidden name="loan.id.associationId" value="%{associationCurrent.id.id}"/>
                    <s:hidden name="loan.mmember.id.associationId"/>
                   <%-- <s:hidden name="loan.association.id.name" value="%{associationCurrent.description}"/>
                    <s:hidden name="loan.association.description" value="%{associationCurrent.description}"/>
                    <s:hidden name="loan.association.amount" value="%{associationCurrent.amount}"/>--%>
                </div>
                <div class="md-form"></div>
                <div class="md-form">
                    <s:select
                            tooltip="%{getText('common.login.association.tooltip')}"
                            class="browser-default custom-select form-control select-autocomplete-s2"
                            data-live-search="true"
                            id="membersNames"
                            list="%{{}}" listKey="id.name" listValue="%{id.name}"
                            name="loan.id.mmember"
                            emptyOption="true"
                            headerValue="%{getText('common.login.group.tooltip')}"
                    />
                    <s:hidden name="loan.mmember.id.name"/>

                </div>
                <div class="md-form">
                    <s:textfield id="amountLoan" name="loan.amount" value="%{associationCurrent.amount}" required="true" type="number" onchange="LoanManager.calcolateAmountToBack(this,{taxLoanId:'taxLoan', totalLoanName:'loan.amountToBack'})" pattern="^\d+(\.\d{1,2})?$" class="form-control"/>
                    <label for="amountLoan"><s:text name="session.label.amount"/>&nbsp;<i class="fas fa-euro-sign"></i></label>
                    <div class="invalid-feedback"><s:text name="session.money.error"/></div>
                </div>
                <div class="row">
                    <div class="md-form form-sm col-sm-6">
                        <s:textfield id="dateLoan" name="loan.loanDate" required="true" class="form-control"/>
                        <label for="dateLoan"><s:text name="loan.column.date.start"/>&nbsp;<i class="fas fa-calendar"></i></label>
                        <div class="invalid-feedback"><s:text name="session.date.error"/></div>
                    </div>
                    <div class="md-form form-sm col-sm-6">
                        <s:textfield id="alternate-dateLoan" size="30" readonly="true" class="form-control"/>
                    </div>
                </div>
                <div class="row">
                    <div class="md-form form-sm col-sm-6">
                        <s:textfield id="dateLoanRemb" name="loan.loanDateRemb" required="true" class="form-control"/>
                        <label for="dateLoanRemb"><s:text name="loan.column.date.remb"/>&nbsp;<i class="fas fa-calendar"></i></label>
                        <div class="invalid-feedback"><s:text name="session.date.error"/></div>
                    </div>
                    <div class="md-form form-sm col-sm-6">
                        <s:textfield id="alternate-dateLoanRemb" size="30" readonly="true" class="form-control"/>
                    </div>
                </div>
                <div class="md-form">
                    <s:textfield id="taxLoan" name="loan.tax" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_TAX_NUMBER}" required="true" type="number" pattern="^\d+(\.\d{1,2})?$" readonly="true" class="form-control"/>
                    <label for="taxLoan"><s:text name="loan.column.tax"/>&nbsp;<i class="fa fa-percent"></i></label>
                </div>
                <div class="md-form">
                    <s:textfield id="totalLoan" name="loan.amountToBack"  value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_AMOUNT_LOAN_TO_BACK}" disabled="true" type="text" class="form-control"/>
                    <label for="totalLoan"><s:text name="loan.column.amount.to.back"/>&nbsp;<i class="fas fa-euro-sign"></i></label>
                </div>
                <div class="row">
                    <div class="form-sm col-sm-2">
                        <div class="custom-control custom-checkbox small">
                            <s:checkbox id="isExtended" class="custom-control-input" onclick="FormManager.checkboxClick(this,{id:'isBalanced'});" tooltip="%{getText('member.add.active.tooltip')}" name="loan.extended"/>
                            <label class="form-check-label custom-control-label" for="isExtended"><s:text name="loan.column.extended"/></label>
                        </div>
                    </div>
                    <div class="form-sm col-sm-2">
                        <div class="custom-control custom-checkbox small">
                            <s:checkbox id="isBalanced" class="custom-control-input"  onclick="FormManager.checkboxClick(this,{id:'isExtended'});" tooltip="%{getText('member.add.admin.tooltip')}" name="loan.balanced"/>
                            <label class="form-check-label custom-control-label" for="isBalanced"><s:text name="loan.column.balance"/></label>
                        </div>
                    </div>
                </div>
                <%--<div class="md-form"></div>--%>
                <s:submit type="button" id="btnRegisterLoan" disabled="true" class="btn  btn-md btn-login-button btn-outline-primary waves-effect save-btn"><i class="fa fa-plus-square" aria-disabled="true"></i>&nbsp; <s:text name="common.label.add"/></s:submit>
            </s:form>
        </div>
       <%-- <div id="dialog" title="Basic dialog">
            <p><s:text name="session.add.member.error"/></p>
        </div>--%>
    </div>
    <div>
        <s:if test="hasActionMessages()">
            <script>
                var message ='<p><s:text name="loan.add.success"/></p><span class="icon icon-check"><i class="fa fa-bell" aria-hidden="true"></i></span>';
                NotificationManager.displayNotification({message: message, type: 'success'})
                FormManager.disableBtn({idButton: 'btnRegisterLoan'})
            </script>
        </s:if>
        <s:if test="hasActionErrors()">
            <script>
                var message = '<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="loan.add.error"/></p>';
                NotificationManager.displayNotification({message: message, type: 'error'})
            </script>
        </s:if>
    </div>
</div>
<%@ include file="../../common/home/include/common-header-bottom.jsp" %>
<%@ include file="../../common/home/include/common-jquery-ui-widget.jsp" %>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/dataPickerManager.js"/>"></script>
<script src="<s:url value="/loan/js/LoanManager.js"/>"></script>
<%@ include file="../../common/footers/select2-footer.js.jsp" %>
<script>
	var lng = '<s:property  value="%{#lang}" />';
	FormManager.validationForm({idForm: 'formRegisterLoan', idSubmit: 'btnRegisterLoan'})
	FormManager.onChecked({id: 'isBalanced'})
	FormManager.blockResendForm()
	DataPickerManager.init({idFrom: 'dateLoan',idTo: 'dateLoanRemb', lang: lng, alternateFrom: 'alternate-dateLoan',alternateTo: 'alternate-dateLoanRemb'})
	Select2Manager.autocomlete({lang: lng, idForm: 'formRegisterLoan', button:'btnRegisterLoan',type: 'member', url: "autocompleteMember.do"});

</script>
</body>


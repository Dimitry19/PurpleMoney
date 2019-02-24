<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/commons.jsp"/>
<body>
<%@ include file="../../../common/home/include/header-logo.jsp" %>
<%@ include file="../../../common/menu/menu.jsp" %>
<div class="container text-center">
    <div class="card card-perso">
        <div class="card-header">
            <h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="amount.consult.title"/></h1>
        </div>
        <div class="card-body">
                <s:form class="form-horizontal"  action="specificAmountAction" id="amountViewer">
                    <div class="form-group row">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <s:select
                                            class="selectpicker" data-live-search="true"
                                            listCssStyle="custom-select"
                                            tooltip="Choisir le beneficiaire"
                                            label="Beneficiaire"
                                            id="member" list="members" listKey="id.name" listValue="%{id.name + ' ' + surname}"
                                            name="amountSearchWr.receiver.id.name"
                                            emptyOption="false"
                                            headerKey="None"
                                            headerValue="---------- Selectionner le beneficiaire ----------"/>
                                    <s:hidden id="memberId" name="amountSearchWr.receiver.id.memberId" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_GROUP}"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <s:label value="De" id="from" for="from"  labelposition="left"></s:label>
                                    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>
                                        <s:textfield name="amountSearchWr.from" lengthSuffix="xlarge" type="text" id="fromDate"/>
                                    </span>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <s:label value="A:" id="to" for="to"  labelposition="left"></s:label>
                                    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>
                                        <s:textfield name="amountSearchWr.to" lengthSuffix="xlarge" type="text"  id='toDate'/>
                                        <s:hidden id="amountCompId" name="amountSearchWr.companyId" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_GROUP}"/>
                                    </span>
                                </div>
                            </div>
                </div>
                <div class="form-group">
                    <s:submit type="button" id="btnRegister" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-search" aria-hidden="true"></i>&nbsp; <s:text name="amount.consult.search"/></s:submit>
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
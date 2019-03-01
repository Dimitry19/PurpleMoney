<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
<body>
<%@ include file="../../common/home/include/header-logo.jsp" %>
<%@ include file="../../common/menu/menu.jsp" %>
<div class="container text-center">
	<div class="card card-perso">
		<div class="card-header">
			<h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="common.menu.founds.add"/></h1>
		</div>
		<div class="card-body">
			<s:form class="form-horizontal"  action="saveSessionAction" id="formAddSession">
					<div class="form-group">
						<div class="input-group">
							<s:select
									tooltip="Choisir le groupe"
									class="selectpicker" data-live-search="true"
									listCssStyle="custom-select"
									label="Groupe"
									id="sess"
									list="sessions" listKey="id"	listValue="%{description}"
									name="amountSession.id.associationId"
									emptyOption="false"
									headerKey=""
									required=" "
									headerValue="---------- Select association ----------"/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<s:select
								class="selectpicker" data-live-search="true"
								listCssStyle="custom-select"
								tooltip="Choisir le membre"
								label="Membre"
								id="member" list="members" listKey="id.name" listValue="%{id.name + ' ' + surname}"
								name="amountSession.id.member"
								emptyOption="false"
								headerKey=""
								onchange="FormManager.fillField({val:this.value,selectId:'member'})"
								headerValue="---------- Selectionner le membre ----------"/>

							<%--<s:hidden id="amountCompId" name="amountSession.member.id.memberId" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_GROUP}"/>--%>
							<s:hidden id="aMember" name="amountSession.id.member"/>

						</div>
					</div>
			  		<div class="form-group">
						<div class="row">
							<s:label value="Montant:" id="montant" for="montant"  labelposition="left"></s:label>
							<%--<span class="input-group-addon"><i class="fa fa-money" aria-hidden="true"></i>--%>
						</div>
						<div class="row">
							<div class="col-md-4">
							</div>
							<div class="col-md-4">
								<s:textfield name="amountSession.amount"   required="true"  type="number"  pattern="^\d+(\.\d{1,2})?$" tooltip="Entrez un montant valide" class="form-control"/>
							</div>
								<div class="col-md-1 montant-symbol"><i class="fa fa-eur" aria-hidden="true"></i></div>
							<div class="invalid-feedback"><s:text name="amount.money.error"/></div>
						</span>
						</div>
					</div>
					<div class="form-group">
						<s:label value="Date de cotisation:" id="aDate" for="aDate"  labelposition="left"></s:label>
						<span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>
							<s:textfield name="amountSession.id.date" required="true"    value="%{getText('format.date',{amount.id.date})}"  id="sessionDate"/>
							<div class="invalid-feedback"><s:text name="amount.date.error"/></div>
						</span>
					</div>
					<div class="form-group ">
						<s:submit type="button" id="btnAddSession" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; <s:text name="amount.add.adding"/></s:submit>
					</div>
				</s:form>
		</div>
		<div class="card-footer bg-transparent"></div>
	</div>
</div>
</body>
<div class="col">
	<%@ include file = "../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/common/js/dataPickerManager.js"/>"></script>
<script>
    FormManager.validationForm({idForm: 'formAddSession',idSubmit:'btnAddSession'})
    DataPickerManager.enable({id:'sessionDate', isBootstrap:false})
</script>
</html>
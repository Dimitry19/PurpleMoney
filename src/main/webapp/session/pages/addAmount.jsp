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
			<s:form class="form-horizontal"  action="saveAmountAction" id="formAddAmount">
					<div class="form-group">
						<div class="input-group">
							<s:select
									tooltip="Choisir le groupe"
									class="selectpicker" data-live-search="true"
									listCssStyle="custom-select"
									label="Groupe"
									id="sex"
									list="groups" listKey="id"	listValue="%{description}"
									name="amount.id.amountId"
									emptyOption="false"
									headerKey="None"
									required=" "
									headerValue="---------- Selectionnez Groupe ----------"/>
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
								name="amount.member.id.name"
								emptyOption="false"
								headerKey="None"
								onchange="FormManager.fillField({val:this.value,selectId:'member'})"
								headerValue="---------- Selectionner le membre ----------"/>
							<s:hidden id="amountCompId" name="amount.member.id.memberId" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_GROUP}"/>
							<s:hidden id="aMember" name="amount.id.member"/>

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
								<s:textfield name="amount.amount"   required="true"  type="number"  pattern="^\d+(\.\d{1,2})?$" tooltip="Entrez un montant valide" class="form-control"/>
							</div>
								<div class="col-md-1 montant-symbol"><i class="fa fa-eur" aria-hidden="true"></i></div>
							<div class="invalid-feedback"><s:text name="amount.money.error"/></div>
						</span>
						</div>
					</div>
					<div class="form-group">
						<s:label value="Date de cotisation:" id="aDate" for="aDate"  labelposition="left"></s:label>
						<span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>
							<s:textfield name="amount.id.date" required="true"    value="%{getText('format.date',{amount.id.date})}"  id="amountDate"/>
							<div class="invalid-feedback"><s:text name="amount.date.error"/></div>
						</span>
					</div>

					<div class="form-group">
						<div class="input-group">
						<s:select
							class="selectpicker" data-live-search="true"
							listCssStyle="custom-select"
							tooltip="Choisir le premier beneficiare"
							label="Beneficiaire 1"
							id="member1" list="members" listKey="id.name" listValue="%{id.name + ' ' + surname}"
							name="amount.receiverOne.id.name"
							emptyOption="false"
							headerKey="None"
							required="true"
							onchange="FormManager.fillField({val:this.value,selectId:'member1'})"
							headerValue="---------- Selectionner le premier benficiaire ----------"/>
							<s:hidden id="receiverOneSurname" name="amount.receiverOne.surname" value="%{surname}"/>
							<s:hidden id="receiverOnePhone" name="amount.receiverOne.phone" value="%{phone}"/>
							<s:hidden id="receiverOne" name="amount.receiverOne.id.memberId" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_GROUP}"/>
						</div>
                        <div class="invalid-feedback"><s:text name="amount.error.benef"/></div>
					</div>
					<div class="form-group">
						<div class="input-group">
						<s:select
							class="selectpicker" data-live-search="true"
							listCssStyle="custom-select"
							tooltip="Choisir le second beneficiare"
							label="Beneficiaire 2"
							id="member2"
							list="members" listKey="id.name" listValue="%{id.name + ' ' + surname}"
							name="amount.receiverTwo.id.name"
							emptyOption="true"
							headerKey="None"
							onchange="FormManager.fillField({val:this.value,selectId:'member2'})"
							headerValue="---------- Selectionner le second benficiaire ----------"/>
							<s:hidden id="receiverTwoSurname" name="amount.receiverTwo.surname" value="%{surname}"/>
							<s:hidden id="receiverTwo" name="amount.receiverTwo.id.memberId" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_GROUP}"/>
						</div>
					</div>
					<div class="form-group ">
						<s:submit type="button" id="btnAddAmount" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; <s:text name="amount.add.adding"/></s:submit>
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
    FormManager.validationForm({idForm: 'formAddAmount',idSubmit:'btnAddAmount'})
    DataPickerManager.enable({id:'amountDate', isBootstrap:false})
</script>
</html>
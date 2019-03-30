<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
<sj:head jqueryui="true" />
</head>
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
					<div class="input-group">
						<s:label value="%{getText('member.label.name')}" id="idnamesearch" for="idnamesearch"  labelposition="left"></s:label>
						<div class="input-group">
							<s:url var="memberURL" action="autocompleteMember"/>
							<sj:autocompleter id="membersNames"
												  name="amountSession.member.id.name"
												  href="%{memberURL}"
												  loadMinimumCount="2"
												  delay="50"
												  cssClass="custom-select"
												  onCompleteTopics="onCompleteLoading"
								/>
							</div>
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
								<s:textfield name="amountSession.amount"   value="%{associationCurrent.amount}" required="true"  type="number"  pattern="^\d+(\.\d{1,2})?$" readonly="true" class="form-control"/>
							</div>
								<div class="col-md-1 montant-symbol"><i class="fa fa-eur" aria-hidden="true"></i></div>
							<div class="invalid-feedback"><s:text name="amount.money.error"/></div>
						</span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 controls">
							<s:label value="%{getText('common.label.date')}" id="sessionDate" class="control-label"  for="sessionDate"  labelposition="left"></s:label>
							<i class="fa fa-calendar" aria-hidden="true"></i>
						</div>
						<div class="input-group">
							<sj:datepicker
									id="sessionData"
									name="amountSession.id.date"
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
						<div class="form-check">
							<s:checkbox id="status"  class="form-check-input" type="checkbox"  name="amountSession.status"/>
							<label class="form-check-label" for="status"><s:text name="member.add.error.admin"/></label>
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
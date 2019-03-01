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
			<s:form class="form-horizontal"  action="allInfoMemberAction" id="formSearchMember">
				<div class="form-group">
					<div class="input-group">
						<s:select
								tooltip="%{getText('member.common.association.tooltip')}"
								class="selectpicker" data-live-search="true"
								listCssStyle="custom-select"
								label="Groupe"
								id="assoc"
								list="associations" listKey="id.id"	listValue="%{id.id +'-' + description}"
								name="userSearch.association"
								emptyOption="false"
								headerKey=""
								headerValue="%{getText('member.common.association.headerValue')}"/>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<s:select
								class="selectpicker" data-live-search="true"
								listCssStyle="custom-select"
								tooltip="%{getText('member.common.member.tooltip')}"
								label="Membre"
								id="memberSearch" list="members" listKey="id.name" listValue="%{id.name + ' ' + surname}"
								name="userSearch.id.name"
								emptyOption="false"
								headerKey=""
								onchange="FormManager.fillField({val:this.value,selectId:'member'})"
								headerValue="%{getText('member.common.member.headerValue')}"/>

							<%--<s:hidden id="amountCompId" name="amountSession.member.id.memberId" value="%{@cm.purplemoney.constants.PortalConstants@DEFAULT_GROUP}"/>--%>
					</div>
				</div>


				<div class="form-group ">
					<s:submit type="button" id="btnSearchMember" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-search" aria-hidden="true"></i>&nbsp; <s:text name="common.menu.search"/></s:submit>
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

<script>
    FormManager.validationForm({idForm: 'formSearchMember',idSubmit:'btnSearchMember'})
</script>
</html>
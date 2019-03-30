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
			<h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="amount.all.amounts"/></h1>
		</div>
		<div class="card-body">
			<div class="btn btn-group-md">
				<button type="button" class="btn  btn-md btn btn-secondary buttons-collection  buttons-page-length" value="refresh" onclick="DataTableManager.reloadDatatable({idDataTable: 'amounts'})" id="refreshMemberBtn"/><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;Refresh</button>
			</div>
			<table id="amounts"  width="100%" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="display table table-striped table-bordered">
						<thead>
							<tr>
								<th>Membre</th>
								<th>Montant</th>
								<th>Beneficiare 1</th>
								<th>Beneficiare 2</th>
								<th>Date d'insertion</th>
							</tr>
						</thead>
						<s:iterator value="amounts" status="userStatus">
							<tr>
								<td><s:property value="id.member"/></td>
								<td><s:property value="amount"/></td>
								<td><s:property value="receiverOne.surname"/></td>
								<td><s:property value="receiverTwo.surname"/></td>
								<td><s:date name="id.date" format="dd/MM/yyyy" /></td>
							</tr>
						</s:iterator>
					</table>
				</div>
</div>
</div>
</body>
<div class="col">
	<%@ include file = "../../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/datatable/dataTableManager.js"/>"></script>
<script>
	DataTableManager.constructDatatable({idDataTable: 'amounts',title:'Toutes les seances'})

</script>
</html>


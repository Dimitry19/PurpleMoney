<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/commons.jsp"/>
<body>
<%@ include file="../../../common/home/include/header-logo.jsp" %>
<%@ include file="../../../common/menu/menu.jsp" %>
<s:set var="lang" value="%{currentLocale}"/>
<div class="container text-center">
		<div class="card card-perso">
			<div class="card-header">
				<h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="session.consult.amounts"/></h1>
			</div>
			<div class="card-body">
				<div class="btn btn-group-md">
					<button type="button" class="btn  btn-md btn btn-secondary buttons-collection  buttons-page-length" value="refresh" onclick="DataTableManager.reloadDatatable({idDataTable: 'amounts'})" id="refreshSessionsBtn"/><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;Refresh</button>
				</div>
				<table id="rsessions"  width="100%" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="display table table-striped table-bordered">
					<thead>
						<tr>
							<th><s:property value="getText('member.column.name')"/></th>
							<th><s:property value="getText('member.column.surname')"/></th>
							<th><s:property value="getText('session.label.amount')"/></th>
							<th><s:property value="getText('session.benef')"/></th>
							<th><s:property value="getText('common.label.date')"/></th>
							<th></th>
						</tr>
					</thead>
					<s:iterator value="sessions" status="userStatus">
						<tr>
							<td><s:property value="membre.id.name"/></td>
							<td><s:property value="membre.surname"/></td>
							<td><s:property value="amount"/></td>
							<td><s:property value="status"/></td>
							<td><s:date name="id.date" format="dd/MM/yyyy" /></td>
							<td>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div>
					<fieldset>
						<legend><s:text name="common.legend"></s:text></legend>
						<s:div cssClass="legend">
							<span class="badge traffic-light darkseagreen">&nbsp;&nbsp;</span>
							<s:property value="%{getText('member.datatable.legend.beneficiary')}" />
						</s:div>
					</fieldset>
				</div>
				<%@ include file = "../../../common/pages/modal/modal.jsp" %>
			</div>
		</div>
	</div>
</body>
<div class="col">
	<%@ include file = "../../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/datatable/dataTableSessions.js"/>"></script>
<script src="<s:url value="/common/js/datatable/jquery.datatable/2.2.3/responsive.datatable.js "/>"></script>
<script>
    var lng='<s:property  value="%{#lang}" />';
	DataTableManager.constructDatatable({idDataTable:'rsessions',title:'Sessions',lang:lng})

</script>
</html>


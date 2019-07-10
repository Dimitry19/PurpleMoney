<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/header.jsp"/>
<s:include value="../../../common/home/include/sessions-header.jsp"/>
</head>
<%@ include file = "../../../common/home/include/common-header-top.jsp" %>
<s:set var="lang" value="%{currentLocale}"/>
		<div class="card shadow">
			<a href="#amountsCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
				<h6 class="m-0 font-weight-bold text-primary"><s:text name="session.all.amounts"/></h6>
			</a>
			<div class="collapse show" id="amountsCard">
				<div class="card-body">
					<div class="btn btn-group-md">
						<button type="button" class="btn  btn-md btn btn-secondary buttons-collection  buttons-page-length" value="refresh" onclick="DataTableManager.reloadDatatable({idDataTable: 'amounts'})" id="refreshSessionsBtn"/><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;Refresh</button>
					</div>
					<table id="sessions"  width="100%" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="display table table-striped table-bordered">
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
<%@ include file = "../../../common/home/include/common-header-bottom.jsp"%>
</body>
<script src="<s:url value="/common/js/datatable/dataTableSessions.js"/>"></script>
<!-- Page level plugins -->
<script src="<s:url value="/common/template/datatables/jquery.dataTables.min.js"/>"></script>
<script src="<s:url value="/common/template/datatables/dataTables.bootstrap4.min.js"/>"></script>
<script>
    var lng='<s:property  value="%{#lang}" />';
	DataTableManager.constructDatatable({idDataTable: 'sessions',title:'Sessions',lang:lng})

</script>
</html>


<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/header.jsp"/>

</head>
<body class="bg-gradient-primary">
<%@ include file = "../../../common/home/include/common-header-top.jsp" %>
<%@ include file="../../../common/home/include/common-widgets-infos.jsp"%>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="title"><s:text name="loan.all.title"/></s:set>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<a href="#fundsCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary"><s:text name="loan.all.title"/></h6>
		</a>
	</div>

	<div class="collapse show" id="fundsCard">
		<div class="card-body">
			<div class="table-responsive">
				<table id="funds"  width="100%" data-page-length="5" data-order="[[ 1, &quot;asc&quot; ]]" cellspacing="0"  class="table-striped table-bordered table table-bordered">
					<thead>
					<tr>
						<th><s:property value="getText('fund.column.name')"/></th>
						<th><s:property value="getText('fund.column.surname')"/></th>
						<th><s:property value="getText('fund.column.date.add')"/></th>
						<th><s:property value="getText('fund.column.amount')"/></th>
						<th></th>
					</tr>
					</thead>
					<tbody class="<s:property value="#notrasform"/>">
					<s:iterator value="funds" status="userStatus">
						<tr>
							<td><s:property value="id.mmember.id.name"/></td>
							<td><s:property value="id.mmember.surname"/></td>
							<td><s:property value="date"/></td>
							<td><s:property value="amount"/>€</td>
							<td></td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
				<div>
					<fieldset>
						<legend><s:text name="common.legend"></s:text></legend>
						<s:div cssClass="legend">
							<span class="badge badge-success darkseagreen">&nbsp;&nbsp;</span>
							<s:property value="%{getText('loan.datatable.legend.extended')}" />
						</s:div>
					</fieldset>
				</div>
				<%@ include file = "../../../common/pages/modal/modal.jsp" %>
			</div>
		</div>
	</div>

<%@ include file = "../../../common/home/include/common-header-bottom.jsp"%>
<%@ include file = "../../../common/home/include/datatable.js.jsp"%>
<script>
	var lng='<s:property  value="%{#lang}" />';
	var title='<s:property  value="%{#title}" />';
	DataTableManager.constructDatatable({idDataTable: 'funds',title:title,lang:lng})

</script>
</body>


</html>


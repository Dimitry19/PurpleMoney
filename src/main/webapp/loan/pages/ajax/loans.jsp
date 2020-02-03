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
		<a href="#loansCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary"><s:text name="loan.all.title"/></h6>
		</a>
	</div>

	<div class="collapse show" id="loansCard">
		<div class="card-body">
			<div class="table-responsive">
				<s:if test="currentMember.isAdmin()== true">
					<button type="button" onclick='DataTableManager.addElement(this);' class="btn btn-primary btn-sm add-dt-btn"><s:text name="common.label.add"/></button>
				</s:if>
				<table id="loans"  width="100%" data-page-length="5" data-order="[[ 1, &quot;asc&quot; ]]" cellspacing="0"  class="table-striped table-bordered table table-bordered">
					<thead>
					<tr>
						<th></th>
						<th><s:property value="getText('loan.column.name')"/></th>
						<th><s:property value="getText('loan.column.surname')"/></th>
						<th><s:property value="getText('loan.column.amount')"/></th>
						<th><s:property value="getText('loan.column.extended')"/></th>
						<th><s:property value="getText('loan.column.tax')"/></th>
						<th><s:property value="getText('loan.column.amount.to.back')"/></th>
						<th><s:property value="getText('loan.column.balance')"/></th>
						<th><s:property value="getText('loan.column.date.start')"/></th>
						<th><s:property value="getText('loan.column.date.remb')"/></th>
					</tr>
					</thead>
					<tbody class="<s:property value="#notrasform"/>">
					<s:iterator value="loans" status="userStatus">
						<tr>
							<td></td>
							<td><s:property value="mmember.id.name"/></td>
							<td><s:property value="mmember.surname"/></td>
							<td><s:property value="amount"/>€</td>
							<s:if test="extended==true">
								<td><s:property value="getText('member.column.active.YES')"/></td>
							</s:if>
							<s:if test="extended==false">
								<td><s:property value="getText('member.column.active.NO')"/></td>
							</s:if>
							<td><s:property value="tax"/>%</td>
							<td><s:property value="amountToBack"/>€</td>
							<s:if test="balanced==true">
								<td><s:property value="getText('member.column.active.YES')"/></td>
							</s:if>
							<s:if test="balanced==false">
								<td><s:property value="getText('member.column.active.NO')"/></td>
							</s:if>
							<td><s:date name="loanDate" format="dd/MM/yyyy" /></td>
							<td><s:date name="loanDateRemb" format="dd/MM/yyyy" /></td>
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
	DataTableManager.constructDatatable({idDataTable: 'loans',title:title,lang:lng,positionDate:9})

</script>
</body>


</html>


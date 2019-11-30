<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/header.jsp"/>

</head>
<body class="bg-gradient-primary">
<%@ include file = "../../../common/home/include/common-header-top.jsp" %>
<%@ include file="../../../common/home/include/common-widgets-infos.jsp"%>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="title"><s:text name="session.all.amounts"/></s:set>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<a href="#amountsCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
					<h6 class="m-0 font-weight-bold text-primary"><s:text name="session.all.amounts"/></h6>
				</a>
			</div>

			<div class="collapse show" id="amountsCard">
				<div class="card-body">
					<div class="table-responsive">
						<table id="sessions"  width="100%" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" cellspacing="0"  class="table-striped table-bordered table table-bordered">
							<thead>
								<tr>
									<th></th>
									<th><s:property value="getText('member.column.name')"/></th>
									<th><s:property value="getText('member.column.surname')"/></th>
									<th><s:property value="getText('session.label.amount')"/></th>
									<th><s:property value="getText('common.label.date')"/></th>
								</tr>
							</thead>
							<tbody>
							<s:iterator value="sessions" status="userStatus">
								<tr>
									<td>
										<s:if test="status==true">
											<s:set var="priorityLightStyle">bg-red-thunderbird bg-font-red-thunderbird bg-gradient-success</s:set>
											<span class="badge traffic-light <s:property value="%{#priorityLightStyle}"/>">&nbsp;&nbsp;</span>
										</s:if>

									</td>
									<td><s:property value="mmember.id.name"/></td>
									<td><s:property value="mmember.surname"/></td>
									<td><s:property value="amount"/></td>
									<td><s:date name="id.date" format="dd/MM/yyyy" /></td>
									<%--<td><s:property value="id.date"/></td>--%>
								</tr>
							</s:iterator>
							</tbody>
						</table>
						<div>
							<fieldset>
								<legend><s:text name="common.legend"></s:text></legend>
								<s:div cssClass="legend">
									<span class="badge badge-success darkseagreen">&nbsp;&nbsp;</span>
									<s:property value="%{getText('member.datatable.legend.beneficiary')}" />
								</s:div>
							</fieldset>
						</div>
						<%@ include file = "../../../common/pages/modal/modal.jsp" %>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../../../common/home/include/common-header-bottom.jsp"%>
<%@ include file = "../../../common/home/include/datatable.js.jsp"%>
<script>
	var lng='<s:property  value="%{#lang}" />';
	var title='<s:property  value="%{#title}" />';
	DataTableManager.constructDatatable({idDataTable: 'sessions',title:title,lang:lng})

</script>
</body>


</html>


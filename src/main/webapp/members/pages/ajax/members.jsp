<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/header.jsp"/>

</head>
<body class="bg-gradient-primary">
<%@ include file = "../../../common/home/include/common-header-top.jsp" %>
<%@ include file="../../../common/home/include/common-widgets-infos.jsp"%>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="title"><s:text name="member.all.title"/></s:set>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<a href="#membersCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary"><s:text name="member.all.title"/></h6>
		</a>
	</div>

	<div class="collapse show" id="membersCard">
		<div class="card-body">
			<div class="table-responsive">
				<table id="members"  width="100%" data-page-length="5" data-order="[[ 1, &quot;asc&quot; ]]" cellspacing="0"  class="table-striped table-bordered table table-bordered">
					<thead>
					<tr>
						<th><s:property value="getText('member.column.gender')"/></th>
						<th><s:property value="getText('member.column.name')"/></th>
						<th><s:property value="getText('member.column.surname')"/></th>
						<th><s:property value="getText('member.column.phone')"/></th>
						<th><s:property value="getText('member.column.email')"/></th>
						<th><s:property value="getText('member.column.role')"/></th>
						<th><s:property value="getText('member.column.active')"/></th>
						<th><s:property value="getText('member.column.sanction')"/></th>
						<th></th>
					</tr>
					</thead>
					<tbody class="<s:property value="#notrasform"/>">
					<s:iterator value="members" status="userStatus">
						<%--<tr class='clickable-row' data-toggle="modal" data-target="#detailsModal" style="cursor:pointer">--%>
						<tr>
							<td>
								<s:if test="male==false">
									<span ><i class="fa fa-female" aria-hidden="true"></i>&nbsp;&nbsp;</span>
								</s:if>
								<s:elseif test="male==true">
									<span ><i class="fa fa-male" aria-hidden="true"></i>&nbsp;&nbsp;</span>
								</s:elseif>
								<s:property value="sex"/>
							</td>
							<td><s:property value="id.name"/></td>
							<td><s:property value="surname"/></td>
							<td><s:property value="phone"/></td>
							<td><s:property value="email"/></td>
							<td><s:property value="roleDesc"/></td>
							<s:if test="active==true">
								<td><s:property value="getText('member.column.active.YES')"/></td>
							</s:if>
							<s:if test="active==false">
								<td><s:property value="getText('member.column.active.NO')"/></td>
							</s:if>

							<s:if test ="%{getSanctions() != null}">
								<s:if test="%{getSanctions().size()>1}">
									<td><s:property value="%{getSanctions().iterator().next().getDescription()}"/>
										<s:text name="member.column.sanction.more"></s:text>
									</td>
								</s:if>
								<s:else>
									<td><s:property value="%{getSanctions().iterator().next().getDescription()}"/></td>
								</s:else>
							</s:if>

							<td>
							</td>
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
<%@ include file = "../../../common/home/include/common-header-bottom.jsp"%>
<%@ include file = "../../../common/home/include/datatable.js.jsp"%>
<script>
	var lng='<s:property  value="%{#lang}" />';
	var title='<s:property  value="%{#title}" />';
	DataTableManager.constructDatatable({idDataTable: 'members',title:title,lang:lng})

</script>
</body>


</html>


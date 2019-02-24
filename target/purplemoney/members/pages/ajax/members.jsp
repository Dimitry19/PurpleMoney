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
			<h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="member.all.title"/></h1>
		</div>
		<div class="card-body">
				<div class="btn btn-group-md">
					<button type="button" class="btn  btn-md btn btn-secondary buttons-collection  buttons-page-length" value="refresh" onclick="DataTableManager.reloadDatatable({idDataTable: 'members'})" id="refreshMemberBtn"/><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;Refresh</button>
				</div>
				<%--<s:if test="members!=null && members.size() > 0">--%>
				<table id="members"  width="100%" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="display table table-striped table-bordered">
					<thead>
						<tr>
							<th><s:property value="getText('member.column.gender')"/></th>
							<th><s:property value="getText('member.column.name')"/></th>
							<th><s:property value="getText('member.column.surname')"/></th>
							<th><s:property value="getText('member.column.phone')"/></th>
							<th><s:property value="getText('member.column.email')"/></th>
							<th><s:property value="getText('member.column.role')"/></th>
						</tr>
					</thead>
					<s:iterator value="members" status="userStatus">
						<tr>
							<td>
								<s:if test="sex=='M'">
									<span ><i class="fa fa-male" aria-hidden="true"></i>&nbsp;&nbsp;</span>
								</s:if>
								<s:else>
									<span ><i class="fa fa-female" aria-hidden="true"></i>&nbsp;&nbsp;</span>
								</s:else>
								<s:property value="sex"/>
							</td>
							<td><s:property value="id.name"/></td>
							<td><s:property value="surname"/></td>
							<td><s:property value="phone"/></td>
							<td><s:property value="email"/></td>
							<td><s:property value="roleDesc"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		<%--</s:if>--%>
	</div>
</div>
</body>
<div class="col">
	<%@ include file = "../../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/datatable/dataTableManager.js"/>"></script>
<script>
    var data='<s:property  value="%{#lang}" />';
	DataTableManager.constructDatatable({idDataTable: 'members',title:'Liste des membres',lang:data})

</script>
</html>


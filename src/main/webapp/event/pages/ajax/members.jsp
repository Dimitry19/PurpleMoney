<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/commons.jsp"/>
</head>
<body>
<%@ include file="../../../common/home/include/header-logo.jsp" %>
<%@ include file="../../../common/menu/menu.jsp" %>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="size" value="%{getSanctions().size()}"/>
<div class="container text-center">
	<div class="card card-perso">
		<div class="card-header">
			<h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="member.all.title"/></h1>
		</div>
		<div class="card-body">
				<div class="btn btn-group-md">
					<button type="button" class="btn  btn-md btn perso-refresh buttons-collection  buttons-page-length" onclick="DataTableManager.reloadDatatable({idDataTable: 'members'})" id="refreshMemberBtn"/>
								<i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;<s:text name="common.refresh"></s:text>
					</button>
				</div>
				<table id="members"  width="100%" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" class="display  nowrap table table-striped table-bordered row-border hover order-column">
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
							<s:if test="%{getSanctions().size()>1}">
								<td><s:property value="%{getSanctions().iterator().next().getDescription()}"/>
									<s:text name="member.column.sanction.more"></s:text><span class="badge badge-secondary">4</span>
								</td>
							</s:if>
							<s:else>
								<td><s:property value="%{getSanctions().iterator().next().getDescription()}"/></td>
							</s:else>
							<td>
							</td>
						</tr>
					</s:iterator>
					</tbody">
				</table>
			<div>
                <fieldset>
                    <legend><s:text name="common.legend"></s:text></legend>
                        <s:div cssClass="legend">
                        <span class="badge traffic-light darkseagreen">&nbsp;&nbsp;</span>
                            <s:property value="%{getText('member.datatable.legend.active')}" />
                        </s:div>
                        <s:div cssClass="legend">
                            <span class="badge traffic-light sanction-inactive">&nbsp;&nbsp;</span>
                            <s:property value="%{getText('member.datatable.legend.sanction.active')}" />
                        </s:div>
                        <s:div cssClass="legend">
                            <span class="badge traffic-light sanction">&nbsp;&nbsp;</span>
                            <s:property value="%{getText('member.datatable.legend.sanction')}" />
                        </s:div>
                </fieldset>
			</div>
			<%@ include file = "../../../common/pages/modal/modal.jsp" %>
		<%--</s:if>--%>
	</div>
</div>
</body>
<div class="col">
	<%@ include file = "../../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/datatable/dataTableManager.js"/>"></script>
<script src="<s:url value="/common/js/datatable/jquery.datatable/2.2.3/responsive.datatable.js "/>"></script>
<script>
    var lng='<s:property  value="%{#lang}" />';
	DataTableManager.constructDatatable({idDataTable: 'members',button:button,title:'Liste Membres',lang:lng})

</script>
</html>


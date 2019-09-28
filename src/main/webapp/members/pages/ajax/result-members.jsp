<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="size" value="%{getSanctions().size()}"/>
<div class="table-responsive">
	<table id="members"  width="100%" data-page-length="10" data-order="[[ 1, &quot;asc&quot; ]]" cellspacing="0"  class="table-striped table-bordered table table-bordered">
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
					<s:submit type="button" id="edit" class="btn btn-primary btn-md btn-login-button"><i class="fa fa-edit" aria-hidden="true"></i>&nbsp; <s:text name="common.menu.members.edit"/></s:submit>
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
<%@ include file = "../../../common/home/include/datatable.js.jsp"%>
<script>
	var lng='<s:property  value="%{#lang}" />';
	var title='<s:property  value="%{#title}" />';
	DataTableManager.constructDatatable({idDataTable: 'members',title:title,lang:lng})

</script>
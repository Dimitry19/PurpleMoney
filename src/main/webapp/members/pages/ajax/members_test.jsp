<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/commons.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="size" value="%{getSanctions().size()}"/>
<div class="container text-center">
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
</div>
		<%--</s:if>--%>
<script src="<s:url value="/common/datatable/dataTableManager.js"/>"></script>
<script>
	DataTableManager.constructDatatable({idDataTable: 'members',title:'Liste Membres',lang:'it'});
</script>


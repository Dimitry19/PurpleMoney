<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
</head>
<body>
<%@ include file="../../common/home/include/header-logo.jsp" %>
<%@ include file="../../common/menu/menu.jsp" %>
	<div class="container text-center">
		<div class="card card-perso">
			<div class="card-header">
				<i class="fa fa-id-card" aria-hidden="true"></i>&nbsp;
				<h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="member.info.title"/></h1>
			</div>
			<div class="card-body">
				<s:form  id="editMemberForm" cssClass="form-horizontal" action="saveEditMemBerAction">
					<div class="form-group">
						<s:label value="%{getText('member.label.name')}" id="idname" for="idname"  labelposition="left"></s:label>
						<s:textfield  value="%{userInfo.id.name}"  name="userInfo.id.name" readonly="true" id="nameId" cssClass="form-control"/>
						<span class = "input-group-addon"></span>
						<s:hidden name="userInfo.id.memberId" value="%{userInfo.id.memberId}"/>
						<s:hidden name="userInfo.admin" value="%{userInfo.admin}"/>
						<s:hidden  name="userInfo.association" value="%{userInfo.id.memberId}" />
						<s:hidden  name="userInfo.active" value="%{userInfo.active}" />
					</div>
					<div class="form-group">
						<s:label value="%{getText('member.label.surname')}" id="idsurname" for="idsurname"  labelposition="left"></s:label>
						<s:textfield  value="%{userInfo.surname}"  name="userInfo.surname"  readonly="true" cssClass="form-control"/>
						<span class = "input-group-addon"></span>
					</div>
					<div class="form-group">
						<s:label value="%{getText('member.label.gender')}"  id="idsex" for="idsex"  labelposition="left"></s:label>
						<s:textfield  value="%{userInfo.sexDesc}"  name="userInfo.sexDesc"  readonly="true" id="sex" cssClass="form-control"/>
						<span class = "input-group-addon"></span>
					</div>
					<div class="form-group">
						<s:label value="%{getText('member.label.email')}"  id="idemail" for="idemail"  labelposition="left"></s:label>
						<s:textfield  value="%{userInfo.email}"  name="userInfo.email" readonly="true" cssClass="form-control"/>
						<span class = "input-group-addon"></span>
					</div>
					<div class="form-group">
						<s:label value="%{getText('member.label.phone')}"  id="idphone" for="idphone"  labelposition="left"></s:label>
						<s:textfield  value="%{userInfo.phone}"  name="userInfo.phone" readonly="true" cssClass="form-control"/>
						<span class = "input-group-addon"></span>
					</div>
					<div class="form-group">
						<s:label value="%{getText('member.label.address')}"  id="idaddress" for="idaddress"  labelposition="left"></s:label>
						<s:textfield  value="%{userInfo.address}"  name="userInfo.address" readonly="true" cssClass="form-control"/>
						<span class = "input-group-addon"></span>
					</div>
					<div class="form-group">
						<s:label value="%{getText('member.label.role')}" id="idrole" for="idrole"  labelposition="left"></s:label>
						<s:textfield  value="%{userInfo.roleDesc}"  name="userInfo.roleDesc" id="role" readonly="true" cssClass="form-control"/>
						<span class = "input-group-addon"></span>
						<s:hidden  name="userInfo.role" value="%{userInfo.role}" />
					</div>
					<div class="form-group">
						<s:label value="%{getText('member.label.association')}" id="idAssociation" for="idAssociation"  labelposition="left"></s:label>
						<s:textfield  value="%{userInfo.associationDesc}"  name="userInfo.associationDesc" id="associationId" readonly="true" cssClass="form-control"/>
						<span class = "input-group-addon"></span>

					</div>
					<s:if test="userInfo.admin==true || currentMember.admin=true">
						<div class="btn btn-group-md">
							<button type="button" class="btn  btn-sm  fa fa-ban  btn-outline-warning float-right"   onclick="MembersManager.disableFields({formId:'memberForm', editBtn:'editMenberBtn'})" id="cancelMenberBtn"><s:text name="common.button.cancel.label"/></button>
						</div>
						<div class="btn btn-group-md">
							<button type="button" class="btn  btn-sm fa fa-edit btn-outline-primary float-right"  onclick="MembersManager.enableFields({formId:'memberForm', editBtn:'editMenberBtn'})" id="editMenberBtn"><s:text name="common.button.edit.label"/></button>
						</div>
						<div class="btn btn-group-md">
							<s:submit type="button"   value="%{getText('common.button.save.label')}" class="btn  btn-sm fa fa-floppy-o btn-outline-success float-right"    id="saveMenberBtn"/>
								<%--<s:label for = "attachment" value = "Attachment"/>
            					<s:file name = "attachment" accept = "text/html,text/plain" />--%>
						</div>
					</s:if>
				</s:form>
			</div>
			<div class="card-footer bg-transparent border-success">Info Membre</div>
			<div>
				<s:if test="hasActionMessages()">
					<script>
                        var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="member.edit.sucess"/></p>';
                        NotificationManager.displayNotification({message:message, type:'success'})
                        FormManager.disableAllFields({idForm:'editMemberForm'})
					</script>
				</s:if>
				<s:if test="hasActionErrors()">
					<script>
                        var message='<span class="icon icon-megaphone"><i class="fa fa-bell" aria-hidden="true"></i></span><p><s:text name="common.edit.error"/></p>';
                        NotificationManager.displayNotification({message:message, type:'error'})
					</script>
				</s:if>
			</div>
		</div>
	</div>
</body>

<div class="col">
	<%@ include file = "../../common/footers/footer.jsp" %>
</div>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/members/js/member.js"/>"></script>
<%--<script>
    MembersManager.enableFields({formId:'memberForm', editBtn:'editMenberBtn'})
</script>--%>
</html>
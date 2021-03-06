<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../common/home/include/header.jsp"/>
<s:include value="../../common/home/include/notification-header.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="showNotification" value="%{showNotification}"/>
<sj:head jqueryui="true"/>
</head>
<body class="bg-gradient-primary">
<%@ include file = "../../common/home/include/common-header-top.jsp" %>
<%@ include file="../../common/home/include/common-widgets-infos.jsp"%>
<div class="card shadow mb-4">
	<a href="#infoMemberCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
		<div class="card-header"><h6 class="m-0 font-weight-bold text-primary"><s:text name="member.info.title"/></h6></div>
	</a>
	<div class="collapse show" id="infoMemberCard">
		<div class="card-body">
			<s:form class="form-login form-horizontal user"  action="saveEditMemBerAction" id="editMemberForm">
				<div class="md-form">
					<s:textfield id="nameId"   name="userInfo.id.name" value="%{userInfo.id.name}" type="text" class="form-control form-control-login" readonly="true" />
					<label for="nameId"><s:text name="member.label.name"/></label>
					<s:hidden  name="userInfo.id.associationId" value="%{userInfo.id.associationId}"/>
					<s:hidden  name="userInfo.admin" value="%{userInfo.admin}"/>
					<s:hidden  name="userInfo.active" value="%{userInfo.active}" />
					<s:hidden  id="hnameId"  name="userInfo.id.name" value="%{userInfo.id.name}" />
				</div>
				<div class="md-form">
					<s:textfield id="surname"   name="userInfo.surname" value="%{userInfo.surname}" type="text" class="form-control form-control-login" readonly="true" />
					<label for="surname"><s:text name="member.label.surname"/></label>
					<s:hidden   id="hsurname"  name="userInfo.surname" value="%{userInfo.surname}" />
				</div>
				<div class="md-form">
					<s:textfield id="sex"   name="userInfo.sexDesc" value="%{userInfo.sexDesc}" type="text" class="form-control form-control-login" readonly="true" />
					<label for="sex"><s:text name="member.label.gender"/></label>
					<s:hidden  id="hsex" name="userInfo.sexDesc" value="%{userInfo.sexDesc}" />
				</div>
				<div class="md-form">
					<s:textfield id="email"   name="userInfo.email" value="%{userInfo.email}" type="text" class="form-control form-control-login" readonly="true" />
					<label for="email"><s:text name="member.label.email"/></label>
					<s:hidden  id="hemail" name="userInfo.email" value="%{userInfo.email}" />
				</div>
				<div class="md-form">
					<s:textfield id="phone"   name="userInfo.phone" value="%{userInfo.phone}" type="text" maxlength="14" placeholder="%{getText('member.add.placeholder.phone')}" class="form-control form-control-login" readonly="true" />
					<label for="phone"><s:text name="member.label.phone"/></label>
					<s:hidden  id="hphone" name="userInfo.phone" value="%{userInfo.phone}" />
				</div>
				<div class="md-form">
					<s:textfield id="role"   name="userInfo.roleDesc" value="%{userInfo.roleDesc}" type="text" class="form-control form-control-login" readonly="true" />
					<label for="role"><s:text name="member.label.role"/></label>
					<s:hidden  id="hrole" name="userInfo.role" value="%{userInfo.role}" />
				</div>
				<div class="md-form">
					<s:textfield id="associationId"   name="userInfo.associationDesc" value="%{userInfo.associationDesc}" type="text" class="form-control form-control-login" readonly="true" />
					<label for="associationId"><s:text name="member.label.association"/></label>
					<s:hidden  id="hassociationId" name="userInfo.associationDesc" value="%{userInfo.associationDesc}" />
				</div>
				<s:if test="userInfo.admin==true || currentMember.admin=true">
					<div class="btn btn-group-md">
						<button type="button" class="btn  btn-sm  fa fa-ban  btn-outline-warning float-right"   onclick="MembersManager.disableFields({formId:'editMemberForm', editBtn:'cancelMenberBtn'})" id="cancelMenberBtn"><s:text name="common.button.cancel.label"/></button>
					</div>
					<div class="btn btn-group-md">
						<button type="button" class="btn  btn-sm fa fa-edit btn-outline-primary float-right"  onclick="MembersManager.enableFields({formId:'editMemberForm', editBtn:'editMemberBtn'})" id="editMemberBtn"><s:text name="common.button.edit.label"/></button>
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
	<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script src="<s:url value="/members/js/member.js"/>"></script>
	<script src="<s:url value="/common/js/jquery/jquery-input-mask-phone-number.js"/>"></script>
	<script>
		$('#phone').usPhoneFormat({
			format: '(xxx) xxx-xxxx'
		});
	</script>
</body>
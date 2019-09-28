<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:include value="../../common/home/include/header.jsp"/>
<s:set var="lang" value="%{currentLocale}"/>
<s:set var="showNotification" value="%{showNotification}"/>
<sj:head jqueryui="true" />

</head>
<body class="bg-gradient-primary">
<%@ include file = "../../common/home/include/common-header-top.jsp" %>
<%@ include file="../../common/home/include/common-widgets-infos.jsp"%>

			<div class="card shadow mb-4">
				<a href="#searchMemberCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
					<div class="card-header"><h6 class="m-0 font-weight-bold text-primary"><s:text name="member.search.title"/></h6></div>
				</a>
				<div class="collapse show" id="searchMemberCard">
					<div class="card-body">
						<s:form class="form-horizontal" id="formSearchMember">
							<div class="md-form">
								<s:textfield id="membersNames"   name="userSearch.id.name"  required="true" class="form-control form-control-login"  onkeyup="FormManager.enableBtn({idButton:'btnSearchMember', idField:'membersNames'});return false;"/>
								<label for="membersNames"><s:text name="member.label.name"/></label>
								<div class="invalid-feedback"><s:text name="member.add.error.name"/></div>
								<s:hidden  name="userSearch.id.name" />
							</div>
							<div class="md-form">
								<s:textfield  name="userSearch.association" id="userSearchAssociationLabel"   value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true" />
								<label for="userSearchAssociationLabel"><s:text name="member.label.association"/></label>
								<s:hidden  name="userSearch.association" id="userSearchAssociation" value="%{associationCurrent.id.id}" />
							</div>
							<div class="md-form">
								<s:set var="url"><s:url action="allInfoMemberAction"/></s:set>
								<s:submit type="button" id="btnSearchMember" disabled="true" class="btn btn-primary btn-md btn-login-button" onclick="AjaxManager.callAction({url:'%{#url}',idForm: 'formSearchMember',container:'container-result',obj:'userSearch'});return false;"><i class="fa fa-search" aria-hidden="true"></i>&nbsp; <s:text name="common.menu.search"/></s:submit>
							</div>
						</s:form>
					</div>
					<div id="container-result" class="container-result">
					</div>
				</div>
			</div>
<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script>
	FormManager.validationForm({idForm: 'formSearchMember',idSubmit:'btnSearchMember'})
</script>
<!-- ds-framework JavaScript-->
<script src="<s:url value="/ds-framework/js/AjaxManager.js"/>"></script>
</body>
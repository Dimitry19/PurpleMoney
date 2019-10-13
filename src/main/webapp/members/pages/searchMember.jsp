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
					<div class="row">
						<div class="col-md-5 md-form">
							<s:textfield  name="userSearch.association" id="userSearchAssociationLabel"   value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true" />
							<label for="userSearchAssociationLabel"><s:text name="member.label.association"/></label>
							<s:hidden  name="userSearch.association" id="userSearchAssociation" value="%{associationCurrent.id.id}" />
						</div>
						<div class="col-md-4 md-form">
							<s:select
									tooltip="%{getText('common.login.association.tooltip')}"
									class="browser-default custom-select select-autocomplete-s2"  data-live-search="true"
									id="membersNames"
									list="%{{}}" listKey="id.name"	listValue="%{id.name}"
									name="userSearch.id.name"
									emptyOption="true"
									headerValue="%{getText('common.login.group.tooltip')}"
							/>
						</div>
						<div class=" col-md-3 md-form">
							<s:set var="url"><s:url action="allInfoMemberAction"/></s:set>
							<s:submit type="button" id="btnSearchMember" disabled="true" class="btn  btn-md btn-login-button btn-outline-primary waves-effect save-btn" onclick="AjaxManager.callAction({url:'%{#url}',idForm: 'formSearchMember',container:'container-result',obj:'userSearch'});return false;"><i class="fa fa-search" aria-hidden="true"></i>&nbsp; <s:text name="common.menu.search"/></s:submit>
						</div>

					</div>

				</s:form>
			</div>
			</div>
		</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<s:url value="/common/js/form.js"/>"></script>
<%@ include file = "../../common/footers/select2-footer.js.jsp" %>

<script>
	var lng='<s:property  value="%{#lang}" />';
	FormManager.validationForm({idForm: 'formSearchMember',idSubmit:'btnSearchMember'})
	Select2Manager.autocomlete({lang:lng,idForm:'formSearchMember', type:'member', url:"autocompleteMember.do"});
</script>
<!-- ds-framework JavaScript-->
<script src="<s:url value="/ds-framework/js/AjaxManager.js"/>"></script>
</body>
<div id="container-result">
</div>
<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:include value="../../common/home/include/commons.jsp"/>
<sj:head jqueryui="true" />
</head>
<body>
<%@ include file="../../common/home/include/header-logo.jsp" %>
<%@ include file="../../common/menu/menu.jsp" %>

<div class="container text-center">
	<div class="card card-perso">
		<div class="card-header">
			<h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="member.search.title"/></h1>
		</div>
		<div class="card-body">
			<s:form class="form-horizontal"   action=""  id="formSearchMember">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<s:label value="%{getText('member.label.name')}" id="idnamesearch" for="idnamesearch"  labelposition="left"></s:label>
							<div class="input-group">
								<s:url var="memberURL" action="autocompleteMember"/>
								<sj:autocompleter id="membersNames"
												  name="userSearch.id.name"
												  href="%{memberURL}"
												  loadMinimumCount="2"
												  delay="50"
												  cssClass="custom-select"
												  onCompleteTopics="onCompleteLoading"
								/>
								<s:hidden  name="userSearch.id.name" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<s:label value="%{getText('member.label.association')}" id="idnamesearch" for="idnamesearch"  labelposition="left"></s:label>
							<div class="input-group">
								<s:textfield  name="userSearch.association" id="userSearchAssociationLabel"   value="%{associationCurrent.description}" class="form-control form-control-login" readonly="true" />
								<s:hidden  name="userSearch.association" id="userSearchAssociation" value="%{associationCurrent.id.id}" />
							</div>
						</div>
					</div>
				</div>
				<div class="form-group ">
						<s:set var="url"><s:url action="allInfoMemberAction"/></s:set>
						<s:submit type="button" id="btnSearchMember" class="btn btn-primary btn-md btn-login-button" onclick="AjaxManager.callAction({url:'%{#url}',idForm: 'formSearchMember',container:'container-result',obj:'userSearch'});return false;"><i class="fa fa-search" aria-hidden="true"></i>&nbsp; <s:text name="common.menu.search"/></s:submit>
				</div>
			</s:form>
		</div>
		<div id="container-result">
		</div>
		<div class="card-footer bg-transparent"></div>
	</div>
</div>

<div class="col">
	<%@ include file = "../../common/footers/footer.jsp" %>
</div>
</body>

<script src="<s:url value="/common/js/form.js"/>"></script>
<!-- ds-framework JavaScript-->

<script src="<s:url value="/ds-framework/js/AjaxManager.js"/>"></script>

<script>
    FormManager.validationForm({idForm: 'formSearchMember',idSubmit:'btnSearchMember'});
</script>
</html>
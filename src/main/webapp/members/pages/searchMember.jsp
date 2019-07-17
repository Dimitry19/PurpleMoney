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

<div class="container">
	<div class="row justify-content-center">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<a href="#searchMemberCard" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
							<h6 class="m-0 font-weight-bold text-primary"><s:text name="member.search.title"/></h6>
						</a>
					</div>
					<div class="collapse show" id="searchMemberCard">
						<div class="card-body p-0">
							<s:form class="form-horizontal"   action="allInfoMemberAction"  id="formSearchMember">
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
																  cssClass="form-control form-control-user"
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
						<div id="container-result"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file = "../../common/home/include/common-header-bottom.jsp"%>
<!-- ds-framework JavaScript-->
<script src="<s:url value="/ds-framework/js/AjaxManager.js"/>"></script>
</body>
</html>
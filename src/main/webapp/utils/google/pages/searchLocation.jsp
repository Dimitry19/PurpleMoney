<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<s:include value="../../../common/home/include/mapcommons.jsp"/>

</head>
<body>
<%@ include file="../../../common/home/include/header-logo.jsp" %>
    <div class="container text-center">
        <div class="card card-perso">
            <div class="card-header">
                <h1 class="h3 mb-3 font-weight-normal bd-text-purple-bright"><s:text name="map.search.title"/></h1>
            </div>
                <div class="card-body">
                    <s:form  id="mapForm" cssClass="form-horizontal" method="POST" action="mapsearchAction">
                        <div class="form-group">
                            <span class = "input-group-addon">
                                <s:label value="%{getText('map.label.origin')}" id="idorigin" for="idorigin"  labelposition="left"></s:label>
                                <s:textfield   name="origin.format" id="originId" required=" " placeholder="%{getText('map.placeholder.input')}" cssClass="form-control" />
                                 <div class="invalid-feedback"><s:text name="map.search.start.point.error"/></div>
                            </span>
                        </div>
                        <div class="form-group">
                           <span class = "input-group-addon">
                                 <s:label value="%{getText('map.label.destination')}" id="iddestination" for="iddestination"  labelposition="left"></s:label>
                                <s:textfield   name="destination.format"  id="destinationId"  required=" " placeholder="%{getText('map.placeholder.input')}" cssClass="form-control"/>
                                <div class="invalid-feedback"><s:text name="map.search.end.point.error"/></div>
                            </span>
                        </div>
                        <div class="btn btn-group-md">
                            <s:submit  type="button"   id="searchMapBtn" cssClass="btn btn-sm  align-self-center btn-primary btn-login">
                                <i class="fa fa-search" aria-hidden="true"></i>&nbsp;<s:text name="common.menu.search"></s:text></i>
                            </s:submit>
                        </div>
                    </s:form>
                </div>
        </div>
    </div>
</body>
<script src="<s:url value="/common/js/form.js"/>"></script>
<script>
    FormManager.validationForm({idForm:'mapForm',idSubmit:'searchMapBtn'})
</script>
<script src="<s:url value="/utils/google/js/prettify_188_0_0.js"/>"></script>
<script src="<s:url value="/utils/google/js/jeoquery.js"/>"></script>
<script src="<s:url value="/utils/google/js/tracking.js"/>"></script>
<script src="<s:url value="/utils/google/js/map.js"/>"></script>
<script>
    $(function () {
        jeoquery.defaultData.userName = 'dimitridevelopper';

        $("#destinationId").jeoCityAutoComplete({
            callback: function(city) {
                if (console) console.log(city);
            }
        });

        $("#originId").jeoCityAutoComplete({
            callback: function(city) {
                if (console) console.log(city);
            }
        });
        prettyPrint();
    });
</script>
<div class="col">
    <%@ include file = "../../../common/footers/footer.jsp" %>
</div>
</html>
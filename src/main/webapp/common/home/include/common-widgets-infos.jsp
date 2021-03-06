<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<!-- Page Heading -->
<div  class="d-sm-flex align-items-center justify-content-between mb-4 custum-info">
    <h1 class="h3 mb-0 text-gray-800">Infos</h1>
</div>

<div  class="widget-infos row widget-info">
    <div  class="col-xl-3 col-md-6 mb-4">
        <div id="info-found" class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><s:text name="chart.total.found"/></div>
                        <div id="totalFound" class="h5 mb-0 font-weight-bold text-gray-800"></div>
                    </div>
                    <div class="col-auto">
                        <%--<i class="fas fa-euro-sign fa-2x text-gray-300"></i>
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div id="info-personal-found"  class="infos card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><s:text name="chart.personal.found"/></div>
                        <div id="personalFound" class="h5 mb-0 font-weight-bold text-gray-800"></div>
                    </div>
                    <div class="col-auto">
                        <%--<i class="fas fa-euro-sign fa-2x text-gray-300"></i>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div  class="col-xl-3 col-md-6 mb-4">
        <div id="info-loan" class=" card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1"><s:text name="chart.total.loan"/></div>
                        <div class="row no-gutters align-items-center">
                            <div class="col-auto">
                                <div id="totalLoan" class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
                            </div>
                            <div class="col">
                               <%-- <div class="progress progress-sm mr-2">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto">
                        <%--<i class="fas fa-euro-sign fa-2x text-gray-300"></i>
                         <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>--%>
                    </div>
                </div>
                <div class="row">
                    <div id="totalLoanMsg" class="mt-6 text-center widget-info-small totalLoanMsg">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div  class="col-xl-3 col-md-6 mb-4">
        <div id="info-sanction" class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"><s:text name="chart.sanction.toPay"/></div>
                        <div id="totalSanction" class="h5 mb-0 font-weight-bold text-gray-800"></div>
                    </div>
                    <div class="col-auto">
                        <%--<i class="fas fa-comments fa-2x text-gray-300"></i>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/home/include/common-jquery-ui-widget.jsp" %>
<link  rel="stylesheet"  href="<s:url value="/common/css/widget.css"/>">
<script src="<s:url value="/common/js/widget.js"/>"></script>
<script>
	var lng = '<s:property  value="%{#lang}" />';
	WidgetManager.changeThemeColor({lang: lng,ids:['info-found','info-personal-found','info-loan','info-sanction']});

</script>
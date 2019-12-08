
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:set var="lang" value="%{currentLocale}"/>

</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<!-- Footer -->
<footer class="sticky-footer bg-white">
 <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <div class="row py-4 d-flex align-items-center">
                <!-- Grid column -->
                <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                </div>
            </div>
            <s:include value="/common/home/include/socials.jsp"/>
            <s:include value="/common/home/include/version-application.jsp"/>
        </div>
    </div>

</footer>

<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><s:text name="common.menu.logout.leave"/>?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body"><s:text name="common.menu.logout.select"/>&nbsp;<strong><s:text name="common.menu.logout"/></strong> <s:text name="common.menu.logout"/>.</div>
            <div class="modal-footer">
                <button class="btn btn-alert-custom" type="button" data-dismiss="modal"><s:text name="common.label.btn.reset"/></button>
                <a class="btn btn-primary" href="<s:url action="logoutAction"/>"><s:text name="common.menu.logout"/></a>
            </div>
        </div>
    </div>
</div>
<%@ include file = "../../../common/footers/footer.js.jsp" %>
<!-- Page level plugins -->
<script src="<s:url value="/common/template/demo/chart.js/Chart.min.js"/>"></script>

<!-- Page level custom scripts -->
<script src="<s:url value="/ds-framework/js/ds-chart.js"/>"></script>

<%@ include file = "./common-header-char-bottom.jsp" %>
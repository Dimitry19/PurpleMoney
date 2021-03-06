<!-- Footer -->
<s:set var="currentUs" value="%{currentUser}"/>
<footer class="page-footer font-small unique-color-dark">
    <div class ="bar-footer">
        <div class="container">
            <!-- Grid row-->
            <div class="row py-4 d-flex align-items-center">
                <!-- Grid column -->
                <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                    <h6 class="mb-0"><s:text name="footer.contact.social"></s:text></h6>
                </div>
                <!-- Grid column -->
                <!-- Grid column -->
                <div class="col-md-6 col-lg-7 text-center text-md-right">
                    <!-- Facebook -->
                    <a href="https://www.facebook.com/XlionD" class="fb-ic">
                        <i class="fa fa-facebook-square white-text mr-4"> </i>
                    </a>
                    <!-- Twitter -->
                    <a class="tw-ic" href="https://twitter.com/DXlionaire">
                        <i class="fa fa-twitter white-text mr-4"> </i>
                    </a>
                    <!-- Google +-->
                    <a class="gplus-ic" href="https://plus.google.com/u/0/104372700159542371601">
                        <i class="fa fa-google white-text mr-4"> </i>
                    </a>
                    <!--Linkedin -->
                    <a class="li-ic" href="https://www.linkedin.com/in/dimitri-sime-ndjouomo-74804337/">
                        <i class="fa fa-linkedin white-text mr-4"> </i>
                    </a>
                    <!--Instagram-->
                   <a class="ins-ic" href="https://www.instagram.com/lion_dx">
                        <i class="fa fa-instagram white-text"> </i>
                    </a>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row-->
        </div>
    </div>
    <!-- Footer Links -->
    <div class="container text-center text-md-left mt-5">
        <!-- Grid row -->
        <div class="row mt-3">
            <!-- Grid column -->
            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                <!-- Content -->
                <h6 class="text-uppercase font-weight-bold">PurpleMoney</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <%--<p>Here you can use rows and columns here to organize your footer content. Lorem ipsum dolor sit amet, consectetur
                    adipisicing elit.</p>--%>
            </div>
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                <!-- Links -->
                <h6 class="text-uppercase font-weight-bold">Useful links</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p><a href="<s:url action="login"/>"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;<s:text name="footer.link.login"></s:text></a></p>
                <p><a href="#!"><i class="fa fa-hand-paper-o"></i>&nbsp;<s:text name="footer.link.help"></s:text></a></p>
                <p><a href="<s:url action="gmapAction"/>"><i class="fa fa-map"></i>&nbsp;<s:text name="footer.link.map"></s:text></a></p>
            </div>
            <!-- Grid column -->
            <!-- Grid column -->
            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                <!-- Links -->
                <h6 class="text-uppercase font-weight-bold">Contact</h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <i class="fa fa-home"></i>&nbsp;Via la Spezia 123,43126 PR,IT</p>
                <p>
                    <i class="fa fa-envelope"></i>&nbsp;info@purplemoney.com</p>
                <p>
                    <i class="fa fa-phone"></i>&nbsp;+ 01 234 567 88
                </p>
            </div>
            <!-- Grid column -->
        </div>
        <!-- Grid row -->
    </div>
    <!-- Footer Links -->
    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">&copy;2019 Copyright:
        <a href="https://mdbootstrap.com/education/bootstrap/"> Purplemoney.com</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->

<%@ taglib prefix="s" uri="/struts-tags" %>
<s:include value="include/expired-header.jsp"/>
</head>
<html>
 <body> 
  <div class="main"> 
   <h1><span><s:text name="common.page.title"/></span></h1>
   <div class="w3_agile_main_grid">
    <h2><s:text name="authentication.text.session-terminated"/></h2>
    <p><s:text name="authentication.text.go-to-login"/></p>
    <a href="<s:url action="login"/>">
     <s:submit  type="button"   id="btnLogin" cssClass="btn btn-sm btn-primary btn-login"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;<s:text name="footer.link.login"/></s:submit>
    </a>
    <div class="agileits_w3layouts_main_grids"> 
     <div class="w3_agileits_main_grid_left"> 
      <ul class="wthree_nav"> 
       <li><a class="vrt" href="<s:url action="login"/>"><i class="fa fa-sign-in"></i><s:text name="footer.link.login"/></a></li>
       <li><a class="rge" href="<s:url action="login"/>"><i class="fa-hand-paper-o"></i><s:text name="footer.link.about"/></a></li>
       <li><a class="jne" href="<s:url action="login"/>"><i class="fa fa-envelope"></i><s:text name="footer.link.contact"/></a></li>
       <li><a class="rge" href="<s:url action="gmapAction"/>"><i class="fa fa-map"></i>&nbsp;<s:text name="footer.link.map"></s:text></a></li>
      </ul> 
     </div>
     <s:include value="include/socials.jsp"/>
     <div class="clear"> 
     </div> 
    </div> 
   </div>
   <s:include value="include/version-application.jsp"/>
  </div>  
 </body>
</html>
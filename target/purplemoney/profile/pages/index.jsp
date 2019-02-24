<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- Using Struts2 Tags in JSP --%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<title>PURPLE MONEY - Login Page</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1 class="text-center">
				<p class="text-primary text-center">PURPLE MONEY - Welcome</p>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
		  <div class="col-sm-2">
<!-- 2 empty sections in the left -->
    </div>
      <div class="col-sm-8">
      		<s:form action="loginAction " theme="simple" cssClass="well form-search">
				<div class="form-group">
					<s:textfield  placeholder="Login" name="user.username" class="form-control" label="Username" tooltip="Enter your Name here"/>
				</div>	 	
	    			<div class="form-group">
	    				<s:password placeholder="Password" name="user.password" class="form-control" label="Password" />
	    			</div>
	    			<s:submit value="Entrer" cssClass="btn btn-primary"/>
			</s:form>
    	  </div>
      <div class="col-sm-2">
<!-- 2 empty sections in the left -->
    </div>
			
		</div>
			
	</div>
</body> 
<div class="col">
	<%@ include file = "/../common/footers/footer.jsp" %>
</div> 


</html>
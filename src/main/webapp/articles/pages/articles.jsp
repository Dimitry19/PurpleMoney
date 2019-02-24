<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
 
<script>
$(document).ready(function() { 
	var table = $('#articles').DataTable( { 
			"aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
	        "iDisplayLength": 5,
	        "responsive": true,
	        "columnDefs": [
	            { width: 250, targets: 0 },
	            { width: 350, targets: 1},
	            { width: 200, targets: 2 },
	            { width: 200, targets: 3 },
	            { width: 200, targets: 4 },
	            { width: 200, targets: 5 }
	        ]
	        //lengthChange: false,
			//buttons: [ 'copy', 'excel', 'pdf', 'colvis' ]
		} );
		//table.buttons().container().appendTo( '#example_wrapper .col-md-6:eq(0)' ); } );
	});
</script>
<style type="text/css">
	.bs-example{
   	 	margin: 20px;
    }
</style>

<title>PURPLE MONEY</title>
</head>
 
<body>
	<div class="container">
		<div class="row">
			<h1>
				<p class="text-primary text-center">PURPLE MONEY</p>
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col bs-example">
		<%@ include file="../../common/menu/menu2.jsp" %>
		</div>
		
	</div>
	<div class="container" >
		<div class="row">
			<s:actionerror theme="bootstrap"/>
	        <s:actionmessage theme="bootstrap"/>
	        <s:fielderror theme="bootstrap"/>
		</div>
		<div class="row">
			<div class="col-sm-4">
			</div>	
			<div class="col-sm-4">
				<s:form action="addArticleAction" theme="bootstrap" cssClass="form-horizontal well form-search"  label="Ajout d'article">
			 		<div class="form-group  input-group-sm mb-3"><s:textfield name="article.id.itemCode" label="Code article" value="" /></div>
			  		<div class="form-group  input-group-sm mb-3"><s:textfield name="article.price" label="Prix" value="" /></div>
			  		<div class="form-group  input-group-sm mb-3"><s:textfield name="article.quantity" label="Quantite" value="" /></div>
			  		<div class="form-group  input-group-sm mb-3"><s:textfield name="article.id.category" label="Categorie" value="" /></div>
			  		<div class="form-group  input-group-sm mb-3"><s:textarea name="article.description" label="Description" value="" cols="50" rows="3" /></div>
			  		<s:submit value="Ajouter" cssClass="btn btn-primary pull-right"></s:submit>
				</s:form>
			</div>
				<div class="col-sm-4">
				<s:form action="addArticleAction" theme="bootstrap" cssClass="form-horizontal well form-search"  label="Ajout d'article">
			 		<div class="form-group  input-group-sm mb-3"><s:textfield name="article.id.itemCode" label="Code article" value="" /></div>
			  		<div class="form-group  input-group-sm mb-3"><s:textfield name="article.price" label="Prix" value="" /></div>
			  		<div class="form-group  input-group-sm mb-3"><s:textfield name="article.quantity" label="Quantite" value="" /></div>
			  		<div class="form-group  input-group-sm mb-3"><s:textfield name="article.id.category" label="Categorie" value="" /></div>
			  		<div class="form-group  input-group-sm mb-3"><s:textarea name="article.description" label="Description" value="" cols="50" rows="3" /></div>
			  		<s:submit value="Ajouter" cssClass="btn btn-primary pull-right"></s:submit>
				</s:form>
			</div>		
		</div>
	   		
	
	</div>
	<%-- <div class="container" >
		<%@ include file = "buttons/articles-buttons.jsp" %>
	</div>
	<div class="col">
		<%@ include file = "includes/articles-list.jsp" %>			
	 </div> --%>
<br/>
<br/>
</body>
<div class="col">
	<%@ include file = "/../common/footers/footer.jsp" %>
</div> 
</html>
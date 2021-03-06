<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
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
	var table = $('#amounts').DataTable( {
			"aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
	        "iDisplayLength": 5,
	        "responsive": true,
	        "columnDefs": [
	            { width: 250, targets: 0 },
	            { width: 350, targets: 1},
	            { width: 200, targets: 2 },
	            { width: 200, targets: 3 },
	            { width: 200, targets: 4 }
	        ]
	        //lengthChange: false,
			//buttons: [ 'copy', 'excel', 'pdf', 'colvis' ]
		} );
		//table.buttons().container().appendTo( '#example_wrapper .col-md-6:eq(0)' ); } );
	});
</script>
</head>
	<div class="container">
		<div class="row">
			<h1>
				<p class="text-primary text-center">PURPLE MONEY</p>
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col bs-example">
		<%@ include file="../../../common/menu/menu2.jsp" %>
		</div>		
	</div>
	<div class="container-fluid">
		<s:if test="amounts!=null && amounts.size() > 0">
			<div class="panel panel-primary">
			   <div class="panel-heading">
			   		<h3 class="panel-title">Toutes les cotisations</h3>
			   </div>  
				<table class="table table-hover table table-striped table-bordered table-condensed table-responsive"  id="amounts">
						<thead class="thead-light">
							<tr>
								<th>Membre</th>
								<th>Montant</th>
								<th>Beneficiare 1</th>
								<th>Beneficiare 2</th>
								<th>Date d'insertion</th>
							</tr>
						</thead>
						<s:iterator value="amounts" status="userStatus">
							<tr>
								<td><s:property value="id.member"/></td>
								<td><s:property value="amount"/></td>
								<td><s:property value="receiverOne.surname"/></td>
								<td><s:property value="receiverTwo.surname"/></td>
								<td><s:date name="id.date" format="dd/MM/yyyy" /></td>
							</tr>
						</s:iterator>
					</table>
				</div>	
		</s:if>
</div>
<div class="col">
	<%@ include file = "/../common/footers/footer.jsp" %>
</div> 


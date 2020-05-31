<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
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
	<sx:head/>
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
			<div class="col-sm-2">
			</div>	
			<div class="col-sm-8">
				<s:form action="addAmountAction" theme="bootstrap" cssClass="form-horizontal well form-search"  label="Tontine">
					<div class="form-group  input-group">
						<s:select
							tooltip="Choisir le groupe"
							label="Groupe"
							id="gruppo"
							list="groups" listKey="id" listValue="%{description}"
							name="amount.id.amountId"
							emptyOption="false"
							headerKey="None"
							headerValue="---------- Please Select ----------"/>
					</div>
					<div class="form-group  input-group">
						<s:select
							tooltip="Choisir le premier beneficiare"
							label="Beneficiaire 1"
							id="member" list="members" listKey="id.name" listValue="%{id.name + ' ' + surname}"
							name="amount.id.member"
							emptyOption="true"
							headerKey="None"
							headerValue="---------- Please Select ----------"/>
					</div>
			  		<div class="form-group  input-group">
						<s:textfield key="netpl" value="%{getText('format.money',netpl)}" />
						<s:textfield name="amount.amount" label="Montant"  javascriptTooltip="" cssClass="form-control"/>
						<span class = "input-group-addon">€</span>
					</div>
					<%--<div class="form-group  input-group">
						<sx:datetimepicker name="amount.receiverTwo.id.date"
										   label="Select Date"
										   displayFormat="dd-MMM-yyyy" />
					</div>--%>
					<div class="form-group  input-group">
						<s:select
							tooltip="Choisir le premier beneficiare"
							label="Beneficiaire 1"
							id="member1" list="members" listKey="id.name" listValue="%{id.name + ' ' + surname}"
							name="amount.receiverOne.id.name"
							emptyOption="true"
							headerKey="None"
							headerValue="---------- Please Select ----------"/>
					</div>
					<div class="form-group  input-group">
						<s:select
							tooltip="Choisir le second beneficiare"
							label="Beneficiaire 2"
							id="member2"
							list="members" listKey="id.name" listValue="%{id.name + ' ' + surname}"
							name="amount.receiverTwo.id.name"
							emptyOption="true"
							headerKey="None"
							headerValue="---------- Please Select ----------"/>
					</div>
					<s:submit value="Ajouter" cssClass="btn btn-primary pull-right"></s:submit>
				</s:form>
			</div>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<div class="container" >
		<%@ include file = "buttons/amounts-buttons.jsp" %>
	</div>
	<%-- <div class="col">
		<%@ include file = "includes/articles-list.jsp" %>			
	 </div> --%>
<br/>
<br/>
</body>
<div class="col">
	<%@ include file = "/../common/footers/footer.jsp" %>
</div> 
</html>
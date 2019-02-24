<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<s:include value="../../../common/home/include/common.jsp"/>
<div class="container">
	<div class="row">
		<h1>
			<a class="nav-link" href="#">PURPLE MONEY</a>
		</h1>
	</div>
</div>
<%@ include file="../../../common/menu/menu.jsp" %>
 
<script>
$(document).ready(function() { 
	var table = $('#members').DataTable( {
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
		<s:if test="members!=null && members.size() > 0">
			<div class="table-responsive">
				<table class="table table-striped table-hover table-bordered"  id="members">
						<thead class="black white-text">
							<tr>
								<th>Nom</th>
								<th>Prenom</th>
								<th>Numero telephone</th>
								<th>E-mail</th>
								<th>Role</th>
								<%--<th>Date d'insertion</th>--%>
							</tr>
						</thead>
					<tbody class="">
						<s:iterator value="members" status="userStatus">
							<tr>
								<td class="text-center"><s:property value="id.name"/></td>
								<td class="text-center"><s:property value="surname"/></td>
								<td class="text-center"><s:property value="phone"/></td>
								<td class="text-center"><s:property value="email"/></td>
								<td class="text-center"><s:property value="role"/></td>
								<%--<td><s:date name="createdDate" format="dd/MM/yyyy" /></td>--%>
							</tr>
						</s:iterator>
					</tbody>
					</table>
				</div>	
		</s:if>
</div>
<div class="col">
	<%@ include file = "../../../common/footers/footer.jsp" %>
</div> 


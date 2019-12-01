var DataTableManager;
DataTableManager = function () {
	var printCounter;
	var modal='<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'+
		'<div class="modal-dialog" role="document">'+
		'<div class="modal-content">'+
		'<div class="modal-header">'+
		'<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>'+
		'<h4 class="modal-title modal-title-custom" id="myModalLabel"><s:text name="common.show.detail"></s:text></h4>'+
		'</div>'+
		'<div class="modal-body">'+
		'<div class="insertHere"></div>'+
		'</div><div class="modal-footer">'+
		'<button type="button" class="btn  btn-md btn btn-secondary buttons-collection  buttons-page-length" data-dismiss="modal">'+
		'<i class="fa fa-times-circle"></i>&nbsp;<s:text name="common.label.btn.close"></s:text>'+
	'</button>'+
	'</div>'+
	'</div>'+
	'</div>'+
	'</div>';

	var languages={
		italian:{
			"sEmptyTable":     "Nessun dato presente nella tabella",
			"sInfo":           "Vista da _START_ a _END_ di _TOTAL_ elementi",
			"sInfoEmpty":      "Vista da 0 a 0 di 0 elementi",
			"sInfoFiltered":   "(filtrati da _MAX_ elementi totali)",
			"sInfoPostFix":    "",
			"sInfoThousands":  ".",
			"sLengthMenu":     "Visualizza _MENU_ elementi",
			"sLoadingRecords": "Caricamento...",
			"sProcessing":     "Elaborazione...",
			"sSearch":         "Cerca:",
			"sZeroRecords":    "La ricerca non ha portato alcun risultato.",
			"oPaginate": {
				"sFirst":      "Inizio",
				"sPrevious":   "Precedente",
				"sNext":       "Successivo",
				"sLast":       "Fine"
			},
			"oAria": {
				"sSortAscending":  ": attiva per ordinare la colonna in ordine crescente",
				"sSortDescending": ": attiva per ordinare la colonna in ordine decrescente"
			},"select": {
				"rows": {
					_: "| %d righe selezionate",
					0: "| nessuna riga selezionata",
					1: "| 1 riga selezionata"
				}
			}
		},
		french:{
			"sProcessing":     "Traitement en cours...",
			"sSearch":         "Rechercher&nbsp;:",
			"sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
			"sInfo":           "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
			"sInfoEmpty":      "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
			"sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
			"sInfoPostFix":    "",
			"sLoadingRecords": "Chargement en cours...",
			"sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
			"sEmptyTable":     "Aucune donn&eacute;e disponible dans le tableau",
			"oPaginate": {
				"sFirst":      "Premier",
				"sPrevious":   "Pr&eacute;c&eacute;dent",
				"sNext":       "Suivant",
				"sLast":       "Dernier"
			},
			"oAria": {
				"sSortAscending":  ": activer pour trier la colonne par ordre croissant",
				"sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
			},
			"select": {
				"rows": {
					_: "| %d lignes séléctionnées",
					0: "| Aucune ligne séléctionnée",
					1: "| 1 ligne séléctionnée"
				}
			}
		}
	};



	function buildDatatable(json) {

		var idDataTable='#'+json.idDataTable;
		var titlePage=json.title;
		var lang=json.lang;
		var positionDate=json.positionDate;



		var options={

			dom: 'Bfrtip',
			select: true,
			responsive: true,
			colReorder: true,

			//scrollY:        400,
			//deferRender:    true,
			//scroller:       true,
			//"sPaginationType": "four_button", //
			//aoColumns:orderDateColumn,

/*
			columnDefs: [
				{
					// adding a more info button at the end
					targets: -1,
					data: null,
					defaultContent: "<button type='button'  data-toggle='tooltip' data-placement='top' title='Details Info' onclick='DataTableManager.editRow(this)' class='btn blue-hoki btn-icon-only btn-primary tooltips edit-btn'>" +
					"<i class='fa fa-edit' aria-hidden='true'></i>&nbsp;</button>"
				},
					{
						targets: 4,
						createdCell:  function (td, cellData, rowData, row, col) {

							var datestamp = new Date(cellData);
							console.log(datestamp);
							$(td).html( (datestamp.getUTCMonth()+1) +'/'+datestamp.getUTCDate()+'/' + datestamp.getFullYear());
						}
					}
		],*/
			buttons: [
				{
					extend:'copyHtml5',
					//text: '<u>C</u>opy',
					text:      '<i class="fa fa-clipboard"></i>',
					className: 'btn btn-app export perso-copy barras',
					title:titlePage,
					key: {
						key: 'c',
						altKey: true
					}
				},
				{
					extend: 'excelHtml5',
					text: '<i class="fas fa-file-excel"></i>',
					messageTop: 'PurpleMoney',
					autoFilter: true,
					sheetName: 'Exported data _'+titlePage,
					title:titlePage,
					className: 'btn btn-app perso-excel export excel',
					exportOptions: {
						columns: ':visible'
					},
					customize: function(xlsx) {
						var sheet = xlsx.xl.worksheets[titlePage+'_sheet1.xml'];

						// Loop over the cells in column `B`
						$('row c[r^="D"]', sheet).each( function () {
							// Get the value
							if ( $('is t', this).text() == 'Accountant' ) {
								$(this).attr( 's', '20' );
							}
						});
					}
				},
				{
					extend: 'csvHtml5',
					text:      '<i class="fas fa-file-csv"></i>',
					messageTop: 'The information in this table is copyright to Dimitri S.',
					title:titlePage,
					className: 'btn btn-app perso-csv export csv',
					exportOptions: {
						columns: ':visible'
					}
				},
				{
					extend: 'pdfHtml5',
					text:      '<i class="fas fa-file-pdf"></i>',
					messageBottom: 'PDF',
					title:titlePage,
					className: 'btn btn-app perso-pdf export pdf',
				},
				{
					extend: 'print',
					text:      '<i class="fas fa-print"></i>',
					title:titlePage,
					className: 'btn btn-app perso-print export print',
					messageTop: function () {
						printCounter++;

						if ( printCounter === 1 ) {
							return 'This is the first time you have printed this document.';
						}
						else {
							return 'You have printed this document '+printCounter+' times';
						}
					},
					messageBottom: 'Print'
				},
				//'colvis' // pour la visibité des colonnes
			]/*,
		columnDefs: [ {
		targets: 4,
		render: $.fn.dataTable.render.percentBar( 'round','#FFF', '#269ABC', '#31B0D5', '#286090', 1, 'groove' )
		},
		{
		targets: 2,
		render: $.fn.dataTable.render.percentBar()
	}]*/
		}
		$(document).ready(function() {

			if(lang == 'it'){
				options.language=languages.italian;
			}

			if(lang == 'fr'){
				options.language=languages.french;
			}
			var orderDateColumn;
			if(positionDate===9){
				orderDateColumn=[null,null,null,null,null,null,null,null,{ "sType": "eu_date" },{ "sType": "eu_date" }];
			}
			if(positionDate===4){
				orderDateColumn=[null,null,null,null,{ "sType": "eu_date" }];
			}
			if(positionDate===0){
				var table=$(idDataTable).DataTable( options);
			}else{
				options.aoColumns=orderDateColumn;
				var table=$(idDataTable).DataTable( options);
			}

			buildDataToModal(idDataTable,table);
		});

	}


	function buildDataToModal(idDataTable,table){

		var tbo=idDataTable+' tbody';

		$(tbo).on('click', '.edit-btn', function (){
		 //$(tbo).on('click', 'button', function() {
		//var data = table.row($(this).parents('tr')).data(); // getting target row data
		//$(tbo).on('click', 'tr', function () { //work!
			var data = table.row( this ).data();

			var header0 = $(table.column( 1 ).header()).html();
			var header1 = $(table.column( 1 ).header()).html();
			var header2 = $(table.column( 2 ).header()).html();
			var header3 = $(table.column( 3 ).header()).html();
			var header4 = $(table.column( 4 ).header()).html();
			var header5 = $(table.column( 5 ).header()).html();
			var header6 = $(table.column( 6 ).header()).html();
			var header7 = $(table.column( 7 ).header()).html();


			var HTML_MODAL_TABLE= '<table class="table dtr-details" width="100%">' +
				'<tbody>' +
				'<tr>' +
				'<td style="font-style:italic;color: mediumvioletred;">'+header0+'<td>' +
				'<td>' + data[0] + '</td>' +
				'</tr>' +
				'<tr>' +
				'<td  style="font-style: italic;color: mediumvioletred;">'+header1+'<td>' +
				'<td>' + data[1] + '</td>' +
				'</tr>' +
				'<tr>' +
				'<td style="font-style: italic;color: mediumvioletred;">'+header2+'<td>' +
				'<td>' + data[2] + '</td>' +
				'</tr>' +
				'<tr>' +
				'<td  style="font-style: italic;color: mediumvioletred;">'+header3+'<td>' +
				'<td>' + data[3] + '</td>' +
				'</tr>' +
				'<tr>' +
				'<td style="font-style: italic;color: mediumvioletred;">'+header4+'<td>' +
				'<td>' + data[4] + '</td>' +
				'</tr>' +
				'<tr>' +
				'<td style="font-style: italic;color: mediumvioletred;">'+header5+'<td>' +
				'<td>' + data[5] + '</td>' +
				'</tr>' +
				'<tr>' +
				'<td style="font-style: italic;color: mediumvioletred;">'+header6+'<td>' +
				'<td>' + data[6] + '</td>' +
				'</tr>' +
				'<tr>' +
				'<td style="font-style: italic;color: mediumvioletred;">'+header7+'<td>' +
				'<td>' + data[7] + '</td>' +
				'</tr>' +
				'</tbody>' + '</table>';
			$('.insertHere').html(HTML_MODAL_TABLE);
			$('#myModal').modal('show'); // calling the bootstrap modal
		});
	}




	function removeRow(el){
		//rimozione tr
		var ulId = $(el).attr('id').replace('_delBtn');

		//$('#members').DataTable().row($(el).closest('tr')).remove().draw();

	}

	function editRow(el) {
		var value=$(el).val();
		alert("MODAL"+value);
	}

	function constructDatatable(jsonObj) {
		buildDatatable(jsonObj)
	}

	return {
		constructDatatable:function(jsonObj){
			constructDatatable(jsonObj);
		},
		reloadDatatable:function (jsonObj) {
			//reloadDatatable(jsonObj)
		},
		editRow:function (el) {
			editRow(el);
		},
		removeRow:function () {
			removeRow(elt);
		}
	}
}();




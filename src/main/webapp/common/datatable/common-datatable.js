var DataTableManager;
DataTableManager = function () {

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
					_: "%d lignes séléctionnées",
					0: "Aucune ligne séléctionnée",
					1: "1 ligne séléctionnée"
				}
			}
		}
	};


	function buildDatatable(json) {



		console.log("DataTableManager");
		var idDataTable='#'+json.idDataTable;
		var titlePage=json.title;
		var lang=json.lang;



		var options={

			dom: 'Bfrtip',
			select: true,
			responsive: true,
			colReorder: true,
			//scrollY:        400,
			//deferRender:    true,
			//scroller:       true,
			//"sPaginationType": "four_button", //
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
						var sheet = xlsx.xl.worksheets['sheet1.xml'];

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
					messageTop: 'The information in this table is copyright to Sirius Cybernetics Corp.',
					title:titlePage,
					className: 'btn btn-app perso-csv export csv',
					exportOptions: {
						columns: ':visible'
					}
				},
				{
					extend: 'pdfHtml5',
					text:      '<i class="fas fa-file-pdf"></i>',
					messageBottom: null,
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
					messageBottom: null
				},
				'colvis'
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

			var table=$(idDataTable).DataTable( options);
		});

	}



	function constructDatatable(jsonObj) {
		buildDatatable(jsonObj)
	}

	return {
		constructDatatable:function(jsonObj){
			constructDatatable(jsonObj);
		},
		reloadDatatable:function (jsonObj) {
			reloadDatatable(jsonObj)
		},
		changeLanguage:function (jsonObj) {
			changeLang(jsonObj);

		}
	}
}();




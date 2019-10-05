var DataTableManager;
DataTableManager = function () {
	var idioma=
		{
			"sProcessing":     "Procesando...",
			"sLengthMenu":     "Mostrar _MENU_ registros",
			"sZeroRecords":    "No se encontraron resultados",
			"sEmptyTable":     "NingÃºn dato disponible en esta tabla",
			"sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
			"sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
			"sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
			"sInfoPostFix":    "",
			"sSearch":         "Buscar:",
			"sUrl":            "",
			"sInfoThousands":  ",",
			"sLoadingRecords": "Cargando...",
			"oPaginate": {
				"sFirst":    "Primero",
				"sLast":     "Ãšltimo",
				"sNext":     "Siguiente",
				"sPrevious": "Anterior"
			},
			"oAria": {
				"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
				"sSortDescending": ": Activar para ordenar la columna de manera descendente"
			},
			"select": {
				"rows": {
					_: "%d righe selezionate",
					0: "nessuna riga selezionata",
					1: "1 riga selezionata"
				}
			},
			"buttons": {
				"copyTitle": 'Informacion copiada',
				"copyKeys": 'Use your keyboard or menu to select the copy command',
				"copySuccess": {
					"_": '%d filas copiadas al portapapeles',
					"1": '1 fila copiada al portapapeles'
				},

				"pageLength": {
					"_": "Mostrar %d filas",
					"-1": "Mostrar Todo"
				}
			}
		};

	var fr=

		{
			"sProcessing":     "Execution en cours...",
			"sLengthMenu":     "Montrer_MENU_ records",
			"sZeroRecords":    "Aucun resultat trouvé",
			"sEmptyTable":     "Aucune donnée disponible dans la table",
			"sInfo":           "Affichage des records de _START_ a _END_ sur un total de _TOTAL_ records",
			"sInfoEmpty":      "Montre  0 al 0 de un total de 0 records",
			"sInfoFiltered":   "(filtre sur  un total de _MAX_ records)",
			"sInfoPostFix":    "",
			"sSearch":         "Recherche:",
			"sUrl":            "",
			"sInfoThousands":  ",",
			"sLoadingRecords": "Chargement...",
			"oPaginate": {
				"sFirst":    "Premier",
				"sLast":     "Dernier",
				"sNext":     "Suivant",
				"sPrevious": "Precedent"
			},
			"oAria": {
				"sSortAscending":  ": Activer pour ordonner la colonne de maniere croissante",
				"sSortDescending": ": Activer pour ordonner la colonne de maniere  decroissante"
			},"select": {
				"rows": {
					_: "%d lignes séléctionnées",
					0: "Aucune ligne séléctionnée",
					1: "1 ligne séléctionnée"
				}
			},
			"buttons": {
				"copyTitle": 'Donnée copiée',
				"copyKeys": 'Utiliser la commande du  clavier (Ctrl+c) pour effectuer la copie',
				"copySuccess": {
					"_": '%d lignes copiées dans le presse-papiers',
					"1": '1 ligne copiée dans le presse-papier'
				},

				"pageLength": {
					"_": "Montrer %d lignes",
					"-1": "Montrer Tout"
				}
			}
		};


	var en = {
		"sLengthMenu": "Display _MENU_ records per page",
		"sZeroRecords": "Nothing found - sorry",
		"sInfo": "Showing _START_ to _END_ of _TOTAL_ records",
		"sInfoEmpty": "Showing 0 to 0 of 0 records",
		"sInfoFiltered": "(filtered from _MAX_ total records)"
	};

	var it={

		"sProcessing":     "Esecuzione in corso...",
		"sLengthMenu":     "Mostrare_MENU_ records",
		"sZeroRecords":    "Nessun risultao",
		"sEmptyTable":     "Nessun dato disponibile ",
		"sInfo":           "Mostra  _START_ a _END_ su un totale di _TOTAL_ records",
		"sInfoEmpty":      "Mostra  0 al 0 di un totale di 0 records",
		"sInfoFiltered":   "(filtra su  un totale di _MAX_ records)",
		"sInfoPostFix":    "",
		"sSearch":         "Ricerca:",
		"sUrl":            "",
		"sInfoThousands":  ",",
		"sLoadingRecords": "Caricamento...",
		"oPaginate": {
			"sFirst":    "Primo",
			"sLast":     "Ultimo",
			"sNext":     "Seguente",
			"sPrevious": "Precedente"
		},
		"oAria": {
			"sSortAscending":  ": Attivare per ordinare la colonna in modo crescente",
			"sSortDescending": ": Attivare per ordinare la colonna in modo decrescente"
		},
		"buttons": {
			"copyTitle": 'Dato copiato',
			"copyKeys": 'Utilizzare  la combinazione della tastiera (Ctrl+c) per effettuare la copia',
			"copySuccess": {
				"_": '%d righe copiate ',
				"1": '1 riga copiata'
			},

			"pageLength": {
				"_": "Mostra %d righe",
				"-1": "Mostra Tutto"
			}
		}
	};



	function buildDatatable(json) {
		console.log("DataTableManager");
		var idDataTable='#'+json.idDataTable;
		var titlePage=json.title;
		var lang=json.lang;

		var  colorRow= function( row, data, dataIndex ) {
			console.log(data[6] );
			console.log(data[7] );

			if ( data[6] =='Non' || data[6] =='No') {
				$(row).addClass('darkseagreen');
			}
			if (data[7].length > 1) {
				$(row).addClass('sanction');
			}
			if (data[7].length > 1 && (data[6] =='Non' || data[6] =='No')) {
				$(row).addClass('sanction-inactive');
			}
		}


		var options={
			scrollY: '200',
			scrollX: true,
			paging: true,
			lengthChange: true,
			searching: true,
			ordering: true,
			info: true,
			autoWidth: true,
			"createdRow":colorRow,
			responsive: true, /*{
                         details: {
                             type: 'column',
                             target: 'tr',
                             display: $.fn.dataTable.Responsive.display.modal( {
                                header: function ( row ) {
                                        var data = row.data();
                                        var html=''+data[1]+' '+data[2]+'';

                                        //return 'Details for :'+data[1]+' '+data[2];
                                    return 'Details for :['+html+']';
                                }
                            } ),
                    renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                        tableClass: 'table'
                    })
                }
            },*/
			lengthMenu: [[5,10,20, -1],[5,10,50,"Montrer Tout"]],
			dom: 'Bfrt<"col-md-6 inline"i> <"col-md-6 inline"p>',
			columnDefs: [{
				targets: [4],
				visible: true
			},
				{
					targets: [5],
					visible: false
				},
				{
					targets: [6],
					visible: false
				},
				{
					targets: [7],
					visible: true
				}, {
					// adding a more info button at the end
					targets: -1,
					data: null,
					defaultContent: "<button type='button'  data-toggle='tooltip' data-placement='top' title='Details Info' class='btn  btn-md btn perso-eye buttons-collection showDetails buttons-page-length'>" +
					"<i class='fa fa-eye' aria-hidden='true'></i>&nbsp;</button>"
				}],
			buttons: {
				dom: {
					container:{
						tag:'div',
						className:'flexcontent'
					},
					buttonLiner: {
						tag: null
					}
				},

				buttons: [
					{
						extend:    'copyHtml5',
						text:      '<i class="fa fa-clipboard"></i>',
						className: 'btn btn-app export perso-copy barras',
						exportOptions: {
							columns: ':visible'
						}
					},

					{
						extend:    'pdfHtml5',
						text:      '<i class="fa fa-file-pdf-o"></i>',
						title:titlePage,
						className: 'btn btn-app perso-pdf export pdf',
						exportOptions: {
							columns: ':visible'
						},
						customize:function(doc) {
							doc.styles.title = {
								color: '#4c8aa0',
								fontSize: '30',
								alignment: 'center'
							}
							doc.styles['td:nth-child(2)'] = {
								width: '100px',
								'max-width': '100px'
							},
								doc.styles.tableHeader = {
									fillColor:'#4c8aa0',
									color:'white',
									alignment:'center'
								},
								doc.content[1].margin = [ 100, 0, 100, 0 ]
						}
					},

					{
						extend:    'excelHtml5',
						text:      '<i class="fa fa-file-excel-o"></i>',
						title:titlePage,
						className: 'btn btn-app perso-excel export excel',
						exportOptions: {
							columns: ':visible'
						},
					},
					{
						extend:    'csvHtml5',
						text:      '<i class="fa fa-file-text-o"></i>',
						title:titlePage,
						className: 'btn btn-app perso-csv export csv',
						exportOptions: {
							columns: ':visible'
						}
					},
					{
						extend:    'print',
						text:      '<i class="fa fa-print"></i>',
						title:titlePage,
						className: 'btn btn-app perso-print export print',
						exportOptions: {
							columns: ':visible'
						}
					},
					{
						extend:    'pageLength',
						titleAttr: 'Record  a montrer',
						className: 'selectTable'
					}/*,
                        {
                            extend:'colvis',
                            text:'Activer la visibilité des colonnes',
                            titleAttr:'Activer la visibilité des colonnes',
                            className:'btn   enableBtn'
                        }*/
				]
			}

		}

		$(document).ready(function() {

			if(lang == 'it'){
				options.language=it;
			}
			if(lang == 'en'){
				options.language=en;
			}
			if(lang == 'fr'){
				options.language=fr;
			}

			var table=$(idDataTable).DataTable( options);



			table.columns().every( function () {
				// Column data
				// console.log("Data:", this.data() );

				// Column visibility
				//console.log("Visibility:", this.visible() );

				// Column header
				//console.log("Header:", $(this.header()).text() );
			} );

			var tbo=idDataTable+' tbody';


			// $(tbo).on('click', 'button', function() {
			//var data = table.row($(this).parents('tr')).data(); // getting target row data
			$(tbo).on('click', 'tr', function () {
				var data = table.row( this ).data();

				var header0 = $(table.column( 0 ).header()).html();
				var header1 = $(table.column( 1 ).header()).html();
				var header2 = $(table.column( 2 ).header()).html();
				var header3 = $(table.column( 3 ).header()).html();
				var header4 = $(table.column( 4 ).header()).html();
				var header5 = $(table.column( 5 ).header()).html();
				var header6 = $(table.column( 6 ).header()).html();
				var header7 = $(table.column( 7 ).header()).html();


				var HTML_TABLE= '<table class="table dtr-details" width="100%">' +
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
				$('.insertHere').html(HTML_TABLE);
				$('#myModal').modal('show'); // calling the bootstrap modal
			});
		} );
	}

	/*$(document).ready( function () {
		var table = $('#example').DataTable({
			select: true,
			responsive: {
				details: {
					type: 'column',
					target: 'tr', //THIS WORKS GREAT IN RESPONSIVE VIEW
					display: $.fn.dataTable.Responsive.display.modal( {
						header: function ( row ) {
							var data = row.data();
							return 'Details for '+data[0]+' '+data[1];
						}
					}),
					renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
						tableClass: 'table'
					})
				}
			}
		}).on( 'select', function ( e, dt, type, indexes ) {
			//if not responsive view launch responsive modal
		});
	});*/






	function constructDatatable(jsonObj) {
		buildDatatable(jsonObj)
	}

	function controlLanguage(lang) {

		if(lang == 'it'){
			options.language=it;

		}
		if(lang == 'en'){
			options.language=en;

		}
		if(lang == 'fr'){
			options.language=fr;
		}
		return options;

	}
	function reloading(json) {
		console.log("reloading");
		var idDataTable='#'+json.idDataTable;
		$(idDataTable).DataTable().draw();
	}



	function changeLanguages(json) {
		$(document).ready(function() {

			var idDataTable='#'+json.idDataTable;
			var btn='#'*json.btn;
			var lang=json.lang;



			$(btn).click(function(){
				dtable.fnDestroy();
				dtable = null;
				$(idDataTable).DataTable( controlLanguage(lang) );
			});

		} );
	}
	function reloadDatatable(jsonObj) {
		reloading(jsonObj);

	}

	function changeLang(jsonObj) {
		changeLanguages(jsonObj);

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




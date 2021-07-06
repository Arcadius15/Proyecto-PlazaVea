function asignar(ordenid){
	Swal.fire({
		title: '<strong>Asignarse como Transportista<strong>',
		icon: 'info',
		html:
			'Direcci\u00F3n de Entrega: ' + $("#dir"+ordenid).html() + '<br>' +
			'Fecha de Compra: ' + $("#fecha"+ordenid).html() + '<br>' +
			'Fecha De Entrega Estimada: ' +$("#estim"+ordenid).html(),
		showCancelButton: true,
		confirmButtonText: `Asignar`,
		cancelButtonText: 'Cancelar'
	}).then((resultado) => {
		if (resultado.isConfirmed) {
			ordenidJSON = JSON.stringify(ordenid);
	
			$.ajax({
				type: "POST",
				contentType: 'application/json; charset=utf-8',
				dataType: 'json',
				url: 'http://localhost:8089/pv/asignarTransportista',
				data: ordenidJSON,
				success: function(result) {
					Swal.fire({
						icon: 'success',
						title: "Asignaci\u00F3n exitosa!",
				        text: 'Usted se asign\u00F3 como transportista para esta orden.',
					}).then((result) => {
						$("#tblPedidos").load("ListDelivery #tblPedidos", function(){
							$("#tr"+ordenid).addClass('table-info');
						});
					});
				},
				error: function(e) {
					Swal.fire({
						icon: 'error',
						title: "ERROR!",
				        text: 'Hubo un error con la asignaci\u00F3n. Contacte con Soporte T\u00E9cnico de ser necesario.',
				        type: "error"
					});
				}
			});
		} else if (resultado.dismiss === Swal.DismissReason.cancel) {
			Swal.fire('Asignaci\u00F3n Cancelada');
		}
	});
}
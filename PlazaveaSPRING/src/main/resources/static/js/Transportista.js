function asignar(ordenid){
	
	ordenid = JSON.stringify(ordenid);
	
	$.ajax({
		type: "POST",
		contentType: 'application/json; charset=utf-8',
		dataType: 'json',
		url: 'http://localhost:8089/pv/asignarTransportista',
		data: ordenid,
		success: function(result) {
			Swal.fire({
				icon: 'success',
				title: "Asignaci\u00F3n exitosa!",
		        text: 'Usted se asign\u00F3 como transportista para esta orden.',
		        type: "success"
			}).then((result) => {
				$("#tblPedidos").load("ListDelivery #tblPedidos");
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
}
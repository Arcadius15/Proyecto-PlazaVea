function agregar() {
	var search = {
		productoId: $('#productoid').val(),
		cantidad: $('#cantidad').val()
	};

	console.log(search);

	var resultado = JSON.stringify(search);

	$.ajax({
		type: "POST",
		contentType: 'application/json; charset=utf-8',
		dataType: 'json',
		url: 'http://localhost:8089/pv/idcompras',
		data: resultado, // Note it is important
		timeout: 100000,
		success: function(result) {
			if (result === 1) {
				Swal.fire(
					'Procesado',
					'Producto Agregado Exitosamente!',
					'success'
				);
			}
			else if (result === 2) {
				Swal.fire(
					'Actualizado',
					'Se cambio el Stock del Producto!',
					'info'
				);
			}
			else {
				Swal.fire(
					'Error',
					'Producto ya fue agregado al Carrito!',
					'error'
				);
			}
		},
		error: function(e) {
			console.log("ERROR: ", e);
		}
	});

}


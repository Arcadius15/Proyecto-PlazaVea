function validar() {
	const formapago = $('#Payment').val();
	const newdireccion = $('#NewDireccion').val();
	let jsonorden = {
		tarjetaId: formapago,
		direccion: newdireccion
	};
	var enviar = JSON.stringify(jsonorden);
	if (formapago == 0 || newdireccion == "") {
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: 'Debe seleccionar una Forma de Pago y una Direccion'
		})
	} else {
		$.ajax({
			type: "POST",
			contentType: 'application/json; charset=utf-8',
			dataType: 'json',
			url: 'http://localhost:8089/pv/regcompra',
			data: enviar, // Note it is important
			timeout: 100000,
			success: function(result) {
				if (result === 1) {
					Swal.fire({
						title: "Wow!",
						text: "Compra exitosamente registrada.",
						icon: "success",
						type: "success"
					}).then(function() {
						location.href = "/pv/VerBoleta";
					});

				}
				else {
					Swal.fire(
						'Error',
						'Hubo un problema al registrar la compra.',
						'error'
					)
				}

			},
			error: function(e) {
				console.log("ERROR: ", e);
			}
		});
	}


}


function eliminar(productoid) {
	let valor = JSON.stringify(productoid);
	$.ajax({
		type: "POST",
		contentType: 'application/json; charset=utf-8',
		dataType: 'json',
		url: 'http://localhost:8089/pv/delcompra',
		data: valor, // Note it is important
		timeout: 100000,
		success: function(result) {
			if (result === 1) {
				Swal.fire(
					'Procesado',
					'Eliminado Exitosamente.',
					'info'
				);
				location.reload();
			} else {
				Swal.fire(
					'Error',
					'Ups... Hubo algun error.',
					'error'
				);
			}

		},
		error: function(e) {
			console.log("ERROR: ", e);
		}
	});
}
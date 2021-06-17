function validar() {
	const formapago = $('#Payment').val();
	const newdireccion = $('#NewDireccion').val();
	console.log(typeof (formapago));
	console.log(newdireccion);
	var jsonorden ={
		tarjetaId : formapago,
		direccion : newdireccion
	};
	var enviar=JSON.stringify(jsonorden);
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
					alert("Registrado Exitosamente");
					location.href = "/pv/Index";
				}else{
					alert("Ups... Algo salio Mal")
				}
				
			},
			error: function(e) {
				console.log("ERROR: ", e);
			}
		});
	}


}
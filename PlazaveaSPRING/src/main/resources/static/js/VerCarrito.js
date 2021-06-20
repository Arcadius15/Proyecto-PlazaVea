function validar() {
	const formapago = $('#Payment').val();
	const newdireccion = $('#NewDireccion').val();
	let jsonorden ={
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
				}
				else if(result ===2){
					alert("Carrito de Compras Vacio.")
				}
				else{
					alert("Ups... Algo salio Mal")
				}
				
			},
			error: function(e) {
				console.log("ERROR: ", e);
			}
		});
	}


}


function eliminar(productoid){
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
					alert("Eliminado Exitosamente");
					location.reload();
				}else{
					alert("Ups... Algo salio Mal")
				}
				
			},
			error: function(e) {
				console.log("ERROR: ", e);
			}
		});
}
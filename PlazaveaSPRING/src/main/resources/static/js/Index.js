function buscar() {
	const valor = $('#btnBuscar').val();
	
	if (valor.length === 0) {
		;
	} else {
		const url = `/pv/findProducto/` + valor;
	location.href = url;
	}
}

function vercarcompra(user){
	if(user==''){
		Swal.fire(
					'Denegado',
					'Debe iniciar sesi\u00F3n para ingresar al Carro de Compra!',
					'error'
				).then((result) => {
					location.href="/pv/Login";
					});
	}else if(user==null){
		Swal.fire(
					'Denegado',
					'Carrito de Compras Vacio',
					'error'
				)
	}
	else{
		location.href="/pv/VerCarritoCompra";
	}
}


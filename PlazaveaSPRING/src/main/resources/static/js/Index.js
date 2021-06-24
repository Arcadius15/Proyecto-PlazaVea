function buscar() {
	const valor = $('#btnBuscar').val();
	
	if (valor.length === 0) {
		;
	} else {
		const url = `/pv/findProducto/` + valor;
	location.href = url;
	}
}


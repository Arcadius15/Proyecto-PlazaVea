function buscar() {
	const valor = $('#btnBuscar').val();
	const url = `/pv/findProducto/` + valor;
	location.href = url;
}


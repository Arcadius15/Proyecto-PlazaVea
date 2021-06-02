function buscar(){
	const valor = $('#btnBuscar').val();
	const url = `/findProducto/{$valor}`;
	location.href = url;
}
Swal.fire({
	title: "ERROR!",
	text:"Usted no est\u00E1 asignado a esta orden." ,
	icon: 'error',
	confirmButtonColor: '#ff002f',
	confirmButtonText: '<a class=" btn" href="/pv/ListDelivery"><b> Volver al listado</b></a>',
	allowOutsideClick:false,
	allowEscapeKey: false,
	allowEnterkey: false,
}).then((resultado) => {
	if (resultado.isConfirmed) {
		location.href = '/pv/ListDelivery';
	}
});
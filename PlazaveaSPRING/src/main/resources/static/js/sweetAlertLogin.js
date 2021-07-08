Swal.fire({
	title: "Error",
	text:"Datos invalidos.! " ,
	icon: 'error',
	confirmButtonColor: '#ff002f',
	confirmButtonText: '<a class=" btn" href="/pv/Login"><b> Volver a intentar</b></a>',
	allowOutsideClick:false,
	alowEscapeKey: false,
	allowEnterkey: false,
}).then((resultado) => {
	if (resultado.isConfirmed) {
		location.href = '/pv/Login';
	}
});

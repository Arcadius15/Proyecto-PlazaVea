function validar() {
	 // Ontenemos los valores de los campos de contraseñas 
    pass1 = document.getElementById('pass1');
    pass2 = document.getElementById('pass2');
 
    // Verificamos si las constraseñas no coinciden 
    if (pass1.value != pass2.value) {
 
        // Si las constraseñas no coinciden mostramos un mensaje 
        Swal.fire({
		title: "Error",
	text:"Los Passwords tienen que ser iguales " ,
	icon: 'error',
	confirmButtonColor: '#ff002f',
	confirmButtonText: '<a class=" btn" href="/pv/ChangePassword"><b> Volver a intentar</b></a>',
 		
   })
 
      return false;
    }
}

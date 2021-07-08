function actualizar() {
	var estado = document.getElementById("Estado");
	
	if (estado.options[estado.selectedIndex].text === "Cancelado") {
		Swal.fire({
			title: '<strong>\u00BFEst\u00E1 seguro de cancelar el pedido?<strong>',
			icon: 'info',
			text: 'Si solo hubo un problema con el transporte, deje el estado actual o c\u00E1mbielo a Pendiente de ser necesario.',
			confirmButtonText: 'Actualizar',
			cancelButtonText: 'Cancelar'
		}).then((resultado) => {
			if (resultado.isConfirmed){
				Swal.fire({
						icon: 'success',
						title: "Estado actualizado",
					}).then((result) => {
						document.getElementById("actualizarEstado").submit();
					});
			} else if (resultado.dismiss === Swal.DismissReason.cancel) {
				Swal.fire('Actualizaci\u00F3n Cancelada');
			}
		});
	} else if (estado.options[estado.selectedIndex].text === "Pendiente") {
		Swal.fire({
			title: '<strong>\u00BFEst\u00E1 seguro de cambiar a Pendiente?<strong>',
			icon: 'info',
			text: 'Si procede, usted dejar\u00E1 de ser el transportista de esta orden.',
			confirmButtonText: 'Actualizar',
			cancelButtonText: 'Cancelar'
		}).then((resultado) => {
			if (resultado.isConfirmed){
				Swal.fire({
						icon: 'success',
						title: "Estado actualizado",
					}).then((result) => {
						document.getElementById("actualizarEstado").submit();
					});
			} else if (resultado.dismiss === Swal.DismissReason.cancel) {
				Swal.fire('Actualizaci\u00F3n Cancelada');
			}
		});
	} else if (estado.value < document.getElementById("estadoActual").value) {
		Swal.fire({
			title: '<strong>\u00BFEst\u00E1 seguro de retroceder el estado?<strong>',
			icon: 'info',
			text: 'Si se va a demorar m\u00E1s de lo esperado, deje el estado actual.',
			confirmButtonText: 'Actualizar',
			cancelButtonText: 'Cancelar'
		}).then((resultado) => {
			if (resultado.isConfirmed){
				Swal.fire({
						icon: 'success',
						title: "Estado actualizado",
					}).then((result) => {
						document.getElementById("actualizarEstado").submit();
					});
			} else if (resultado.dismiss === Swal.DismissReason.cancel) {
				Swal.fire('Actualizaci\u00F3n Cancelada');
			}
		});
	} else {
		Swal.fire({
			title: '<strong>\u00BFEst\u00E1 seguro de actualizar el estado?<strong>',
			icon: 'info',
			text: 'Revise bien la informaci\u00F3n para evitar errores.',
			confirmButtonText: 'Actualizar',
			cancelButtonText: 'Cancelar'
		}).then((resultado) => {
			if (resultado.isConfirmed){
				Swal.fire({
						icon: 'success',
						title: "Estado actualizado",
					}).then((result) => {
						document.getElementById("actualizarEstado").submit();
					});
			} else if (resultado.dismiss === Swal.DismissReason.cancel) {
				Swal.fire('Actualizaci\u00F3n Cancelada');
			}
		});
	}
}
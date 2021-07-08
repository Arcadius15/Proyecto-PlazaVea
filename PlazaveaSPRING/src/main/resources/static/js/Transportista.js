function asignar(ordenid){
	Swal.fire({
		title: '<strong>Asignarse como Transportista<strong>',
		icon: 'info',
		html:
			'Direcci\u00F3n de Entrega: ' + $("#dir"+ordenid).html() + '<br>' +
			'Fecha de Compra: ' + $("#fecha"+ordenid).html() + '<br>' +
			'Fecha De Entrega Estimada: ' +$("#estim"+ordenid).html(),
		showCancelButton: true,
		confirmButtonText: `Asignar`,
		cancelButtonText: 'Cancelar'
	}).then((resultado) => {
		if (resultado.isConfirmed) {
			ordenidJSON = JSON.stringify(ordenid);
	
			$.ajax({
				type: "POST",
				contentType: 'application/json; charset=utf-8',
				dataType: 'json',
				url: 'http://localhost:8089/pv/asignarTransportista',
				data: ordenidJSON,
				success: function(result) {
					Swal.fire({
						icon: 'success',
						title: "Asignaci\u00F3n exitosa!",
				        text: 'Usted se asign\u00F3 como transportista para esta orden.',
					}).then((result) => {
						$("#tblPedidos").load("ListDelivery #tblPedidos", function(){
							$("#tr"+ordenid).addClass('table-info');
						});
					});
				},
				error: function(e) {
					Swal.fire({
						icon: 'error',
						title: "ERROR!",
				        text: 'Hubo un error con la asignaci\u00F3n. Contacte con Soporte T\u00E9cnico de ser necesario.',
				        type: "error"
					});
				}
			});
		} else if (resultado.dismiss === Swal.DismissReason.cancel) {
			Swal.fire('Asignaci\u00F3n Cancelada');
		}
	});
}

function filtrarTransportista(){
	var transportista = document.getElementById("trNombre").value;
	
	var table = document.getElementById("innerTablePedidos");
	var trs = table.getElementsByTagName("tr");
	
	var c = 0;
	
	for (let i = 0; i < trs.length - 1; i++){
		visible = false;
		var tds = trs[i+1].getElementsByTagName("td");
		
		if (tds[7].innerHTML.indexOf(transportista) > -1) {
			visible = true;
		}
		
		if (visible === true) {
			trs[i+1].style.display = "";
		} else {
			trs[i+1].style.display = "none";
			c++;
			
			if (c === trs.length - 1) {
				document.getElementById("zeroMsg").style.display = "";
			} else {
				document.getElementById("zeroMsg").style.display = "none";
			}
		}
	}
}

function filtrarPendientes(){
	var table = document.getElementById("innerTablePedidos");
	var trs = table.getElementsByTagName("tr");
	
	var c = 0;
	
	for (let i = 0; i < trs.length - 1; i++){
		visible = false;
		var tds = trs[i+1].getElementsByTagName("td");
		
		if (tds[6].innerHTML.indexOf("Pendiente") > -1) {
			visible = true;
		}
		
		if (visible === true) {
			trs[i+1].style.display = "";
		} else {
			trs[i+1].style.display = "none";
			c++;
			
			if (c === trs.length - 1) {
				document.getElementById("zeroMsg").style.display = "";
			} else {
				document.getElementById("zeroMsg").style.display = "none";
			}
		}
	}
}

function quitarFiltros(){
	var table = document.getElementById("innerTablePedidos");
	var trs = table.getElementsByTagName("tr");
	
	for (let i = 0; i < trs.length - 1; i++){
		trs[i+1].style.display = "";
	}
	
	document.getElementById("zeroMsg").style.display = "none";
}
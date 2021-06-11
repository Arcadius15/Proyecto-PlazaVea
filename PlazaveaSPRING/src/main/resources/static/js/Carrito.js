function agregar() {
	var search = $('#productoid').val();
	
	console.log(search);

	$.ajax({
		type: "POST",
		contentType: 'application/json; charset=utf-8',
		dataType : 'json',
		url: 'http://localhost:8089/pv/idcompras',
		data: search, // Note it is important
		timeout : 100000,
		success: function(result) {
			if(result===1){
				alert("Agregado a Carrito Exitosamente.");
			}
			else{
				alert("Producto ya fue agregado al carrito.");
			}
		},
		error: function(e) {
          console.log("ERROR: ", e);
        }
	});

}


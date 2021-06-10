var filtros = [];

function aplicarFiltro(){
		var table = document.getElementById("tProductos");
		
		var tr = table.getElementsByTagName("tr");
		
		var visible;
		
		for (let i = 0; i < tr.length - 1; i++){
			visible = false;
			var td = tr[i+1].getElementsByTagName("td");
			
			for (let j = 0; j < td.length; j++){
				for (let f = 0; f < filtros.length; f++){
					if (td[j] && td[j].innerHTML.toUpperCase().indexOf(filtros[f]) > -1){
						visible = true;
					}
				}
				if (visible === true){
					tr[i+1].style.display = "";
				} else {
					tr[i+1].style.display = "none";
				}
			}
		}
}

function filtrar(check){
	if($('#'+check.value).is(':checked')){
		const chk = check.value.toUpperCase();
		filtros.push(chk);
		
		aplicarFiltro();
	} else {
		const chk = check.value;
		if (filtros.indexOf(chk) > -1){
			filtros.splice(filtros.indexOf(chk), 1);
			aplicarFiltro();
		}
	}
}
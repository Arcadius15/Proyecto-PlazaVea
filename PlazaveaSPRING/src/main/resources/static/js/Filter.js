var filtrosPro = [];
var filtrosCat = [];

function aplicarFiltro(){
	var table = document.getElementById("tProductos");
		
	var tr = table.getElementsByTagName("tr");
		
	var visible;
	
	var c = 0;
		
	for (let i = 0; i < tr.length - 1; i++){
		visible = false;
		var td = tr[i+1].getElementsByTagName("td");
		
			if (filtrosPro.length > 0 && filtrosCat.length === 0) {
				for (let f = 0; f < filtrosPro.length; f++){
					if (td[3].innerHTML.toUpperCase().indexOf(filtrosPro[f]) > -1){
						visible = true;
					}
				}
			} else if (filtrosPro.length === 0 && filtrosCat.length > 0) {
				for (let f = 0; f < filtrosCat.length; f++){
					if (td[4].innerHTML.toUpperCase().indexOf(filtrosCat[f]) > -1){
						visible = true;
					}
				}
			} else if (filtrosPro.length > 0 && filtrosCat.length > 0) {
				for (let fp = 0; fp < filtrosPro.length; fp++){
					for (let fc = 0; fc < filtrosCat.length; fc++){
						if (td[3].innerHTML.toUpperCase().indexOf(filtrosPro[fp]) > -1 && td[4].innerHTML.toUpperCase().indexOf(filtrosCat[fc]) > -1){
							visible = true;
						}
					}
				}
			}
		
		if (visible === true){
			tr[i+1].style.display = "";
		} else {
			tr[i+1].style.display = "none";
			c++;
			
			if (c === tr.length -1) {
				document.getElementById("zeroMsg").style.display = "";
			} else {
				document.getElementById("zeroMsg").style.display = "none";
			}
		}
	}
}

function filtrarPro(check){
	const chk = check.value.toUpperCase();
	
	if($('#'+check.value).is(':checked')){
		filtrosPro.push(chk);
		
		aplicarFiltro();
	} else {
		filtrosPro.splice(filtrosPro.indexOf(chk), 1);
		
		if (filtrosPro.length === 0 && filtrosCat.length === 0) {
			var table = document.getElementById("tProductos");
		
			var tr = table.getElementsByTagName("tr");
			
			for (let i = 0; i < tr.length - 1; i++){
				tr[i+1].style.display = "";
			}
		} else {
			aplicarFiltro();
		}
	}
}

function filtrarCat(check){
	const chk = check.value.toUpperCase();
	
	if($('#'+check.value).is(':checked')){
		filtrosCat.push(chk);
		
		aplicarFiltro();
	} else {
		filtrosCat.splice(filtrosCat.indexOf(chk), 1);
		
		if (filtrosCat.length === 0 && filtrosPro.length === 0) {
			var table = document.getElementById("tProductos");
		
			var tr = table.getElementsByTagName("tr");
			
			for (let i = 0; i < tr.length - 1; i++){
				tr[i+1].style.display = "";
			}
		} else {
			aplicarFiltro();
		}
	}
}
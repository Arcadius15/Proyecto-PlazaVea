var filtrosPro = [];
var filtrosCat = [];

function aplicarFiltro(){
	var table = document.getElementById("tProductos");
		
	var tr = table.getElementsByTagName("tr");
		
	var visible;
	
	var c = 0;
	
	var min; var max;
	
	if (document.getElementById("filtPreMsg").style.display != "none") {
		min = parseFloat(document.getElementById("PrecioMin").value);
		max = parseFloat(document.getElementById("PrecioMax").value);
		
		if (document.getElementById("PrecioMin").value === "") {
			min = 0;
			document.getElementById("PrecioMin").value = min;
		}
		if (document.getElementById("PrecioMax").value === "") {
			max = 0;
			document.getElementById("PrecioMax").value = max;
		}
		
		if (min > max){
			var mid = min;
			min = max;
			max = mid;
			
			document.getElementById("PrecioMin").value = min;
			document.getElementById("PrecioMax").value = max;
		}
	}
		
	for (let i = 0; i < tr.length - 1; i++){
		visible = false;
		var td = tr[i+1].getElementsByTagName("td");
		
		if (filtrosPro.length === 0 && filtrosCat.length === 0) {
			for (let i = 0; i < tr.length - 1; i++){
				visible = true;
			}
		} else if (filtrosPro.length > 0 && filtrosCat.length === 0) {
			for (let f = 0; f < filtrosPro.length; f++){
				if (td[3].innerHTML.indexOf(filtrosPro[f]) > -1){
					visible = true;
				}
			}
		} else if (filtrosPro.length === 0 && filtrosCat.length > 0) {
			for (let f = 0; f < filtrosCat.length; f++){
				if (td[4].innerHTML.indexOf(filtrosCat[f]) > -1){
					visible = true;
				}
			}
		} else if (filtrosPro.length > 0 && filtrosCat.length > 0) {
			for (let fp = 0; fp < filtrosPro.length; fp++){
				for (let fc = 0; fc < filtrosCat.length; fc++){
					if (td[3].innerHTML.indexOf(filtrosPro[fp]) > -1 && td[4].innerHTML.indexOf(filtrosCat[fc]) > -1){
						visible = true;
					}
				}
			}
		}
		
		if (visible === true){
			tr[i+1].style.display = "";
			
			if (document.getElementById("filtPreMsg").style.display != "none"){
				if (parseFloat(td[1].innerHTML) >= min && parseFloat(td[1].innerHTML) <= max){
					;
				} else {
					tr[i+1].style.display = "none";
					c++;
				}
			}
			
			if (c === tr.length - 1) {
				document.getElementById("zeroMsg").style.display = "";
			} else {
				document.getElementById("zeroMsg").style.display = "none";
			}
		} else {
			tr[i+1].style.display = "none";
			c++;
			
			if (c === tr.length - 1) {
				document.getElementById("zeroMsg").style.display = "";
			} else {
				document.getElementById("zeroMsg").style.display = "none";
			}
		}
	}
}

function filtrarPro(check){
	const chk = check.value;
	
	if($('#'+check.value).is(':checked')){
		filtrosPro.push(chk);
		
		aplicarFiltro();
	} else {
		filtrosPro.splice(filtrosPro.indexOf(chk), 1);
		
		aplicarFiltro();
	}
}

function filtrarCat(check){
	const chk = check.value;
	
	if($('#'+check.value).is(':checked')){
		filtrosCat.push(chk);
		
		aplicarFiltro();
	} else {
		filtrosCat.splice(filtrosCat.indexOf(chk), 1);
		
		aplicarFiltro();
	}
}

function filtrarPre(){
	document.getElementById("filtPreMsg").style.display = "";
	
	aplicarFiltro();
}

function quitarFiltPre(){
	document.getElementById("filtPreMsg").style.display = "none";
	
	aplicarFiltro();
}

function borrarProveedores(){
	for (let bp = 0; bp < filtrosPro.length; bp++) {
		if (document.getElementById(filtrosPro[bp]).checked) {
			document.getElementById(filtrosPro[bp]).checked = false;
		}
	}
	
	filtrosPro.length = 0;
	
	aplicarFiltro();
}

function borrarCategorias(){
	for (let bc = 0; bc < filtrosCat.length; bc++) {
		if (document.getElementById(filtrosCat[bc]).checked) {
			document.getElementById(filtrosCat[bc]).checked = false;
		}
	}
	
	filtrosCat.length = 0;
	
	aplicarFiltro();
}
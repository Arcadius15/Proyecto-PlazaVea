function filtrar(check){
	if($('#'+check.value).is(':checked')){
		var chk = check.value.toUpperCase();
	
		var table = document.getElementById("tProductos");
		
		var tr = table.getElementsByTagName("tr");
		
		var visible;
		
		for (var i = 0; i < tr.length - 1; i++){
			visible = false;
			var td = tr[i+1].getElementsByTagName("td");
			
			for (var j = 0; j < td.length; j++){
				if (td[j] && td[j].innerHTML.toUpperCase().indexOf(chk) > -1){
					visible = true;
				}
			}
			
			if (visible === true){
				tr[i+1].style.display = "";
			} else {
				tr[i+1].style.display = "none";
			}
		}
	} else {
		;
	}
}
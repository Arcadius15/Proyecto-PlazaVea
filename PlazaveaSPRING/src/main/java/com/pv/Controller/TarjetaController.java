package com.pv.Controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.Tarjeta;


@Controller
public class TarjetaController {
	
	@RequestMapping(value = "/InsertaTarjeta", method = RequestMethod.GET)
	public String Insertar_GET(Model model) {
		model.addAttribute("tarjeta",new Tarjeta());
		
		return "/Tarjeta/Insertar";
		
	}

}

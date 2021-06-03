package com.pv.Controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.Cliente;
import com.pv.Entity.Tarjeta;
import com.pv.Service.TarjetaServiceImpl;


@Controller
public class TarjetaController {
	
	@Autowired
	private TarjetaServiceImpl tarjetaService;
	
	@RequestMapping(value = "/VerMetodoPago", method = RequestMethod.GET)
	public String Insertar_GET(Model model) {
		model.addAttribute("tarjeta",new Tarjeta());
		
		return "/Tarjeta/Insertar";
		
	}
	
	@RequestMapping(value = "/VerMetodoPago", method = RequestMethod.POST)
	@Transactional
	public String Insertar_POST(Tarjeta tarjeta,HttpSession session) {
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		tarjeta.setCliente(usuario);
		tarjetaService.insert(tarjeta);
		return "redirect:/VerMetodoPago";
		
	}

}

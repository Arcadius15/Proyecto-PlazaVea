package com.pv.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pv.Entity.Cliente;
import com.pv.Entity.Usuario;
import com.pv.Service.ClienteService;
import com.pv.Service.LoginService;

@Controller
public class UsuarioController {
	
	@Autowired
	@Qualifier("loginServiceDB")
	private LoginService logService;
	
	@Autowired
	private ClienteService clienteService;
	
	@RequestMapping(value = "/VerDatos", method = RequestMethod.GET)
	public String verDatos_GET(Model model, HttpSession session) {
		model.addAttribute("usuarioData", session.getAttribute("usuario"));
		
		return "/Usuario/VerDatos";
	}

	@RequestMapping(value = "/VerDatos", method = RequestMethod.POST)
	public String verDatos_POST(Cliente cliente, HttpSession session) {
		logService.update(cliente.getUserCliente());
		clienteService.update(cliente);
		
		session.setAttribute("usuario", cliente);
		
		return "redirect:/VerDatos";
	}
	
}

package com.pv.Controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.Usuario;
import com.pv.Service.LoginService;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("loginServiceDB")
	private LoginService logService;

	@RequestMapping(value="/Login",method = RequestMethod.GET)
	public String login_GET(Model model) {
		Usuario log = new Usuario();
		model.addAttribute("login",log);
		return "/Login/Login";
	}
	
	@RequestMapping(value="/Login",method = RequestMethod.POST)
	public String login_POST(Usuario login) {
		Collection<Usuario> lista = logService.findAll();
		for (Usuario log : lista) {
			if (log.getCorreo().equals(login.getCorreo()) && log.getContrasenia().equals(login.getContrasenia())) {
				return "redirect:/Index";
			}
		}
		return "redirect:/ERROR";
	}
}

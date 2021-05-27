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
public class LoginController {
	
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
		return "redirect:/Home/Error";
	}
	
	@RequestMapping(value="/ERROR",method = RequestMethod.GET)
	public String error_GET() {
		return "/Home/Error";
	}
	
	@RequestMapping(value="/ChangePassword",method = RequestMethod.GET)
	public String changepassword_GET(Model model) {
		Usuario log = new Usuario();
		model.addAttribute("login",log);
		return "/Login/ChangePassword";
	}
	
	@RequestMapping(value="/ChangePassword",method = RequestMethod.POST)
	public String changepassword_POST(Usuario login) {
		Collection<Usuario> lista = logService.findAll();
		for (Usuario log : lista) {
			if (log.getCorreo().equals(login.getCorreo()) && log.getUsuarioId().equals(login.getUsuarioId())) {
				logService.update(login);
				return "redirect:/Login";
			}
		}
		return "redirect:/ERROR";
	}
	
	@RequestMapping(value="/Registro",method = RequestMethod.GET)
	public String registro_GET(Model model) {
		model.addAttribute("login", new Usuario());
		
		return "/Login/Registro";
	}
	
	@RequestMapping(value="/Registro",method = RequestMethod.POST)
	public String registro_POST(Usuario login) {
		logService.insert(login);
		
		return "redirect:/RegSuccess";
	}
	
	@RequestMapping(value="/RegSuccess",method = RequestMethod.GET)
	public String regSuccess_GET() {
		return "/Login/RegSuccess";
	}
	
}

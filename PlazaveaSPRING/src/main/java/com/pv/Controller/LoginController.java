package com.pv.Controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.Cliente;
import com.pv.Entity.Usuario;
import com.pv.Service.CategoriaService;
import com.pv.Service.ClienteService;
import com.pv.Service.LoginService;
import com.pv.Service.TransportistaService;

@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("loginServiceDB")
	private LoginService logService;
	
	@Autowired
	private ClienteService clienteService;
	
	@Autowired
	private TransportistaService transportistaService;
	
	@Autowired
	private CategoriaService categoriaService;
	
	@RequestMapping(value="/Login",method = RequestMethod.GET)
	public String login_GET(Model model, HttpSession session) {
		if (session.getAttribute("usuario") != null) {
			return "redirect:/Index";
		}
		
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		Usuario log = new Usuario();
		model.addAttribute("login",log);
		return "/Login/Login";
	}
	
	@RequestMapping(value="/Login",method = RequestMethod.POST)
	public String login_POST(Usuario login, HttpSession session) {
		Collection<Usuario> lista = logService.findAll();
		for (Usuario log : lista) {
			if (log.getCorreo().equals(login.getCorreo()) && log.getContrasenia().equals(login.getContrasenia())) {
				String[] correoParts = login.getCorreo().split("@");
				
				if (correoParts[0].substring(0,2).equals("tr") && correoParts[1].equals("transportista.com")) {
					session.setAttribute("usuario", transportistaService.findByUserId(log.getUsuarioId()));
					session.setAttribute("userType", "t");
				} else {
					session.setAttribute("usuario", clienteService.findByUserId(log.getUsuarioId()));
					session.setAttribute("userType", "c");
				}
				
				return "redirect:/Index";
			}
		}
		return "redirect:/Home/Error";
	}
	
	@RequestMapping(value="/ERROR",method = RequestMethod.GET)
	public String error_GET(HttpSession session) {
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		return "/Home/Error";
	}
	
	@RequestMapping(value="/ChangePassword",method = RequestMethod.GET)
	public String changepassword_GET(Model model, HttpSession session) {
		if (session.getAttribute("usuario") != null) {
			return "redirect:/Index";
		}
		
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
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
	public String registro_GET(Model model, HttpSession session) {
		if (session.getAttribute("usuario") != null) {
			return "redirect:/Index";
		}
		
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		model.addAttribute("cliente", new Cliente());
		
		return "/Login/Registro";
	}
	
	@RequestMapping(value="/Registro",method = RequestMethod.POST)
	public String registro_POST(Cliente cliente) {
		logService.insert(cliente.getUserCliente());
		
		clienteService.insert(cliente);
		
		return "redirect:/RegSuccess";
	}
	
	@RequestMapping(value="/RegSuccess",method = RequestMethod.GET)
	public String regSuccess_GET(HttpSession session) {
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		return "/Login/RegSuccess";
	}
	
	@RequestMapping(value="/Logout", method = RequestMethod.GET)
	public String logout_GET(HttpSession session) {
		session.invalidate();
		
		return "redirect:/Index";
	}
	
}

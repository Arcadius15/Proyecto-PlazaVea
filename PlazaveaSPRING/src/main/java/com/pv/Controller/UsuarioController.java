package com.pv.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.Cliente;
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
		if (session.getAttribute("usuario") == null) {
			return "redirect:/Index";
		}
		
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
	
	@RequestMapping(value = "/VerDireccion", method = RequestMethod.GET)
	public String verDireccion_GET(HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("usuario") == null) {
			return "redirect:/Index";
		}
		
		Cliente cliente = (Cliente) session.getAttribute("usuario");
		
		if (cliente.getDireccion() == null) {
			;
		}else {
			String[] parts = cliente.getDireccion().split("<br>");
			
			request.setAttribute("pais", parts[0]);
			request.setAttribute("departamento", parts[1]);
			request.setAttribute("distrito", parts[2]);
			request.setAttribute("avenida", parts[3]);
			request.setAttribute("calle", parts[4]);
			
			if(parts.length == 6) {
				request.setAttribute("referencia", parts[5]);
			}
		}
		
		return "/Usuario/VerDirección";
	}
	
	@RequestMapping(value = "/VerDireccion", method = RequestMethod.POST)
	public String verDireccion_POST(HttpServletRequest request, HttpSession session) {
		String direccion = request.getParameter("pais") + "<br>" 
							+ request.getParameter("departamento") + "<br>"
							+ request.getParameter("distrito") + "<br>"
							+ request.getParameter("avenida") + "<br>"
							+ request.getParameter("calle") + "<br>"
							+ request.getParameter("referencia");
		
		Cliente cliente = clienteService.findById(Integer.parseInt(request.getParameter("clienteId")));
		cliente.setDireccion(direccion);
		
		clienteService.update(cliente);
		
		session.setAttribute("usuario", cliente);
		
		return "redirect:/VerDireccion";
	}
	
}

package com.pv.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Service.CategoriaService;
import com.pv.Service.ProveedorService;

@Controller
public class ProveedorController {

	@Autowired
	private ProveedorService proveedorService;
	
	@Autowired
	private CategoriaService categoriaService;
	
	@RequestMapping(value = "/ListProveedores", method = RequestMethod.GET)
	public String listProveedores_GET(Model model, HttpSession session) {
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		model.addAttribute("bProveedor", proveedorService.findAll());
		
		return "/Proveedor/ListProveedores";
	}
}

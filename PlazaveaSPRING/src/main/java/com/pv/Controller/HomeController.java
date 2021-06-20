package com.pv.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.OrdenDetalle;
import com.pv.Entity.Producto;
import com.pv.Service.CategoriaService;
import com.pv.Service.ProductoService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductoService productoService;
	@Autowired
	private CategoriaService categoriaService;
	

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/Index",method = RequestMethod.GET)
	public String index_GET(Map map, HttpSession session) {
		map.put("bProducto", productoService.findAll());
		
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		return "/Home/Index";
	}
}

package com.pv.Controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Objects.JsonCarrito;
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
		map.put("bProductoCo", productoService.findByCat("Cocina"));
		map.put("bProductoTec", productoService.findByCat("Tecnologia"));
		map.put("bProductoJug", productoService.findByCat("Juguetes"));
		map.put("bProductoBel", productoService.findByCat("Belleza"));
		
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		List<JsonCarrito> jsoncarrito = (List<JsonCarrito>) session.getAttribute("carrito");
		if (jsoncarrito!=null) {
			ArrayList<Object[]> carritohead = new ArrayList();
			for (JsonCarrito x : jsoncarrito) {
				Object[] objcar = new Object[2];
				objcar[0]=productoService.findById(x.getProductoId());
				objcar[1]=x.getCantidad();
				carritohead.add(objcar);
			}
			session.setAttribute("carritohead", carritohead);
			session.setAttribute("carritocount", carritohead.size());
		}else {
			session.setAttribute("carritocount", 0);
		}
		
		return "/Home/Index";
	}
	
	@RequestMapping(value="/Servicio", method=RequestMethod.GET)
	public String servicio_GET() {
		return "/Home/Servicio";
	}
}

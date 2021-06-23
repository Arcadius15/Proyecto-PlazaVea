package com.pv.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.pv.Service.EstadoOrdenService;
import com.pv.Service.OrdenDetService;
import com.pv.Service.OrdenService;
import com.pv.Service.ProductoService;

@Controller
public class OrdenController {
	
	@Autowired
	private ProductoService productoService;
	@Autowired
	private OrdenService ordenService;
	@Autowired
	private EstadoOrdenService estadoOrdenService;
	@Autowired
	private OrdenDetService ordenDetService;
	
	@RequestMapping(value = "/ListDelivery", method = RequestMethod.GET)
	public String listarPedidos_GET(Model model) {
		return "/Pedido/ListarPedidos";
	}
	
}

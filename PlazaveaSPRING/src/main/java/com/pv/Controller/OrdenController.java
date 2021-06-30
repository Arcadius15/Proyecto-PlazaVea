package com.pv.Controller;

import org.springframework.stereotype.Controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.Orden;
import com.pv.Entity.OrdenDetalle;
import com.pv.Entity.Transportista;
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
	public String listarPedidos_GET(Map map, Model model, HttpSession session) {
		if (session.getAttribute("usuario") == null) {
			return "redirect:/Index";
		}
		
		if (session.getAttribute("userType").equals("c")) {
			return "redirect:/Index";
		}
		
		map.put("listOrders", ordenService.findAllMostRecent());
		
		return "/Pedido/ListarPedidos";
	}
	
	@RequestMapping(value="/asignarTransportista/{ordenId}", method = RequestMethod.GET)
	public String asignarTransportista_GET(@PathVariable Integer ordenId, HttpSession session) {
		Transportista transportista = (Transportista) session.getAttribute("usuario");
		
		Orden orden = ordenService.findById(ordenId);
		orden.setEstadoOrden(estadoOrdenService.findById(3));
		orden.setTransportista(transportista);
		ordenService.update(orden);
		
		return "redirect:/ListDelivery";
	}
}

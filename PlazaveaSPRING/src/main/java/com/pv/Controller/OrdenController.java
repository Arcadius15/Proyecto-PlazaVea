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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@PostMapping(value = "/asignarTransportista")
	@ResponseBody
	public void asignarTransportista_GET(@RequestBody Integer ordenId, HttpSession session) {
		Transportista transportista = (Transportista) session.getAttribute("usuario");
		
		Orden orden = ordenService.findById(ordenId);
		orden.setEstadoOrden(estadoOrdenService.findByName("En proceso"));
		orden.setTransportista(transportista);
		ordenService.update(orden);
	}
	
	@RequestMapping(value = "/infoPedido/{ordenId}", method = RequestMethod.GET)
	public String infoPedido_GET(Model model, @PathVariable Integer ordenId) {
		Orden orden =  ordenService.findById(ordenId);
		
		model.addAttribute("orden", orden);
		model.addAttribute("estados", estadoOrdenService.findAll());
		
		String estadoOrden = orden.getEstadoOrden().getDescripcion();
		model.addAttribute("estadoOrden", estadoOrden);
		
		String estadoPorcentaje = "";
		String animado = "progress-bar-animated bg-success";
		
		if (estadoOrden.equals("Pendiente")) {
			estadoPorcentaje = "5";
			animado = "progress-bar-animated bg-info";
		} else if (estadoOrden.equals("En proceso")) {
			estadoPorcentaje = "20";
		} else if (estadoOrden.equals("Empaquetado")) {
			estadoPorcentaje = "40";
		} else if (estadoOrden.equals("Esperando próxima salida")) {
			estadoPorcentaje = "60";
		} else if (estadoOrden.equals("En camino")) {
			estadoPorcentaje = "80";
		} else if (estadoOrden.equals("Entregado")) {
			estadoPorcentaje = "100";
			animado = "bg-success";
		} else if (estadoOrden.equals("Cancelado")) {
			estadoPorcentaje = "100";
			animado = "bg-danger";
		}
		
		model.addAttribute("estadoPorcentaje", estadoPorcentaje);
		model.addAttribute("animado", animado);
		
		return "/Pedido/InfoPedido";
	}
	
	@RequestMapping(value = "/infoPedido/{ordenId}", method = RequestMethod.POST)
	public String infoPedido_POST(Orden orden) {
		ordenService.update(orden);
		
		return "redirect:/infoPedido/{ordenId}";
	}
}

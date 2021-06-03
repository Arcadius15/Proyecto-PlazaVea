package com.pv.Controller;


import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.Cliente;
import com.pv.Entity.Tarjeta;
import com.pv.Service.TarjetaServiceImpl;


@Controller
public class TarjetaController {
	
	@Autowired
	private TarjetaServiceImpl tarjetaService;
	
	@RequestMapping(value = "/VerMetodoPago", method = RequestMethod.GET)
	public String Insertar_GET(Model model,Map map,HttpSession session) {
		if (session.getAttribute("usuario") == null) {
			return "redirect:/Index";
		}
		
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		model.addAttribute("tarjeta",new Tarjeta());
		Collection <Tarjeta> tarjeta =  new ArrayList<>();
		for (Tarjeta obj : tarjetaService.findAll()) {
			if (obj.getCliente().getClienteId().equals(usuario.getClienteId())) {
				tarjeta.add(obj);
			}
			
		}
		map.put("bTarjetas",tarjeta);
		return "/Tarjeta/Insertar";
		
	}
	
	@RequestMapping(value = "/VerMetodoPago", method = RequestMethod.POST)
	@Transactional
	public String Insertar_POST(Tarjeta tarjeta,HttpSession session) {
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		tarjeta.setCliente(usuario);
		tarjetaService.insert(tarjeta);
		return "redirect:/VerMetodoPago";
		
	}

	@RequestMapping(value = "/TarjetaEliminar/{tarjetaId}", method = RequestMethod.GET)
	public String tarjetaEliminar_GET(@PathVariable("tarjetaId") Integer tarjetaId) {
		tarjetaService.delete(tarjetaId);
		
		return "redirect:/VerMetodoPago";
	}
	
	@RequestMapping(value = "/TarjetaEditar/{tarjetaId}", method = RequestMethod.GET)
	public String tarjetaEditar_GET(Model model, Map map, HttpSession session, @PathVariable("tarjetaId") Integer tarjetaId) {
		if (session.getAttribute("usuario") == null) {
			return "redirect:/Index";
		}
		
		Cliente usuario = (Cliente) session.getAttribute("usuario");
		model.addAttribute("tarjeta",tarjetaService.findById(tarjetaId));
		Collection <Tarjeta> tarjeta =  new ArrayList<>();
		for (Tarjeta obj : tarjetaService.findAll()) {
			if (obj.getCliente().getClienteId().equals(usuario.getClienteId())) {
				tarjeta.add(obj);
			}
			
		}
		map.put("bTarjetas",tarjeta);
		return "/Tarjeta/Editar";
	}
	
	@RequestMapping(value = "/TarjetaEditar/{tarjetaId}", method = RequestMethod.POST)
	public String tarjetaEditar_POST(Tarjeta tarjeta) {
		tarjetaService.update(tarjeta);
		
		return "redirect:/VerMetodoPago";
	}
	
}

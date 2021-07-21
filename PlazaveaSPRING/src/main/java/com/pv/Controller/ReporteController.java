package com.pv.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pv.Entity.Reporte;
import com.pv.Entity.Transportista;
import com.pv.Service.ReporteService;

@Controller
public class ReporteController {

	@Autowired
	private ReporteService reporteService;
	
	@RequestMapping(value="/reporte_listar", method = RequestMethod.GET)
	public String listar_GET(Model model, HttpSession session) {
		if (session.getAttribute("usuario") == null) {
			return "redirect:/Index";
		}
		
		if (session.getAttribute("userType").equals("c")) {
			return "redirect:/Index";
		}
		
		model.addAttribute("listReporte", reporteService.findAll());
		
		return "/Reporte/listar";
	}
	
	@RequestMapping(value="/reporte_registrar", method = RequestMethod.GET)
	public String registrar_GET(Model model, HttpSession session) {
		if (session.getAttribute("usuario") == null) {
			return "redirect:/Index";
		}
		
		if (session.getAttribute("userType").equals("c")) {
			return "redirect:/Index";
		}
		
		model.addAttribute("reporte", new Reporte());
		
		return "/Reporte/registrar";
	}
	
	@RequestMapping(value="/reporte_registrar", method = RequestMethod.POST)
	public String registrar_POST(Reporte reporte, HttpSession session) {
		Transportista transportista = (Transportista) session.getAttribute("usuario");
		reporte.setTransportista(transportista);
		
		reporteService.insert(reporte);
		
		return "redirect:/reporte_listar";
	}
}

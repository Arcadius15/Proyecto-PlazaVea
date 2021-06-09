package com.pv.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.pv.Entity.Producto;
import com.pv.Service.CategoriaService;
import com.pv.Service.ProductoService;
import com.pv.Service.ProveedorService;

@Controller
public class ProductoController {
	
	@Autowired
	private ProductoService productoService;
	
	@Autowired
	private CategoriaService categoriaService;
	
	@Autowired
	private ProveedorService proveedorService;
	
	
	@RequestMapping(value = "/Producto/{productoId}",method = RequestMethod.GET)
	public String infoProducto(Model model,@PathVariable Integer productoId) {
		Producto productoMod = productoService.findById(productoId);
		model.addAttribute("producto",productoMod);
		
		return "/Producto/InfoProducto";
	}
	
	@RequestMapping(value = "/InsertaProducto",method = RequestMethod.GET)
	public String Insertar_GET(Model model,	Map map) {
		map.put("Proveedores", proveedorService.findAll());
		map.put("Categorias", categoriaService.findAll());
		Producto productoMod = new Producto();
		model.addAttribute("producto",productoMod);
		
		
		return "/Producto/Insertar";
	}
	
	@RequestMapping(value = "/InsertaProducto",method = RequestMethod.POST)
	public String Insertar_POST
	(@RequestPart("picture") MultipartFile picture,Producto producto) 
	throws IOException{
		producto.setNombreImagen(picture.getOriginalFilename());
		producto.setFile(picture.getBytes());
		productoService.insert(producto);
		return "redirect:/Index";
	}
	
	@RequestMapping(value = "/findProducto/{valor}",method = RequestMethod.GET)
	public String findProducto_GET(Model model, Map map, @PathVariable String valor) {
		Collection<Producto> productoMod = productoService.findByName(valor);
		model.addAttribute("bProducto",productoMod);
		model.addAttribute("valor", valor);
		
		List<String> proveedores = new ArrayList<String>();
		List<String> categorias = new ArrayList<String>();
		
		for (Producto producto : productoMod) {
			proveedores.add(producto.getProveedor().getNombre());
			categorias.add(producto.getCategoria().getNombre());
		}
		
		map.put("bProveedor", new HashSet<String>(proveedores));
		map.put("bCategoria", new HashSet<String>(categorias));
		
		return "/Producto/FindProducto";
		
	}
	
	@RequestMapping(value = "/findProducto/{valor}",method = RequestMethod.POST)
	public String findProducto_POST(@PathVariable String valor) {
		return "redirect:/findProducto/"+valor;
	}


}

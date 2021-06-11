package com.pv.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.pv.Entity.OrdenDetalle;
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
	
	@Autowired
	private Gson gson;
	
	
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
		return "redirect:/InsertaProducto";
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
	
	@RequestMapping(value = "/VerCarritoCompra",method = RequestMethod.GET)
	public String carroCompra_GET(HttpSession session, Map map) {
		List<OrdenDetalle> detalles = new ArrayList<OrdenDetalle>();
		List<Integer> carrito  = (List<Integer>) session.getAttribute("carrito");
		for (Integer item : carrito) {
			
			
		}
		map.put("carritocompra", carrito);
		return "/Producto/CarritoCompra";
	}
	
	@PostMapping(value = "/idcompras")
	@ResponseBody
	public Integer CarroCompra(@RequestBody String idcompras,HttpSession session) {
		Integer id = Integer.parseInt(idcompras);
		List<Integer> carrito = (List<Integer>) session.getAttribute("carrito");
		if (carrito!=null) {
			for (Integer var : carrito) {
				if (var == id) {
					return 0;
				}
			}
		}
		else {
			carrito = new ArrayList<Integer>();
		}
		carrito.add(id);
		session.setAttribute("carrito", carrito);
		return 1;
	}
	


}

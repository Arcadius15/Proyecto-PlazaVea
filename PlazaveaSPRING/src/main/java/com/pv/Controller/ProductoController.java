package com.pv.Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.SessionEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.pv.Entity.Cliente;
import com.pv.Entity.Orden;
import com.pv.Entity.OrdenDetalle;
import com.pv.Entity.OrdenDetalleKey;
import com.pv.Entity.Producto;
import com.pv.Objects.JsonCarrito;
import com.pv.Objects.JsonOrden;
import com.pv.Service.CategoriaService;
import com.pv.Service.EstadoOrdenService;
import com.pv.Service.OrdenDetService;
import com.pv.Service.OrdenService;
import com.pv.Service.ProductoService;
import com.pv.Service.ProveedorService;
import com.pv.Service.TarjetaService;

@Controller
public class ProductoController {
	
	@Autowired
	private ProductoService productoService;
	@Autowired
	private CategoriaService categoriaService;
	@Autowired
	private ProveedorService proveedorService;
	@Autowired
	private OrdenService ordenService;
	@Autowired
	private TarjetaService tarjetaService;
	@Autowired
	private EstadoOrdenService estadoOrdenService;
	@Autowired
	private OrdenDetService ordenDetService;
	
	
	@RequestMapping(value = "/Producto/{productoId}",method = RequestMethod.GET)
	public String infoProducto(Model model,@PathVariable Integer productoId, HttpSession session) {
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		Producto productoMod = productoService.findById(productoId);
		model.addAttribute("producto",productoMod);
		return "/Producto/InfoProducto";
	}
	
	@RequestMapping(value = "/InsertaProducto",method = RequestMethod.GET)
	public String Insertar_GET(Model model,	Map map, HttpSession session) {
		try {
			if (session.getAttribute("userType").equals("c")) {
				return "redirect:/Index";
			}else if (session.getAttribute("userType").equals("t")) {
				map.put("Proveedores", proveedorService.findAll());
				map.put("Categorias", categoriaService.findAll());
				Producto productoMod = new Producto();
				model.addAttribute("producto",productoMod);
				return "/Producto/Insertar";
			}
			return "redirect:/Index";
			
		}
		catch (Exception e) {
			return "redirect:/Index";
		}
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
	
	@RequestMapping(value = "/EditarProducto/{idProducto}",method = RequestMethod.GET)
	public String Editar_GET(Model model,	Map map, HttpSession session,@PathVariable Integer idProducto) {
		try {
			if (session.getAttribute("userType").equals("c")) {
				return "redirect:/Index";
			}else if (session.getAttribute("userType").equals("t")) {
				map.put("Proveedores", proveedorService.findAll());
				map.put("Categorias", categoriaService.findAll());
				Producto productoMod = productoService.findById(idProducto);
				model.addAttribute("producto",productoMod);
				return "/Producto/Editar";
			}
			return "redirect:/Index";
			
		}
		catch (Exception e) {
			return "redirect:/Index";
		}
	}
	
	@RequestMapping(value = "/EditarProducto/{idProducto}",method = RequestMethod.POST)
	public String Editar_POST
	(@RequestPart("picture") MultipartFile picture,Producto producto,@PathVariable Integer idProducto) 
	throws IOException{
		if (!picture.isEmpty()) {
			producto.setNombreImagen(picture.getOriginalFilename());
			producto.setFile(picture.getBytes());
		} else {
			producto.setNombreImagen(productoService.findById(idProducto).getNombreImagen());
			producto.setFile(productoService.findById(idProducto).getFile());
		}
		
		productoService.insert(producto);
		return "redirect:/Producto/" + idProducto;
	}
	
	
	@RequestMapping(value = "/findProducto/{valor}",method = RequestMethod.GET)
	public String findProducto_GET(Model model, Map map, @PathVariable String valor, HttpSession session) {
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
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
	public String carroCompra_GET(HttpSession session, Map map,Model model) {		
		if (session.getAttribute("usuario") != null) {
			if (session.getAttribute("userType").equals("t")) {
				return "redirect:/Index";
			}
		}
		
		//se obtiene cliente
		Cliente cliente = (Cliente) session.getAttribute("usuario");
		
		//si no se encuentra cliente redirect a index
		if (cliente==null) {
			return "redirect:/Login";
		}
		
		//se obtiene los id de los productos agregados
		List<JsonCarrito> carrito  = (List<JsonCarrito>) session.getAttribute("carrito");
		if (carrito==null) {
			return "redirect:/Index";
		}
		
		//se crea un carrito de compras completo
		List<OrdenDetalle> detalles = new ArrayList<OrdenDetalle>();
		
		//se agrega los productos a un objeto OrdenDetalle
		for (JsonCarrito item : carrito) {
			OrdenDetalle producto = new OrdenDetalle();
			Producto itemProducto = productoService.findById(item.getProductoId());
			producto.setCantidad(item.getCantidad());
			producto.setProducto(itemProducto);
			Double precio = producto.getCantidad()*itemProducto.getPrecioUnidad();
			if (producto.getCantidad()>5) {
				producto.setDescuento(precio * 0.15);
			}else {
				producto.setDescuento((double) 0);
			}
			Double preciototal = precio - producto.getDescuento();
			producto.setPrecio(preciototal);
			detalles.add(producto);
		}
		if (cliente.getDireccion()==null) {
			return "redirect:/VerDireccion";
		}
		String[] direccion = cliente.getDireccion().split("<br>");
		
		String direccioncocatenado = "";
		for (String string : direccion) {
			if (direccioncocatenado == "") {
				direccioncocatenado = direccioncocatenado + " " + string;
			}else {
				direccioncocatenado = direccioncocatenado + ", " + string;
			}
		}
		
		System.out.println(tarjetaService.findAllbyCliente(cliente));
		
		//carrito de compras es la lista de OrdenDetalle sin OrdenID
		session.setAttribute("carritocompra", detalles);
		//Tarjetas es la lista completa de CCs
		map.put("tarjetas", tarjetaService.findAllbyCliente(cliente));
		model.addAttribute("direccion",direccioncocatenado);
		
		return "/Producto/CarritoCompra";
	}
	
	@PostMapping(value = "/idcompras")
	@ResponseBody
	public Integer CarroCompra(@RequestBody JsonCarrito idstock,HttpSession session) {
		List<JsonCarrito> carrito = (List<JsonCarrito>) session.getAttribute("carrito");
		if (carrito!=null) {
			for (JsonCarrito var : carrito) {
				if (var.getProductoId() == idstock.getProductoId()) {
					if (var.getCantidad()!=idstock.getCantidad()) {
						var.setCantidad(idstock.getCantidad());
						session.setAttribute("carrito", carrito);
						return 2;
					}
					return 0;
				}
			}
		}
		else {
			carrito = new ArrayList<JsonCarrito>();
		}
		carrito.add(idstock);
		session.setAttribute("carrito", carrito);
		return 1;
	}
	
	@PostMapping(value = "/regcompra")
	@ResponseBody
	@Transactional
	public Integer RegCarrocompra(@RequestBody JsonOrden jsonorden,HttpSession session) {
		try {
			List<JsonCarrito> carro = (List<JsonCarrito>) session.getAttribute("carrito");
			//obtener el cliente y carro de compras
			List<OrdenDetalle> carrito = (List<OrdenDetalle>) session.getAttribute("carritocompra");
			if (carro == null) {
				return 2;
			}
			Cliente user = (Cliente) session.getAttribute("usuario");
			//creacion de nueva orden
			Orden orden = new Orden();
			orden.setCliente(user);
			orden.setDireccion(jsonorden.getDireccion());
			orden.setEstadoOrden(estadoOrdenService.findById(1));
			orden.setFecha(LocalDate.now());
			double suma = carrito.stream().mapToDouble(o->o.getPrecio()).sum();
			orden.setImpuesto(Math.round((suma*0.19)*100)/100d);
			orden.setTarjeta(tarjetaService.findById(jsonorden.getTarjetaId()));
			Integer ordenreg = ordenService.insert(orden);
			for (OrdenDetalle ordenDetalle : carrito) {
				OrdenDetalleKey key = new OrdenDetalleKey();
				ordenDetalle.setOrden(ordenService.findById(ordenreg));
				key.setOrdenId(ordenDetalle.getOrden().getOrdenId());
				key.setProductoId(ordenDetalle.getProducto().getProductoId());
				ordenDetalle.setId(key);
				ordenDetService.insert(ordenDetalle);
				
				Producto producto = productoService.findById(ordenDetalle.getProducto().getProductoId());
				producto.setStock(producto.getStock() - ordenDetalle.getCantidad());
				productoService.insert(producto);
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			session.setAttribute("carritocompra", null);
			session.setAttribute("carrito", null);
			session.setAttribute("carritohead", null);
		}
	}
	
	@PostMapping(value = "/delcompra")
	@ResponseBody
	public Integer delCompra_POST(@RequestBody Integer productoId,HttpSession session) {
		List<JsonCarrito> carrito = (List<JsonCarrito>) session.getAttribute("carrito");
		for (JsonCarrito jsonCarrito : carrito) {
			if (jsonCarrito.getProductoId()==productoId) {
				carrito.remove(jsonCarrito);
				session.setAttribute("carrito",carrito);
				if (carrito.size()==0) {
					session.setAttribute("carrito",null);
				}else {
					session.setAttribute("carrito",carrito);
				}
				return 1;
			}
		}
		return 0;
	}
	
	@RequestMapping(value = "/findProductoByCat/{valor}",method = RequestMethod.GET)
	public String findProductoByCat_GET(Model model, Map map, @PathVariable String valor, HttpSession session) {
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		Collection<Producto> productoMod = productoService.findByCat(valor);
		model.addAttribute("bProducto",productoMod);
		model.addAttribute("valor", valor);
		
		List<String> proveedores = new ArrayList<String>();
		
		for (Producto producto : productoMod) {
			proveedores.add(producto.getProveedor().getNombre());
		}
		
		map.put("bProveedor", new HashSet<String>(proveedores));
		
		return "/Producto/FindProductoByCat";
	}
	
	@RequestMapping(value = "/findProductoByCat/{valor}",method = RequestMethod.POST)
	public String findProductoByCat_POST(@PathVariable String valor) {
		return "redirect:/findProductoByCat/"+valor;
	}
	
	@RequestMapping(value = "/VerBoleta",method = RequestMethod.GET)
	public String verBoleta(HttpSession session,Model model,Map map) {
		Cliente user = (Cliente)session.getAttribute("usuario");
		if (user==null) {
			return "redirect:/Index";
		}
		Orden regcompra = ordenService.findLastOrderByClient(user.getClienteId());
		Collection<OrdenDetalle> listado = ordenDetService.findAll(regcompra.getOrdenId());
		model.addAttribute("orden",regcompra);
		map.put("listado", listado);
		return "/Producto/Boleta";
	}
	
	@RequestMapping(value = "/findProductoByProv/{valor}",method = RequestMethod.GET)
	public String findProductoByProv_GET(Model model, Map map, @PathVariable String valor, HttpSession session) {
		if (session.getAttribute("bCategoria") == null) {
			session.setAttribute("bCategoria",categoriaService.findAll());
		}
		
		Collection<Producto> productoMod = productoService.findByProv(valor);
		model.addAttribute("bProducto",productoMod);
		model.addAttribute("valor", valor);
		
		List<String> categorias = new ArrayList<String>();
		
		for (Producto producto : productoMod) {
			categorias.add(producto.getCategoria().getNombre());
		}
		
		map.put("bCategoria", new HashSet<String>(categorias));
		
		return "/Producto/FindProductoByProv";
	}
	
	@PostMapping(value = "/CancelarCompra")
	@ResponseBody
	public Integer cancelarCompra_POST(@RequestBody Boolean valor,HttpSession session) {
		try {
			if (valor) {
				session.setAttribute("carritocompra", null);
				session.setAttribute("carrito", null);
				session.setAttribute("carritohead", null);
				return 1;
			}else {
				return 2;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 2;
		}
		
	}

}

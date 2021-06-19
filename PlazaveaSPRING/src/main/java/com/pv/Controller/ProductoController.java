package com.pv.Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.pv.Entity.Cliente;
import com.pv.Entity.Orden;
import com.pv.Entity.OrdenDetalle;
import com.pv.Entity.OrdenDetalleKey;
import com.pv.Entity.Producto;
import com.pv.Entity.Usuario;
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
	public String carroCompra_GET(HttpSession session, Map map,Model model) {
		//se obtiene cliente
		Cliente cliente = (Cliente) session.getAttribute("usuario");
		//si no se encuentra cliente redirect a index
		if (cliente==null) {
			return "redirect:/Index";
		}
		//se obtiene los id de los productos agregados
		List<Integer> carrito  = (List<Integer>) session.getAttribute("carrito");
		if (carrito==null) {
			return "redirect:/Index";
		}
		//se crea un carrito de compras completo
		List<OrdenDetalle> detalles = new ArrayList<OrdenDetalle>();
		//se agrega los productos a un objeto OrdenDetalle
		for (Integer item : carrito) {
			OrdenDetalle producto = new OrdenDetalle();
			Producto itemProducto = productoService.findById(item);
			producto.setProducto(itemProducto);
			producto.setCantidad(10);
			if (producto.getCantidad()>5) {
				producto.setDescuento(0.15);
			}else {
				producto.setDescuento((double) 0);
			}
			Double precio = producto.getCantidad()*itemProducto.getPrecioUnidad();
			Double preciototal = precio - (precio * producto.getDescuento());
			producto.setPrecio(preciototal);
			detalles.add(producto);
		}
		//carrito de compras es la lista de OrdenDetalle sin OrdenID
		session.setAttribute("carritocompra", detalles);
		//Tarjetas es la lista completa de CCs
		map.put("tarjetas", tarjetaService.findAll());
		String[] direccion = cliente.getDireccion().split("<br>");
		String direccioncocatenado = "";
		for (String string : direccion) {
			if (direccioncocatenado == "") {
				direccioncocatenado = direccioncocatenado + " " + string;
			}else {
				direccioncocatenado = direccioncocatenado + ", " + string;
			}
		}
		model.addAttribute("direccion",direccioncocatenado);
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
	
	@PostMapping(value = "/regcompra")
	@ResponseBody
	@Transactional
	public Integer RegCarrocompra(@RequestBody JsonOrden jsonorden,HttpSession session) {
		try {
			//obtener el cliente y carro de compras
			List<OrdenDetalle> carrito = (List<OrdenDetalle>) session.getAttribute("carritocompra");
			Cliente user = (Cliente) session.getAttribute("usuario");
			//creacion de nueva orden
			Orden orden = new Orden();
			orden.setCliente(user);
			orden.setDireccion(jsonorden.getDireccion());
			orden.setEstadoOrden(estadoOrdenService.findById(1));
			orden.setFecha(LocalDate.now());
			orden.setFechaEntrega(LocalDate.now().plusDays(5));
			orden.setImpuesto(0.19);
			orden.setTarjeta(tarjetaService.findById(jsonorden.getTarjetaId()));
			Integer ordenreg = ordenService.insert(orden);
			for (OrdenDetalle ordenDetalle : carrito) {
				OrdenDetalleKey key = new OrdenDetalleKey();
				ordenDetalle.setOrden(ordenService.findById(ordenreg));
				key.setOrdenId(ordenDetalle.getOrden().getOrdenId());
				key.setProductoId(ordenDetalle.getProducto().getProductoId());
				ordenDetalle.setId(key);
				ordenDetService.insert(ordenDetalle);
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			session.setAttribute("carritocompra", null);
			session.setAttribute("carrito", null);
		}
	}
	


}

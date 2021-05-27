package com.pv.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "producto")
public class Producto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productoId;
	@Column(nullable = false)
	private String nombre;
	@Column(nullable = false)
	private Double precioUnidad;
	@Column(nullable = false)
	private Integer stock;
	@Column(nullable = false)
	private String descripcion;
	@Column
	private String nombreImagen;
	@Column(columnDefinition = "longblob")
	private byte[] file;
	public Integer getProductoId() {
		return productoId;
	}
	public void setProductoId(Integer productoId) {
		this.productoId = productoId;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Double getPrecioUnidad() {
		return precioUnidad;
	}
	public void setPrecioUnidad(Double precioUnidad) {
		this.precioUnidad = precioUnidad;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public Producto() {
	}
	
	public String getNombreImagen() {
		return nombreImagen;
	}
	public void setNombreImagen(String nombreImagen) {
		this.nombreImagen = nombreImagen;
	}
	public byte[] getFile() {
		return file;
	}
	public void setFile(byte[] file) {
		this.file = file;
	}
	
	public String getBase64Image() {
		String base64Image = Base64.getEncoder().encodeToString(file);
		return base64Image;
	}

	public Producto(Integer productoId, String nombre, Double precioUnidad, Integer stock, String descripcion,
			String nombreImagen, byte[] file, Collection<OrdenDetalle> itemsOrdenDetalle, Categoria categoria,
			Proveedor proveedor) {
		this.productoId = productoId;
		this.nombre = nombre;
		this.precioUnidad = precioUnidad;
		this.stock = stock;
		this.descripcion = descripcion;
		this.nombreImagen = nombreImagen;
		this.file = file;
		this.itemsOrdenDetalle = itemsOrdenDetalle;
		this.categoria = categoria;
		this.proveedor = proveedor;
	}





	@OneToMany(mappedBy = "producto")
	private Collection<OrdenDetalle> itemsOrdenDetalle = new ArrayList<>();
	public Collection<OrdenDetalle> getItemsOrdenDetalle() {
		return itemsOrdenDetalle;
	}
	public void setItemsOrdenDetalle(Collection<OrdenDetalle> itemsOrdenDetalle) {
		this.itemsOrdenDetalle = itemsOrdenDetalle;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "categoria_id",nullable = false,
			foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (categoria_id) references categoria(categoria_id)"))
	private Categoria categoria;
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	@ManyToOne
	@JoinColumn(name = "proveedor_id",nullable = false,
			foreignKey = @ForeignKey(foreignKeyDefinition = "foreign key (proveedor_id) references proveedor(proveedor_id)"))
	private Proveedor proveedor;
	public Proveedor getProveedor() {
		return proveedor;
	}
	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}
	

}

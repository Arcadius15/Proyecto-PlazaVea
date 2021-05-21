package com.pv.Entity;

import java.io.Serializable;
import java.util.ArrayList;
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
	
	public Producto(Integer productoId, String nombre, Double precioUnidad, Integer stock, String descripcion) {
		this.productoId = productoId;
		this.nombre = nombre;
		this.precioUnidad = precioUnidad;
		this.stock = stock;
		this.descripcion = descripcion;
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

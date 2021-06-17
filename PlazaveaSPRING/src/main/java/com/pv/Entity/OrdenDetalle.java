package com.pv.Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "orden_detalle")
public class OrdenDetalle implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	private OrdenDetalleKey id;
	
	@Column(nullable = false)
	private Integer cantidad;
	@Column(nullable = false)
	private Double precio;
	@Column(nullable = false)
	private Double descuento;
	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public Double getDescuento() {
		return descuento;
	}
	public void setDescuento(Double descuento) {
		this.descuento = descuento;
	}
	
	public OrdenDetalleKey getId() {
		return id;
	}
	public void setId(OrdenDetalleKey id) {
		this.id = id;
	}
	public OrdenDetalle() {
	}
	
	public OrdenDetalle(OrdenDetalleKey id, Integer cantidad, Double precio, Double descuento, Orden orden,
			Producto producto) {
		this.id = id;
		this.cantidad = cantidad;
		this.precio = precio;
		this.descuento = descuento;
		this.orden = orden;
		this.producto = producto;
	}




	@ManyToOne
	@MapsId("ordenId")
	@JoinColumn(name = "orden_id")
	private Orden orden;
	public Orden getOrden() {
		return orden;
	}
	public void setOrden(Orden orden) {
		this.orden = orden;
	}
	
	@ManyToOne
	@MapsId("productoId")
	@JoinColumn(name="producto_id")
	private Producto producto;
	public Producto getProducto() {
		return producto;
	}
	public void setProducto(Producto producto) {
		this.producto = producto;
	}

}

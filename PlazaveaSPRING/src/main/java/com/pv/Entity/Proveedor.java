package com.pv.Entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;


@Entity
@Table(name = "proveedor")
public class Proveedor  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer proveedorId;
	@Column(nullable = false)
	private String nombre;
	@Column(nullable = false)
	private String razonSocial;
	@DateTimeFormat(pattern = "yyyy-MM-dd",iso = ISO.DATE)
	private LocalDate fechaInscripcion;
	public Integer getProveedorId() {
		return proveedorId;
	}
	public void setProveedorId(Integer proveedorId) {
		this.proveedorId = proveedorId;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getRazonSocial() {
		return razonSocial;
	}
	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}
	public LocalDate getFechaInscripcion() {
		return fechaInscripcion;
	}
	public void setFechaInscripcion(LocalDate fechaInscripcion) {
		this.fechaInscripcion = fechaInscripcion;
	}
	public Proveedor(Integer proveedorId, String nombre, String razonSocial, LocalDate fechaInscripcion) {
		this.proveedorId = proveedorId;
		this.nombre = nombre;
		this.razonSocial = razonSocial;
		this.fechaInscripcion = fechaInscripcion;
	}
	public Proveedor() {
	}
	
	@OneToMany(mappedBy = "proveedor")
	private Collection<Producto> itemsProducto = new ArrayList<>();
	public Collection<Producto> getItemsProducto() {
		return itemsProducto;
	}
	public void setItemsProducto(Collection<Producto> itemsProducto) {
		this.itemsProducto = itemsProducto;
	}
	

}

package com.pv.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "estado_orden")
public class EstadoOrden implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer estadoId;
	@Column(nullable = false)
	private String descripcion;
	
	public Integer getEstadoId() {
		return estadoId;
	}
	public void setEstadoId(Integer estadoId) {
		this.estadoId = estadoId;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public EstadoOrden(Integer estadoId, String descripcion) {
		this.estadoId = estadoId;
		this.descripcion = descripcion;
	}
	public EstadoOrden() {
	}
	
	@OneToMany(mappedBy = "estadoOrden")
	private Collection<Orden> itemsOrden = new ArrayList<>();

	public Collection<Orden> getItemsOrden() {
		return itemsOrden;
	}
	public void setItemsOrden(Collection<Orden> itemsOrden) {
		this.itemsOrden = itemsOrden;
	}
	

}

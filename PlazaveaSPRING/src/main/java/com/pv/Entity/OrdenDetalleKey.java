package com.pv.Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class OrdenDetalleKey implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "orden_id")
	Integer ordenId;
	
	@Column(name = "producto_id")
	Integer productoId;

	public Integer getOrdenId() {
		return ordenId;
	}

	public void setOrdenId(Integer ordenId) {
		this.ordenId = ordenId;
	}

	public Integer getProductoId() {
		return productoId;
	}

	public void setProductoId(Integer productoId) {
		this.productoId = productoId;
	}

	public OrdenDetalleKey(Integer ordenId, Integer productoId) {
		this.ordenId = ordenId;
		this.productoId = productoId;
	}

	public OrdenDetalleKey() {
	}

}

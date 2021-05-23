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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ordenId == null) ? 0 : ordenId.hashCode());
		result = prime * result + ((productoId == null) ? 0 : productoId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrdenDetalleKey other = (OrdenDetalleKey) obj;
		if (ordenId == null) {
			if (other.ordenId != null)
				return false;
		} else if (!ordenId.equals(other.ordenId))
			return false;
		if (productoId == null) {
			if (other.productoId != null)
				return false;
		} else if (!productoId.equals(other.productoId))
			return false;
		return true;
	}
	

}

package com.pv.Objects;

import java.io.Serializable;

public class JsonOrden implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer tarjetaId;
	private String direccion;
	public Integer getTarjetaId() {
		return tarjetaId;
	}
	public void setTarjetaId(Integer tarjetaId) {
		this.tarjetaId = tarjetaId;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	

}

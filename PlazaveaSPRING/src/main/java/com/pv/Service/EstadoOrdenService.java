package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.EstadoOrden;

public interface EstadoOrdenService {
	public abstract EstadoOrden findById(Integer estadoId);
	public abstract Collection<EstadoOrden> findAll();
	

}

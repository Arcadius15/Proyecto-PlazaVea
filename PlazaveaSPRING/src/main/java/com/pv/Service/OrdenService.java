package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.Orden;

public interface OrdenService {
	public abstract Integer insert(Orden orden);
	public abstract void update(Orden orden);
	public abstract void delete(Integer ordenId);
	public abstract Orden findById(Integer OrdenId);
	public abstract Collection<Orden> findAll();
	public abstract Collection<Orden> findAllByClient(Integer clienteId);
	public abstract Collection<Object[]> findAllMostRecent();
	
}

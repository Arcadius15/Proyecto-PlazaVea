package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.Tarjeta;

public interface TarjetaService {
	
	public abstract void insert (Tarjeta tarjeta);
	public abstract void update (Tarjeta tarjeta);
	public abstract void delete (Integer tarjetaId);
	public abstract Tarjeta findById (Integer tarjetaId);
	public abstract Collection<Tarjeta> findAll ();
	
}

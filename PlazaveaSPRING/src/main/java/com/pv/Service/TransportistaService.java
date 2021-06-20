package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.Transportista;

public interface TransportistaService {
	
	public abstract void insert (Transportista transportista);
	public abstract void update (Transportista transportista);
	public abstract void delete (Integer transportistaId);
	public abstract Transportista findById (Integer transportistaId);
	public abstract Collection<Transportista> findAll ();
	public abstract Transportista findByUserId (Integer usuarioId);
	
}

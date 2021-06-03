package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.Cliente;

public interface ClienteService {
	
	public abstract void insert (Cliente cliente);
	public abstract void update (Cliente cliente);
	public abstract Cliente findById (Integer clienteId);
	public abstract Collection<Cliente> findAll ();
	public abstract Cliente findByUserId (Integer usuarioId);
	
}

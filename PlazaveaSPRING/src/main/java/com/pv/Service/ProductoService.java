package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.Producto;

public interface ProductoService {
	
	public abstract Collection<Producto> findAll();
	
}

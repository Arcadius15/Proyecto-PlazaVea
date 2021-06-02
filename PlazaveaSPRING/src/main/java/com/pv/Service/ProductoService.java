package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.Producto;

public interface ProductoService {
	
	public abstract void insert(Producto producto);
	public abstract Collection<Producto> findAll();
	public abstract Producto findById(Integer idProducto);
	public abstract Collection<Producto> findByName(String nombre);
}

package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.Usuario;


public interface LoginService {
	public abstract void insert(Usuario user);
	public abstract void update(Usuario user);
	public abstract void delete(Integer userId);
	public abstract Usuario findById(Integer userId);
	public abstract Collection<Usuario> findAll();
	public abstract Integer getMaxId ();
	
}

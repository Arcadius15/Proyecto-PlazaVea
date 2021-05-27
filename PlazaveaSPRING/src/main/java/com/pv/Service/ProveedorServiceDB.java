package com.pv.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.Proveedor;
import com.pv.Repository.ProveedorRepository;

@Service
public class ProveedorServiceDB implements ProveedorService{

	@Autowired
	private ProveedorRepository repository;
	
	@Override
	@Transactional
	public Collection<Proveedor> findAll() {
		return repository.findAll();
	}

}

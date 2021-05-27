package com.pv.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.Producto;
import com.pv.Repository.ProductoRepository;

@Service
public class ProductoServiceImpl implements ProductoService {

	@Autowired
	private ProductoRepository repository;
	
	@Override
	@Transactional(readOnly = true)
	public Collection<Producto> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Producto findById(Integer idProducto) {
		return repository.findById(idProducto).orElse(null);
	}

	@Override
	@Transactional
	public void insert(Producto producto) {
		repository.save(producto);
	}

}

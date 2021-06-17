package com.pv.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.OrdenDetalle;
import com.pv.Repository.OrdenDetRepository;

@Service
public class OrdenDetServiceDB implements OrdenDetService{

	@Autowired
	private OrdenDetRepository repository;
	
	@Override
	@Transactional
	public void insert(OrdenDetalle ordendetalle) {
		repository.save(ordendetalle); 
	}

	@Override
	@Transactional
	public void update(OrdenDetalle ordendetalle) {
		repository.save(ordendetalle);
		
	}

	@Override
	@Transactional(readOnly = true)
	public OrdenDetalle findByKey(Integer ordenId, Integer productoId) {
		return repository.findByKeY(ordenId, productoId);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<OrdenDetalle> findAll(Integer ordenId) {
		return repository.findByOrden(ordenId);
	}

	

}

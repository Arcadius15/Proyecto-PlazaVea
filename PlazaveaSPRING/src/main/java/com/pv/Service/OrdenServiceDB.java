package com.pv.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.Orden;
import com.pv.Repository.OrdenRepository;

@Service
public class OrdenServiceDB implements OrdenService{

	@Autowired
	private OrdenRepository repository;
	
	@Override
	@Transactional
	public Integer insert(Orden orden) {
		repository.save(orden);
		//se obtiene el ultimo id registrado
		return repository.getLastId();
		
	}

	@Override
	@Transactional
	public void update(Orden orden) {
		repository.save(orden);
		
	}

	@Override
	@Transactional
	public void delete(Integer ordenId) {
		repository.deleteById(ordenId);
		
	}

	@Override
	@Transactional(readOnly = true)
	public Orden findById(Integer OrdenId) {
		return repository.findById(OrdenId).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Orden> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Orden> findAllByClient(Integer clienteId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Object[]> findAllMostRecent() {
		return repository.findAllMostRecent();
	}

}

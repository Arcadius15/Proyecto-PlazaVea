package com.pv.Service;

import java.util.Collection;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.pv.Entity.Tarjeta;
import com.pv.Repository.TarjetaRepository;

public class TarjetaServiceImpl implements TarjetaService {

	@Autowired
	private TarjetaRepository repository;
	
	@Override
	@Transactional
	public void insert(Tarjeta tarjeta) {
		repository.save(tarjeta);
	}

	@Override
	@Transactional
	public void update(Tarjeta tarjeta) {
		repository.save(tarjeta);
	}

	@Override
	@Transactional
	public void delete(Integer tarjetaId) {
		repository.deleteById(tarjetaId);
	}

	@Override
	@Transactional(readOnly = true)
	public Tarjeta findById(Integer tarjetaId) {
		return repository.findById(tarjetaId).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Tarjeta> findAll() {
		return repository.findAll();
	}

}

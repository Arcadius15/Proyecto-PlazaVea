package com.pv.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.Transportista;
import com.pv.Repository.TransportistaRepository;

@Service
public class TransportistaServiceImpl implements TransportistaService {

	@Autowired
	private TransportistaRepository repository;
	
	@Override
	@Transactional
	public void insert(Transportista transportista) {
		repository.save(transportista);
	}

	@Override
	@Transactional
	public void update(Transportista transportista) {
		repository.save(transportista);
	}

	@Override
	@Transactional
	public void delete(Integer transportistaId) {
		repository.deleteById(transportistaId);
	}

	@Override
	@Transactional(readOnly = true)
	public Transportista findById(Integer transportistaId) {
		return repository.findById(transportistaId).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Transportista> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Transportista findByUserId(Integer usuarioId) {
		return repository.findByUserId(usuarioId);
	}

}

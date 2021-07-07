package com.pv.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.EstadoOrden;
import com.pv.Repository.EstadoOrdenRepository;

@Service
public class EstadoOrdenServicenImpl implements EstadoOrdenService{
	
	@Autowired
	private EstadoOrdenRepository repository;

	@Override
	@Transactional(readOnly = true)
	public EstadoOrden findById(Integer estadoId) {
		return repository.findById(estadoId).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<EstadoOrden> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public EstadoOrden findByName(String descripcion) {
		return repository.findByName(descripcion);
	}

}

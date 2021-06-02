package com.pv.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.Cliente;
import com.pv.Repository.ClienteRepository;

@Service
public class ClienteServiceImpl implements ClienteService {

	@Autowired
	private ClienteRepository repository;
	
	@Override
	@Transactional
	public void insert(Cliente cliente) {
		repository.save(cliente);
	}

	@Override
	@Transactional
	public void update(Cliente cliente) {
		repository.save(cliente);
	}

	@Override
	@Transactional(readOnly = true)
	public Cliente findById(Integer clienteId) {
		return repository.findById(clienteId).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Cliente> findAll() {
		return repository.findAll();
	}

	@Override
	public Integer findByUserId(Integer usuarioId) {
		return repository.findByUserId(usuarioId);
	}

}

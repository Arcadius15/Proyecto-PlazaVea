package com.pv.Service;

import java.util.Collection;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.Usuario;
import com.pv.Repository.UsuarioRepository;

@Service
public class LoginServiceDB implements LoginService{
	
	@Autowired
	private UsuarioRepository repository;

	@Override
	@Transactional
	public void insert(Usuario user) {
		repository.save(user);
	}

	@Override
	@Transactional
	public void update(Usuario user) {
		repository.save(user);
		
	}

	@Override
	@Transactional
	public void delete(Integer userId) {
		repository.deleteById(userId);
		
	}

	@Override
	@Transactional(readOnly = true)
	public Usuario findById(Integer userId) {
		
		return repository.findById(userId).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<Usuario> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Integer getMaxId() {
		return repository.getMaxId();
	}
	

}

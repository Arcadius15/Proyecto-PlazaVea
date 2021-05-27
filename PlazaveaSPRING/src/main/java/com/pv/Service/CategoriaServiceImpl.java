package com.pv.Service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pv.Entity.Categoria;
import com.pv.Repository.CategoriaRepository;

@Service
public class CategoriaServiceImpl implements CategoriaService{

	@Autowired
	private CategoriaRepository repository;
	
	@Override
	public Collection<Categoria> findAll() {
		return repository.findAll();
	}

}

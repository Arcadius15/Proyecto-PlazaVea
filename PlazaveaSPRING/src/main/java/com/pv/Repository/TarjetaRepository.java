package com.pv.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pv.Entity.Cliente;
import com.pv.Entity.Tarjeta;

public interface TarjetaRepository extends JpaRepository<Tarjeta, Integer>{
	
	List<Tarjeta> findByCliente(Cliente cliente);

}

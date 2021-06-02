package com.pv.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pv.Entity.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Integer>{
	
	@Query(value="select cliente_id from cliente where usuario_id = :usuarioId", nativeQuery = true)
	public abstract Integer findByUserId(@Param("usuarioId") Integer usuarioId);
	
}

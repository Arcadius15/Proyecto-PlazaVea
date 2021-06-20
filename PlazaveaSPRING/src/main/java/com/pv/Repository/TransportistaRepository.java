package com.pv.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pv.Entity.Transportista;

public interface TransportistaRepository extends JpaRepository<Transportista, Integer>{

	@Query(value="select * from transportista where usuario_id = :usuarioId", nativeQuery = true)
	public abstract Transportista findByUserId (@Param("usuarioId") Integer usuarioId);
}

package com.pv.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pv.Entity.EstadoOrden;

public interface EstadoOrdenRepository extends JpaRepository<EstadoOrden, Integer>{

	@Query(value="select * from estado_orden where descripcion = :descripcion", nativeQuery = true)
	public abstract EstadoOrden findByName(@Param("descripcion") String descripcion);
	
}

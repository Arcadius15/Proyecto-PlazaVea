package com.pv.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pv.Entity.Reporte;
import com.pv.Entity.Transportista;

public interface ReporteRepository extends JpaRepository<Reporte, Integer>{
	
	@Query(value="select * from reporte where transportista_id = :transportista_id", nativeQuery = true)
	public abstract List<Reporte> findByTransportista(@Param("transportista_id") Integer transportista_id);

}

package com.pv.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pv.Entity.Reporte;
import com.pv.Entity.Transportista;

public interface ReporteRepository extends JpaRepository<Reporte, Integer>{
	
	public abstract List<Reporte> findByTransportista(Transportista transportista);

}

package com.pv.Service;

import java.util.List;

import com.pv.Entity.Reporte;
import com.pv.Entity.Transportista;

public interface ReporteService {

	public abstract void insert (Reporte reporte);
	public abstract void update (Reporte reporte);
	public abstract void delete (Integer reporteId);
	public abstract Reporte findById (Integer reporteId);
	public abstract List<Reporte> findByTransp (Transportista transportista);
	
}

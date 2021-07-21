package com.pv.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pv.Entity.Reporte;
import com.pv.Entity.Transportista;
import com.pv.Repository.ReporteRepository;

@Service
public class ReporteServiceImpl implements ReporteService{

	@Autowired
	private ReporteRepository repository;
	
	@Override
	@Transactional
	public void insert(Reporte reporte) {
		repository.save(reporte);
		
	}

	@Override
	@Transactional
	public void update(Reporte reporte) {
		repository.save(reporte);
		
	}

	@Override
	@Transactional
	public void delete(Integer reporteId) {
		repository.deleteById(reporteId);
	}

	@Override
	@Transactional(readOnly = true)
	public Reporte findById(Integer reporteId) {
		return repository.findById(reporteId).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Reporte> findByTransp(Transportista transportista) {
		return repository.findByTransportista(transportista);
	}

}

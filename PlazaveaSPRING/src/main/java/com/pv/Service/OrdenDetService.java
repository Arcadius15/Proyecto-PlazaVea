package com.pv.Service;

import java.util.Collection;

import com.pv.Entity.OrdenDetalle;

public interface OrdenDetService {
	
	public abstract void insert(OrdenDetalle ordendetalle);
	public abstract void update(OrdenDetalle ordendetalle);
	public abstract OrdenDetalle findByKey(Integer ordenId,Integer productoId);
	public abstract Collection<OrdenDetalle> findAll(Integer ordenId);

}

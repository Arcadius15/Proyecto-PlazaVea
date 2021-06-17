package com.pv.Repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pv.Entity.OrdenDetalle;
import com.pv.Entity.OrdenDetalleKey;

public interface OrdenDetRepository extends JpaRepository<OrdenDetalle, OrdenDetalleKey>{
	
	@Query(value = "select * from orden_detalle where orden_id = :orden",nativeQuery = true)
	public Collection<OrdenDetalle> findByOrden(@Param("orden")Integer ordenId);
	
	@Query(value = "select * from orden_detalle where orden_id = :orden and producto_id = :producto",
				nativeQuery = true)
	public OrdenDetalle findByKeY(@Param("orden") Integer ordenId,
								@Param("producto") Integer productoId);
}

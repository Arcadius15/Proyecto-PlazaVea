package com.pv.Repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pv.Entity.Orden;

public interface OrdenRepository extends JpaRepository<Orden, Integer>{
	
	//se obtiene el ultimo id registrado por medio de query mysql
	@Query(value = "select last_insert_id() from orden limit 1;",nativeQuery = true)
	public Integer getLastId();
	
	@Query(value="select o.orden_id, o.direccion, o.fecha, CONCAT(c.nombre,' ',c.apellido) as 'cliente', o.estado_id, e.descripcion, sum(od.cantidad) as 'cantidad' from orden o inner join orden_detalle od \r\n"
			+ "on o.orden_id = od.orden_id inner join cliente c\r\n"
			+ "on o.cliente_id = c.cliente_id inner join estado_orden e\r\n"
			+ "on o.estado_id = e.estado_id\r\n"
			+ "group by o.orden_id, o.direccion, o.fecha, CONCAT(c.nombre,' ',c.apellido), o.estado_id, e.descripcion\r\n"
			+ "order by orden_id desc",nativeQuery=true)
	public abstract Collection<Object[]> findAllMostRecent();
	
}

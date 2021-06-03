package com.pv.Repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pv.Entity.Producto;


public interface ProductoRepository extends JpaRepository<Producto, Integer>{
	
	@Query(value =  "select * from producto where nombre like CONCAT('%',:nombre,'%')",nativeQuery = true)
	public abstract Collection<Producto> findByName(@Param("nombre") String nombre);

}

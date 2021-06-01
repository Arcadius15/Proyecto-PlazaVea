package com.pv.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pv.Entity.Producto;


public interface ProductoRepository extends JpaRepository<Producto, Integer>{
	
	@Query(value =  "select p from producto p where p.nombre like %?1%",nativeQuery = true)
	List<Producto> findByName(String nombre);

}

package com.pv.Repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pv.Entity.Producto;


public interface ProductoRepository extends JpaRepository<Producto, Integer>{
	
<<<<<<< HEAD
	@Query(value =  "select * from producto p where p.nombre like %:nombre%",nativeQuery = true)
	Collection<Producto> findByName(@Param("nombre")String nombre);
=======
	@Query(value =  "select * from producto where nombre like :nombre",nativeQuery = true)
	public abstract Collection<Producto> findByName(@Param("nombre") String nombre);
>>>>>>> branch 'master' of https://github.com/Arcadius15/Proyecto-PlazaVea.git

}

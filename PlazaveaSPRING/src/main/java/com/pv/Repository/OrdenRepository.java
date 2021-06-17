package com.pv.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pv.Entity.Orden;

public interface OrdenRepository extends JpaRepository<Orden, Integer>{
	
	//se obtiene el ultimo id registrado por medio de query mysql
	@Query(value = "select last_insert_id() from orden limit 1;",nativeQuery = true)
	public Integer getLastId();

}

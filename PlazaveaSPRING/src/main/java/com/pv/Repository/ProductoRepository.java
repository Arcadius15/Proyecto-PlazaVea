package com.pv.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pv.Entity.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer>{

}

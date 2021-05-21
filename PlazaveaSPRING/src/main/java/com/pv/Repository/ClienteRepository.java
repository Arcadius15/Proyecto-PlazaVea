package com.pv.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pv.Entity.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Integer>{

}

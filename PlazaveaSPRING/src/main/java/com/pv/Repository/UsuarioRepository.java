package com.pv.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pv.Entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

}

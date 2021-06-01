package com.pv.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pv.Entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

	@Query(value="select max(usuario_id) from usuario", nativeQuery = true)
	public abstract Integer getMaxId ();
	
}

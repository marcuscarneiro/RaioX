package br.com.marcus.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.marcus.modelo.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
	
}

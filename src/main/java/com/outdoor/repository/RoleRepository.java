package com.outdoor.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.outdoor.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findByName(String name);

	
}
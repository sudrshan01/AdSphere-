package com.outdoor.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outdoor.entity.Role;
import com.outdoor.repository.RoleRepository;

@Service
public class RoleService {
    @Autowired
    private RoleRepository roleRepository;

    public List<Role> getAllRoles() {
        return roleRepository.findAll();
    }

    public Role saveRole(Role role) {
        return roleRepository.save(role);
    }

    public Optional<Role> findByName(String name) {
        return roleRepository.findByName(name);
    }

    // **New: Delete Role**
    public void deleteRole(Long id) {
        roleRepository.deleteById(id);
    }

    // **New: Get Role by ID**
    public Role getRoleById(Long id) {
        return roleRepository.findById(id).orElse(null);
    }

    // **New: Update Role**
    public Role updateRole(Role role) {
        return roleRepository.save(role);
    }

	public List<Role> roleList() {
		
		return roleRepository.findAll();
	}
	 public Set<Role> getRolesByIds(List<Long> roleIds) {
	        return roleRepository.findAllById(roleIds).stream()
	                             .collect(Collectors.toSet());
	    }
}

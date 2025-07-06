package com.outdoor.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outdoor.entity.Role;
import com.outdoor.entity.User;
import com.outdoor.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User saveUser(User user) {
        // Directly save the user without encrypting the password
        return userRepository.save(user);
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public String checkLogin(String username, String password) {
        Optional<User> userOptional = userRepository.findByUsername(username);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
 if( user.getPassword().equals(password)) {
	 Set<Role> roles = user.getRoles();
	//Print each role name
String r = null;
	for (Role role : roles) {
	r=  role.getName(); 
	}
	return r;
 }
            
        }
        return null;
    }
}

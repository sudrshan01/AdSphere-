package com.outdoor.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.outdoor.entity.Role;
import com.outdoor.entity.User;
import com.outdoor.service.RoleService;
import com.outdoor.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RoleService roleService;

    // Get all users
    @GetMapping("/users")
    public String getAllUsers(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "users"; // Refers to users.jsp
    }

    // Show form to add a new user
    @GetMapping("/add")
    public String showAddUserForm(Model model) {
        List<Role> roles = roleService.roleList();
        model.addAttribute("roles", roles);
        return "addUser"; // Refers to addUser.jsp
    }

    // Save a new user
    @PostMapping("/saveUser")
    public String saveUser(@RequestParam("email") String email,
                           @RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("roleIds") List<Long> roleIds,
                           Model model) {
        User user = new User();
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);

        Set<Role> roles = new HashSet<>(roleService.getRolesByIds(roleIds));
        user.setRoles(roles);

        userService.saveUser(user);

        // Set SweetAlert data
        model.addAttribute("successMessage", "User added successfully!");
        model.addAttribute("redirectAfterAlert", "/");
        model.addAttribute("roles", roleService.roleList()); // reload role list
        return "addUser";
    }


    // Show the form to edit an existing user
    @GetMapping("/edit/{id}")
    public String showEditUserForm(@PathVariable Long id, Model model) {
        User user = userService.getUserById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        List<Role> roles = roleService.roleList(); // Fetch all roles for the selection
        model.addAttribute("user", user);
        model.addAttribute("roles", roles);
        return "editUser"; // Refers to editUser.jsp
    }

    // Update an existing user
    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, 
                             @RequestParam("email") String email,
                             @RequestParam("username") String username,
                             @RequestParam("password") String password,
                             @RequestParam("roleIds") List<Long> roleIds) {
        User user = userService.getUserById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password); // Update the password
        
        Set<Role> roles = new HashSet<>(roleService.getRolesByIds(roleIds));
        user.setRoles(roles);

        userService.saveUser(user);
        return "redirect:/user/users";
    }

    // Delete a user
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return "redirect:/user/users";
    }
}

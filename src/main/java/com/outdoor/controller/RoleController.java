package com.outdoor.controller;

import com.outdoor.entity.Role;
import com.outdoor.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/roles")
    public String getAllRoles(Model model) {
        model.addAttribute("roles", roleService.getAllRoles());
        return "roles"; // Refers to roles.jsp
    }

    @GetMapping("/add")
    public String showAddRoleForm(Model model) {
        model.addAttribute("role", new Role());
        return "addRole"; // Refers to addRole.jsp
    }

    @PostMapping("/saveRole")
    public String saveRole(@ModelAttribute("role") Role role) {
        roleService.saveRole(role);
        return "redirect:/role/roles";
    }

    // **New: Delete Role**
    @GetMapping("/delete/{id}")
    public String deleteRole(@PathVariable Long id) {
        roleService.deleteRole(id);
        return "redirect:/role/roles";
    }

    // **New: Update Role Form**
    @GetMapping("/edit/{id}")
    public String showUpdateRoleForm(@PathVariable Long id, Model model) {
        Role role = roleService.getRoleById(id);
        model.addAttribute("role", role);
        return "editRole"; // Refers to editRole.jsp
    }

    // **New: Update Role Submission**
    @PostMapping("/update")
    public String updateRole(@ModelAttribute("role") Role role) {
        roleService.updateRole(role);
        return "redirect:/role/roles";
    }
}

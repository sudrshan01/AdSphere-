package com.outdoor.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.outdoor.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private UserService userService;

	@PostMapping("/checkLogin")
	public String checkLogin(@RequestParam("username") String username,
	                         @RequestParam("password") String password,
	                         HttpSession session,
	                         Model model) {

	    String role = userService.checkLogin(username, password);

	    if (role != null) {
	        session.setAttribute("msgg", username); // Store in session
	        session.setAttribute("role", role); // "admin", "user", or "advertiser"

	        if (role.equals("admin") || role.equals("advtiser")) {
	            return "redirect:/login/home";
	        } else if (role.equals("user")) {
	            return "redirect:/login/userhome";
	        } else {
	            model.addAttribute("msg", "Invalid role.");
	            return "/index";
	        }
	    } else {
	        model.addAttribute("msg", "Invalid email or password.");
	        return "/index";
	    }
	}


	@GetMapping("/logout")
    public String home() {
        return "index"; 
    }
	@RequestMapping("/home")
	public String homee() {
	    return "home"; // This will resolve to home.jsp
	}
	@RequestMapping("/userhome")
	public String userHome() {
	    return "userHome"; // This will resolve to home.jsp
	}
	

}

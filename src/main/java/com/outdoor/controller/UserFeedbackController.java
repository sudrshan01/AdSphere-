package com.outdoor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.outdoor.entity.UserFeedback;
import com.outdoor.service.CampaignService;
import com.outdoor.service.MediaAssetService;
import com.outdoor.service.UserFeedbackService;
import com.outdoor.service.UserService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
@RequestMapping("/userfd")
public class UserFeedbackController {
    @Autowired
    private UserFeedbackService userFeedbackService;

    @Autowired
    private CampaignService campaignService;

    @Autowired
    private MediaAssetService mediaAssetService;

    @Autowired
    private UserService userService;

    @GetMapping("/userFeedback")
    public String getAllFeedback(Model model) {
        model.addAttribute("feedbackList", userFeedbackService.getAllFeedback());
        return "userFeedback"; // Refers to userFeedback.jsp
    }
   

    @PostMapping("/saveUserFeedback")
    public String saveFeedback(@ModelAttribute("userFeedback") UserFeedback userFeedback,
                               RedirectAttributes redirectAttributes) {
        userFeedbackService.saveFeedback(userFeedback);
        redirectAttributes.addFlashAttribute("successMessage", "Feedback submitted successfully!");
        return "redirect:/userfd/add";
    }

    @GetMapping("/add")
    public String showAddFeedbackForm(Model model) {
        model.addAttribute("userFeedback", new UserFeedback());
        model.addAttribute("campaigns", campaignService.getAllCampaigns());
        model.addAttribute("mediaAssets", mediaAssetService.getAllAssets());
        model.addAttribute("users", userService.getAllUsers());
        return "addUserFeedback"; // Refers to addUserFeedback.jsp
    }
    

	/*
	 * @PostMapping("/saveUserFeedback") public String
	 * saveFeedback(@ModelAttribute("userFeedback") UserFeedback userFeedback) {
	 * userFeedbackService.saveFeedback(userFeedback); return
	 * "redirect:/userfd/userFeedback"; }
	 */
    
    
    @GetMapping("/edit/{id}")
    public String showEditFeedbackForm(@PathVariable Long id, Model model) {
        UserFeedback userFeedback = userFeedbackService.getFeedbackById(id).orElseThrow(() -> new IllegalArgumentException("Invalid feedback Id:" + id));
        model.addAttribute("userFeedback", userFeedback);
        model.addAttribute("campaigns", campaignService.getAllCampaigns());
        model.addAttribute("mediaAssets", mediaAssetService.getAllAssets());
        model.addAttribute("users", userService.getAllUsers());
        return "editUserFeedback"; // Refers to editUserFeedback.jsp
    }

    @PostMapping("/update/{id}")
    public String updateFeedback(@PathVariable Long id, @ModelAttribute("userFeedback") UserFeedback userFeedback) {
        userFeedback.setId(id);
        userFeedbackService.saveFeedback(userFeedback);
        return "redirect:/userfd/userFeedback";
    }

    @GetMapping("/delete/{id}")
    public String deleteFeedback(@PathVariable Long id) {
        userFeedbackService.deleteFeedback(id);
        return "redirect:/userfd/userFeedback";
    }
}

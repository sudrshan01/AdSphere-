package com.outdoor.controller;

import com.outdoor.entity.MediaAsset;
import com.outdoor.service.MediaAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/media")
public class MediaAssetController {

    @Autowired
    private MediaAssetService mediaAssetService;

    @GetMapping("/assets")
    public String getAllAssets(Model model) {
        model.addAttribute("assets", mediaAssetService.getAllAssets());
        return "assets"; // Refers to assets.jsp
    }

    @GetMapping("/add")
    public String showAddAssetForm(Model model) {
        model.addAttribute("asset", new MediaAsset());
        return "addAsset"; // Refers to addAsset.jsp
    }
    @PostMapping("/save")
    public String saveAsset(@ModelAttribute("asset") MediaAsset asset, Model model) {
        mediaAssetService.saveAsset(asset);
        model.addAttribute("successMessage", "Media Asset saved successfully!");
        model.addAttribute("redirectAfterAlert", "/OutDoorMedia/media/assets"); // URL to redirect after alert
        return "addAsset";
    }


	/*
	 * @PostMapping("/save") public String saveAsset(@ModelAttribute("asset")
	 * MediaAsset asset, RedirectAttributes redirectAttributes) {
	 * mediaAssetService.saveAsset(asset);
	 * redirectAttributes.addFlashAttribute("successMessage",
	 * "Media Asset saved successfully!"); return "redirect:/media/add"; }
	 */

    @GetMapping("/delete/{id}")
    public String deleteAsset(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        mediaAssetService.deleteAsset(id);
        redirectAttributes.addFlashAttribute("successMessage", "Media Asset deleted successfully!");
        return "redirect:/media/assets";
    }

    @GetMapping("/edit/{id}")
    public String showUpdateAssetForm(@PathVariable Long id, Model model) {
        MediaAsset asset = mediaAssetService.getAssetById(id);
        model.addAttribute("asset", asset);
        return "editAsset"; // Refers to editAsset.jsp
    }

    @PostMapping("/update")
    public String updateAsset(@ModelAttribute("asset") MediaAsset asset, RedirectAttributes redirectAttributes) {
        mediaAssetService.updateAsset(asset);
        redirectAttributes.addFlashAttribute("successMessage", "Media Asset updated successfully!");
        return "redirect:/media/assets";
    }
}

package com.outdoor.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.MediaType;

import com.outdoor.entity.Campaign;
import com.outdoor.entity.MediaAsset;
import com.outdoor.service.CampaignService;
import com.outdoor.service.MediaAssetService;

@Controller
@RequestMapping("/campaign")
public class CampaignController {

    @Autowired
    private CampaignService campaignService;

    @Autowired
    private MediaAssetService mediaAssetService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/list")
    public String getAllCampaigns(Model model) {
        model.addAttribute("campaigns", campaignService.getAllCampaigns());
        return "campaigns"; // Refers to campaigns.jsp
    }

    @GetMapping("/add")
    public String showAddCampaignForm(Model model) {
        List<MediaAsset> list = mediaAssetService.getAllAssets();
        model.addAttribute("currentStep", "campaign");
        model.addAttribute("mediaAssets", list);
        model.addAttribute("campaign", new Campaign());
        return "addCampaign"; // Refers to addCampaign.jsp
    }

    @PostMapping("/save")
    public String saveCampaign(@ModelAttribute("campaign") Campaign campaign) {
        // Fetch MediaAsset by ID and set it to the campaign
        Long mediaAssetId = campaign.getMediaAsset().getId();
        MediaAsset mediaAsset = mediaAssetService.getAssetById(mediaAssetId);
        campaign.setMediaAsset(mediaAsset);

        campaignService.saveCampaign(campaign);
        return "redirect:/content/addContent";
    }
    @GetMapping("/edit/{id}")
    public String showUpdateCampaignForm(@PathVariable("id") Long id, Model model) {
        Campaign campaign = campaignService.getCampaignById(id); // Fetch campaign by ID
        List<MediaAsset> mediaAssets = mediaAssetService.getAllAssets(); // Get all media assets
        model.addAttribute("campaign", campaign);  // Add the campaign to the model for editing
        model.addAttribute("mediaAssets", mediaAssets); // Add the list of media assets
        return "editCampaign";  // Redirect to the edit form (JSP page)
    }

    @PostMapping("/update")
    public String updateCampaign(@ModelAttribute("campaign") Campaign campaign) {
        campaignService.saveCampaign(campaign);  // Save the updated campaign
        return "redirect:/campaign/list";  // Redirect back to the campaigns list
    }
    @GetMapping("/delete/{id}")
    public String deleteCampaign(@PathVariable("id") Long id) {
        campaignService.deleteCampaign(id); // Delete the campaign from the database
        return "redirect:/campaign/list";  // Redirect back to the campaigns list
    }
    @GetMapping(value = "/available", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<MediaAsset> getAvailableMediaAssets(
            @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
    //	System.out.println(startDate + " "+ endDate);
        return campaignService.getAvailableAssets(startDate, endDate);
    }

}

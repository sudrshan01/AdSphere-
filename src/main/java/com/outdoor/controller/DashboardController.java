package com.outdoor.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.outdoor.entity.Payment;
import com.outdoor.service.CampaignService;
import com.outdoor.service.MediaAssetService;
import com.outdoor.service.PaymentService;
import com.outdoor.service.UserService;

@Controller
@RequestMapping("/dash")
public class DashboardController {
    
    @Autowired
    private CampaignService campaignService;
    @Autowired
    private UserService userService;
    @Autowired
    private PaymentService paymentService;

    @Autowired
    private MediaAssetService mediaAssetService;

   

    @GetMapping("/summary")
    @ResponseBody
    public Map<String, Object> getDashboardSummary() {
        Map<String, Object> data = new HashMap<>();
        data.put("totalCampaigns", campaignService.getAllCampaigns().size()); 
        
        data.put("totalAssets", mediaAssetService.getAllAssets().size());
        data.put("totalUser", userService.getAllUsers().size());
        data.put("totalRevenue", paymentService.getAllPayments().stream().mapToDouble(Payment::getAmount).sum()); // Corrected this line
        return data;
    }


}
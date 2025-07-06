package com.outdoor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.outdoor.entity.Campaign;
import com.outdoor.entity.Content;
import com.outdoor.entity.Payment;
import com.outdoor.service.CampaignService;
import com.outdoor.service.ContentService;
import com.outdoor.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private CampaignService campaignService;
    @Autowired
    private ContentService contentService;

//    @Autowired
//    private InvoiceService invoiceService;

    @GetMapping("/payments")
    public String getAllPayments(Model model) {
        model.addAttribute("payments", paymentService.getAllPayments());
        return "payments"; // Refers to payments.jsp
    }

    @GetMapping("/add")
    public String showAddPaymentForm(Model model) {
        model.addAttribute("payment", new Payment());
       
        model.addAttribute("currentStep", "payment");

        // Fetch the latest campaign
        Campaign lastCampaign = campaignService.findLastCampaign();
        
        // Set the last budget if available
        double lastBudget = (lastCampaign != null) ? lastCampaign.getBudget() : 0.0;
        model.addAttribute("amount", lastBudget);
       
	    String lastCampaignName = (lastCampaign != null) ? lastCampaign.getName() : "N/A";
	    Long lastCampaignId = (lastCampaign != null) ? lastCampaign.getId() : 0;
	    model.addAttribute("lastCampaignName", lastCampaignName);
	    model.addAttribute("lastCampaignId", lastCampaignId);
	    Content lastContent = contentService.findLastCampaign();
	    String lastContentName = (lastContent != null) ? lastContent.getTitle() : "N/A";
	    Long lastContentId = (lastContent != null) ? lastContent.getId() : 0;
	    model.addAttribute("lastContentName", lastContentName);
	    model.addAttribute("lastContentId", lastContentId);
        return "addPayment"; // Refers to addPayment.jsp
    }


    @PostMapping("/savePayment")
    public String savePayment(@ModelAttribute("payment") Payment payment) {
        paymentService.savePayment(payment);
        return "redirect:/payment/in/"+payment.getId();
    }

    // **New: Delete Payment**
    @GetMapping("/delete/{id}")
    public String deletePayment(@PathVariable Long id) {
        paymentService.deletePayment(id);
        return "redirect:/payment/payments";
    }

    // **New: Update Payment Form**
    @GetMapping("/edit/{id}")
    public String showUpdatePaymentForm(@PathVariable Long id, Model model) {
        Payment payment = paymentService.getPaymentById(id);
        
        model.addAttribute("payment", payment);
      
        return "editPayment"; // Refers to editPayment.jsp
    }

    // **New: Update Payment Submission**
    @PostMapping("/update")
    public String updatePayment(@ModelAttribute("payment") Payment payment) {
        paymentService.updatePayment(payment);
        return "redirect:/payment/payments";
    }
    @GetMapping("/in/{id}")
    public String generateInvoice(@PathVariable Long id, Model model) {
        Payment payment = paymentService.getPaymentById(id);
      
        model.addAttribute("payment", payment);
        model.addAttribute("currentStep", "invoice");
        return "invoice"; // JSP file name
    }
}

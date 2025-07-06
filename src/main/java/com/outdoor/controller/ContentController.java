package com.outdoor.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.outdoor.entity.Campaign;
import com.outdoor.entity.Content;
import com.outdoor.service.CampaignService;
import com.outdoor.service.ContentService;
import com.outdoor.service.UserService;

@Controller
@RequestMapping("/content")
public class ContentController {

	private static final String UPLOAD_DIR = "D:/uploads/";

	@Autowired
	private ContentService contentService;

	@Autowired
	private CampaignService campaignService;

	@Autowired
	private UserService userService;

	@GetMapping("/contents")
	public String getAllContent(Model model) {
		model.addAttribute("contentList", contentService.getAllContent());
		return "content"; // Refers to content.jsp
	}

	@GetMapping("/addContent")
	public String showAddContentForm(Model model) {
		Campaign lastCampaign = campaignService.findLastCampaign();
		String lastCampaignName = (lastCampaign != null) ? lastCampaign.getName() : "N/A";
		Long lastCampaignId = (lastCampaign != null) ? lastCampaign.getId() : 0;

		model.addAttribute("lastCampaignName", lastCampaignName);
		model.addAttribute("lastCampaignId", lastCampaignId);
		model.addAttribute("content", new Content());
		model.addAttribute("currentStep", "content");
		model.addAttribute("users", userService.getAllUsers());

		return "addContent"; // Refers to addContent.jsp
	}

	@PostMapping("/saveContent")
	public String saveContent(@ModelAttribute("content") Content content,
			@RequestParam("filePath") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				Path uploadPath = Paths.get(UPLOAD_DIR);
				if (!Files.exists(uploadPath)) {
					Files.createDirectories(uploadPath);
				}

				String fileName = file.getOriginalFilename();
				Path filePath = uploadPath.resolve(fileName);
				Files.write(filePath, file.getBytes());

				content.setFile_path(filePath.toAbsolutePath().toString());
			} catch (IOException e) {
				e.printStackTrace();
				return "redirect:/content/contents?error=fileUpload";
			}
		}

		contentService.saveContent(content);
		return "redirect:/payment/add";
	}

	@GetMapping("/updateContentStatus/{id}")
	public String updateContentStatus(@PathVariable Long id, @RequestParam String status) {
		contentService.updateContentStatus(id, status);
		return "redirect:/content/contents";
	}

	@GetMapping("/delete/{id}")
	public String deleteContent(@PathVariable Long id) {
		contentService.deleteContent(id);
		return "redirect:/content/contents";
	}

	@GetMapping("/edit/{id}")
	public String showUpdateForm(@PathVariable Long id, Model model) {
		Content content = contentService.getContentById(id);
		model.addAttribute("content", content);
		model.addAttribute("campaigns", campaignService.getAllCampaigns());
		model.addAttribute("users", userService.getAllUsers());
		return "editContent"; // Refers to editContent.jsp
	}

	@PostMapping("/updateContent")
	public String updateContent(@ModelAttribute("content") Content content,
			@RequestParam("filePath") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				Path uploadPath = Paths.get(UPLOAD_DIR);
				if (!Files.exists(uploadPath)) {
					Files.createDirectories(uploadPath);
				}

				String fileName = file.getOriginalFilename();
				Path filePath = uploadPath.resolve(fileName);
				Files.write(filePath, file.getBytes());

				content.setFile_path(filePath.toAbsolutePath().toString());
			} catch (IOException e) {
				e.printStackTrace();
				return "redirect:/content/contents?error=fileUpload";
			}

		}
		contentService.saveContent(content);
		return "redirect:/content/contents";
	}
}

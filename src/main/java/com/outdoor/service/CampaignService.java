package com.outdoor.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outdoor.entity.Campaign;
import com.outdoor.entity.MediaAsset;
import com.outdoor.repository.CampaignRepository;
import com.outdoor.repository.MediaAssetRepository;

@Service
public class CampaignService {
    @Autowired
    private CampaignRepository campaignRepository;
    @Autowired
    private MediaAssetRepository mediaAssetRepository;
    
    public List<Campaign> getAllCampaigns() {
        return campaignRepository.findAll();
    }

    public Campaign saveCampaign(Campaign campaign) {
        return campaignRepository.save(campaign);
    }

    public List<Campaign> getCampaignsByMediaAssetId(Long mediaAssetId) {
        return campaignRepository.findByMediaAssetId(mediaAssetId);
    }
    public void deleteCampaign(Long id) {
        campaignRepository.deleteById(id);  // Deletes the campaign by its ID
    }
    public Campaign getCampaignById(Long id) {
        return campaignRepository.findById(id).orElse(null);  // Fetch campaign by ID
    }
    public Campaign findLastCampaign() {
        return campaignRepository.findTopByOrderByIdDesc(); // Fetch latest campaign by ID
    }
    public List<MediaAsset> getAvailableAssets(LocalDate startDate, LocalDate endDate) {
        // Step 1: Get engaged media asset IDs
        List<Long> engagedIds = campaignRepository.findEngagedMediaAssetIds(startDate, endDate);
       

        // Step 2: If no engaged IDs, return all
        if (engagedIds == null || engagedIds.isEmpty()) {
            List<MediaAsset> allAssets = mediaAssetRepository.findAll();
         
            return allAssets;
        }

        // Step 3: Remove nulls from engaged IDs
        engagedIds.removeIf(Objects::isNull);

        if (engagedIds.isEmpty()) {
            List<MediaAsset> allAssets = mediaAssetRepository.findAll();
          
            return allAssets;
        }

        // Step 4: Return assets not in engaged list
        List<MediaAsset> result;

        if (engagedIds.size() == 1) {
            result = mediaAssetRepository.findByIdNot(engagedIds.get(0));
           
        } else {
            result = mediaAssetRepository.findByIdNotIn(engagedIds);
           
        }

        // Step 5: Return result
        return result;
    }

	/*
	 * public List<MediaAsset> getAvailableAssets(LocalDate startDate, LocalDate
	 * endDate) { List<Long> engagedIds =
	 * campaignRepository.findEngagedMediaAssetIds(startDate, endDate);
	 * System.out.println(engagedIds); // Remove any nulls (in case) and check empty
	 * if (engagedIds == null || engagedIds.isEmpty()) { return
	 * mediaAssetRepository.findAll(); }
	 * 
	 * engagedIds.removeIf(Objects::isNull);
	 * 
	 * if (engagedIds.isEmpty()) { return mediaAssetRepository.findAll(); } else {
	 * return mediaAssetRepository.findByIdNotIn(engagedIds); } }
	 */

}

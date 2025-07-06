package com.outdoor.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outdoor.entity.UserFeedback;
import com.outdoor.repository.UserFeedbackRepository;
@Service
public class UserFeedbackService {
    @Autowired
    private UserFeedbackRepository userFeedbackRepository;

    public List<UserFeedback> getAllFeedback() {
        return userFeedbackRepository.findAll();
    }

    public UserFeedback saveFeedback(UserFeedback userFeedback) {
        return userFeedbackRepository.save(userFeedback);
    }

    public Optional<UserFeedback> getFeedbackById(Long id) {
        return userFeedbackRepository.findById(id);
    }

    public void deleteFeedback(Long id) {
        userFeedbackRepository.deleteById(id);
    }

    public List<UserFeedback> getFeedbackByUserId(Long userId) {
        return userFeedbackRepository.findByUserId(userId);
    }

    public List<UserFeedback> getFeedbackByCampaignId(Long campaignId) {
        return userFeedbackRepository.findByCampaignId(campaignId);
    }

    public List<UserFeedback> getFeedbackByMediaAssetId(Long mediaAssetId) {
        return userFeedbackRepository.findByMediaAssetId(mediaAssetId);
    }
}

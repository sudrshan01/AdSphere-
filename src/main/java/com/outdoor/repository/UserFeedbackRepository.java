package com.outdoor.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.outdoor.entity.UserFeedback;

public interface UserFeedbackRepository extends JpaRepository<UserFeedback, Long> {
    List<UserFeedback> findByUserId(Long userId);
    List<UserFeedback> findByCampaignId(Long campaignId);
    List<UserFeedback> findByMediaAssetId(Long mediaAssetId);
}
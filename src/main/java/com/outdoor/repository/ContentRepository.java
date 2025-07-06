package com.outdoor.repository;

import com.outdoor.entity.Content;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ContentRepository extends JpaRepository<Content, Long> {
    List<Content> findByCampaignId(Long campaignId);
    List<Content> findByStatus(String status);
    List<Content> findByUserId(Long userId);
	Content findTopByOrderByIdDesc();
}
package com.outdoor.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.outdoor.entity.Content;
import com.outdoor.repository.ContentRepository;

@Service
public class ContentService {
    @Autowired
    private ContentRepository contentRepository;

    public List<Content> getAllContent() {
        return contentRepository.findAll();
    }

    public Content saveContent(Content content) {
        return contentRepository.save(content);
    }

    public Content getContentById(Long id) {
        return contentRepository.findById(id).orElseThrow();
    }

    public void updateContentStatus(Long contentId, String status) {
        Content content = contentRepository.findById(contentId).orElseThrow();
        content.setStatus(status);
        contentRepository.save(content);
    }

    public void deleteContent(Long id) {
        contentRepository.deleteById(id);
    }

	public Content findLastCampaign() {
		// TODO Auto-generated method stub
		return contentRepository.findTopByOrderByIdDesc();
	}
}

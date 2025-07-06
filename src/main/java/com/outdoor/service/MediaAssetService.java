package com.outdoor.service;

import com.outdoor.entity.MediaAsset;
import com.outdoor.repository.MediaAssetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MediaAssetService {
    @Autowired
    private MediaAssetRepository mediaAssetRepository;

    public List<MediaAsset> getAllAssets() {
        return mediaAssetRepository.findAll();
    }

    public MediaAsset saveAsset(MediaAsset asset) {
        return mediaAssetRepository.save(asset);
    }

    public MediaAsset getAssetById(Long id) {
        return mediaAssetRepository.findById(id).orElse(null);
    }

    // New: Delete Asset
    public void deleteAsset(Long id) {
        mediaAssetRepository.deleteById(id);
    }

    // New: Update Asset
    public MediaAsset updateAsset(MediaAsset asset) {
        return mediaAssetRepository.save(asset);
    }
}

package com.outdoor.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.outdoor.entity.MediaAsset;

public interface MediaAssetRepository extends JpaRepository<MediaAsset, Long> {
    List<MediaAsset> findByLocation(String location);
    List<MediaAsset> findByIdNotIn(List<Long> ids);
    List<MediaAsset> findByIdNot(Long id); // for single id



}
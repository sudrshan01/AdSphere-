package com.outdoor.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.outdoor.entity.Campaign;

@Repository
public interface CampaignRepository extends JpaRepository<Campaign, Long> {
    List<Campaign> findByMediaAssetId(Long mediaAssetId);

	Campaign findTopByOrderByIdDesc();


    @Query("SELECT c.mediaAsset.id FROM Campaign c " +
           "WHERE (c.startDate <= :endDate AND c.endDate >= :startDate)")
    List<Long> findEngagedMediaAssetIds(@Param("startDate") LocalDate startDate,
                                        @Param("endDate") LocalDate endDate);
}

package com.outdoor.entity;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Getter
@Setter
@Entity
public class Content {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    private String type; // Image, Video, Text
    private String file_path; // Path to the uploaded file
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    private String status; // Draft, Pending Approval, Approved, Rejected

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "campaign_id", nullable = false)
    private Campaign campaign;

    
    
    
}
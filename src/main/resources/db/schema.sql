CREATE SCHEMA outdoor_advertising;

USE outdoor_advertising;

-- MediaAsset Table
CREATE TABLE MediaAsset (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(255),
    type VARCHAR(255),
    price DOUBLE PRECISION
);

CREATE TABLE campaign (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    budget DOUBLE PRECISION NOT NULL,
    media_asset_id BIGINT NOT NULL,
    FOREIGN KEY (media_asset_id) REFERENCES media_asset(id) ON DELETE CASCADE
);



CREATE TABLE user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE role (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE
);
CREATE TABLE payment (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    payment_method VARCHAR(50) NOT NULL,  -- Credit Card, Bank Transfer, etc.
    campaign_id BIGINT NOT NULL,
    content_id BIGINT NOT NULL,
     CONSTRAINT fk_payment_content FOREIGN KEY (content_id) REFERENCES Content(id) ON DELETE CASCADE,
    CONSTRAINT fk_payment_campaign FOREIGN KEY (campaign_id) REFERENCES Campaign(id) ON DELETE CASCADE
);

CREATE TABLE content (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    type VARCHAR(255),  -- Image, Video, Text
    file_path VARCHAR(255),  -- Path to the uploaded file
    created_at DATE,
    status VARCHAR(255),  -- Draft, Pending Approval, Approved, Rejected
    user_id BIGINT NOT NULL,  -- Foreign key to the User entity
    campaign_id BIGINT NOT NULL,  -- Foreign key to the Campaign entity
    FOREIGN KEY (user_id) REFERENCES user(id),  -- Assuming the User table has id as the primary key
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)  -- Assuming the Campaign table has id as the primary key
);
CREATE TABLE user_feedback (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, 
    feedback VARCHAR(255),
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    created_at DATETIME,
    user_id BIGINT NOT NULL,
    campaign_id BIGINT DEFAULT NULL,
    media_asset_id BIGINT DEFAULT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    CONSTRAINT fk_campaign FOREIGN KEY (campaign_id) REFERENCES campaign(id) ON DELETE CASCADE,
    CONSTRAINT fk_media_asset FOREIGN KEY (media_asset_id) REFERENCES mediaasset(id) ON DELETE CASCADE
);


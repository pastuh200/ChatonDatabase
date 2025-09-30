CREATE TABLE Users_log(
    id INT PRIMARY KEY,
    event_time DATETIME  NOT NULL,
    username VARCHAR(255) NOT NULL,
    action_type VARCHAR(50) NOT NULL,
    table_name VARCHAR(255) NOT NULL, 
    [user_id] NCHAR(455) NULL
);

--USE BuildingMaterialsTradingCo;

-- CREATE SCHEMA Survey;


-- Drop existing tables if they exist (optional cleanup)
DROP TABLE IF EXISTS Survey.Surveys;
DROP TABLE IF EXISTS Survey.Users;
DROP TABLE IF EXISTS Survey.Change;
DROP TABLE IF EXISTS Survey.Questions;
DROP TABLE IF EXISTS Survey.Survey_Responses;
DROP TABLE IF EXISTS Survey.Survey_Comparison;


-- Create Surveys Table
CREATE TABLE Surveys (
    survey_id INT PRIMARY KEY,
    survey_type VARCHAR(50),
    survey_date DATETIME,
    change_id INT,
    description TEXT
);

-- Create Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(100)
);

-- Create Change Table
CREATE TABLE Change (
    change_id INT PRIMARY KEY,
    change_name VARCHAR(255),
    start_date DATETIME,
    end_date DATETIME,
    status VARCHAR(50)
);

-- Create Questions Table
CREATE TABLE Questions (
    question_id INT PRIMARY KEY,
    question_text TEXT,
    question_type VARCHAR(50)
);

-- Create Survey Responses Table
CREATE TABLE Survey_Responses (
    response_id INT PRIMARY KEY,
    survey_id INT,
    user_id INT,
    question_id INT,
    response_value VARCHAR(255),
    comment TEXT,
    FOREIGN KEY (survey_id) REFERENCES Surveys(survey_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (question_id) REFERENCES Questions(question_id)
);

-- Create Survey Comparison Table
CREATE TABLE Survey_Comparison (
    comparison_id INT PRIMARY KEY,
    change_id INT,
    department VARCHAR(100),
    pre_change_score FLOAT,
    post_change_score FLOAT,
    satisfaction_change FLOAT
);

-- Populate Change Table
INSERT INTO Change (change_id, change_name, start_date, end_date, status) VALUES
(1, 'Data Migration to Azure', '2025-06-01', '2025-06-15', 'Completed');

-- Populate Surveys Table
INSERT INTO Surveys (survey_id, survey_type, survey_date, change_id, description) VALUES
(1, 'Pre-Change', '2025-05-30', 1, 'Pre-Data Migration Survey'),
(2, 'Post-Change', '2025-06-16', 1, 'Post-Data Migration Survey');

-- Populate Users Table (100 Users)
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Users (user_id, first_name, last_name, email, department)
    VALUES
    (@i, 'FirstName' + CAST(@i AS VARCHAR(3)), 'LastName' + CAST(@i AS VARCHAR(3)), 'user' + CAST(@i AS VARCHAR(3)) + '@example.com', 'Department' + CAST((@i % 5 + 1) AS VARCHAR(1)));
    SET @i = @i + 1;
END;

-- Populate Questions Table (5 Example Questions)
INSERT INTO Questions (question_id, question_text, question_type) VALUES
(1, 'How satisfied are you with the current data systems?', 'Rating'),
(2, 'Do you feel confident in the data migration process?', 'Yes/No'),
(3, 'How would you rate the support during the migration?', 'Rating'),
(4, 'How easy was it to access the new system after the migration?', 'Rating'),
(5, 'Do you think the migration has improved your workflow?', 'Yes/No');

-- Populate Survey Responses Table (100 Responses for Each Survey)

-- Pre-Change Survey Responses
DECLARE @response_id INT = 1;
WHILE @response_id <= 100
BEGIN
    INSERT INTO Survey_Responses (response_id, survey_id, user_id, question_id, response_value, comment)
    VALUES
    (@response_id, 1, @response_id, (1 + (@response_id % 5)), CAST(CEILING(RAND() * 5) AS VARCHAR(1)), 'Pre-migration response');
    SET @response_id = @response_id + 1;
END;

-- Post-Change Survey Responses
DECLARE @response_id INT = 101;
WHILE @response_id <= 200
BEGIN
    INSERT INTO Survey_Responses (response_id, survey_id, user_id, question_id, response_value, comment)
    VALUES
    (@response_id, 2, (@response_id - 100), (1 + ((@response_id - 100) % 5)), CAST(CEILING(RAND() * 5) AS VARCHAR(1)), 'Post-migration response');
    SET @response_id = @response_id + 1;
END;

-- Populate Survey Comparison Table (Dummy Data for Pre/Post Comparison)
INSERT INTO Survey_Comparison (comparison_id, change_id, department, pre_change_score, post_change_score, satisfaction_change) VALUES
(1, 1, 'Department1', 3.2, 4.5, 1.3),
(2, 1, 'Department2', 2.8, 4.0, 1.2),
(3, 1, 'Department3', 3.5, 4.3, 0.8),
(4, 1, 'Department4', 3.0, 4.2, 1.2),
(5, 1, 'Department5', 3.1, 4.6, 1.5);



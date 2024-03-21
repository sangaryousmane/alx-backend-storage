DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score DECIMAL(10, 2);
    DECLARE total_weight DECIMAL(10, 2);
    DECLARE avg_weighted_score DECIMAL(10, 2);
    
    -- Calculate the total weighted score
    SELECT SUM(score * weight) INTO total_score
    FROM scores
    WHERE user_id = user_id;
    
    -- Calculate the total weight
    SELECT SUM(weight) INTO total_weight
    FROM scores
    WHERE  user_id = user_id;
    
    -- Compute the average weighted score
    SET avg_weighted_score = total_score / total_weight;
    
    -- Store the average weighted score in a separate table or update an existing record
    INSERT INTO average_weighted_scores (user_id, average_score) 
    VALUES (user_id, avg_weighted_score)
    ON DUPLICATE KEY UPDATE average_score = avg_weighted_score;
END;
//

DELIMITER ;


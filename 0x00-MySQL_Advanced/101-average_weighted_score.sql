-- Compute Average Weighted score for user without input

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers
BEGIN
    DECLARE weighted_avg_score FLOAT;
    SET weighted_avg_score = (SELECT SUM(score * weight) / SUM(weight)
                        FROM users AS u
                        JOIN corrections as c ON u.id=c.user_id
                        JOIN projects AS p ON c.project_id=p.id
                        WHERE u.id=user_id);
    UPDATE users SET average_score = weighted_avg_score WHERE id=user_id;
END
$$

DELIMITER ;

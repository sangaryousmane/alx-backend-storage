-- Compute Average Weighted score for user without input

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users as u,
    (SELECT u.id,  SUM(score * weight) / SUM(weight) AS wa
         FROM users AS u
         JOIN corrections as c ON u.id=c.user_id
         JOIN projects AS p ON c.project_id=p.id
         GROUP BY u.id);
     AS weighted_av SET u.average_score = weighted_av.wa
     WHERE u.id = weighted_av.wa
END
$$

DELIMITER ;

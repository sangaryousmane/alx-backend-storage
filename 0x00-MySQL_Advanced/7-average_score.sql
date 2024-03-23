-- A script that creates a stored procedure ComputeAverageScoreForUser
-- that computes and store the average score for a student.
-- Note: An average score can be a decimal

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)

BEGIN
	DECLARE av_user FLOAT;

	SET av_user = (SELECT AVG(score) FROM corrections as c WHERE c.user_id=user_id);
	UPDATE users SET average_score = av_user WHERE id=user_id
END;
$$
DELIMITER ;

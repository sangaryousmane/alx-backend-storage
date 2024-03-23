-- A script that creates a stored procedure ComputeAverageScoreForUser
-- that computes and store the average score for a student.
-- Note: An average score can be a decimal

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN score FLOAT)

BEGIN
	DECLARE av_user FLOAT;

	SET av_user = (SELECT AVG(score) FROM users);
	INSERT INTO(name, average_score) VALUES(name, av_usr);
END;
$$
DELIMITER ;

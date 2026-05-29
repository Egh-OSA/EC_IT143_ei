

-- Q1: How many goals has each player scored?

TRUNCATE TABLE t_football_player_goals;

INSERT INTO t_football_player_goals
SELECT *
FROM v_football_player_goals;
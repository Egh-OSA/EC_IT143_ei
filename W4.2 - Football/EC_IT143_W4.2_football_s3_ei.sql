
-- Q1: How many goals has each player scored?

-- A1: The query below groups player records by playerID and sums goals scored.



SELECT
    playerID,
    SUM(goals) AS total_goals
FROM appearances
GROUP BY playerID;
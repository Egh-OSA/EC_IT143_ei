/***************************************
NAME:    EC_IT143_W5.2_Football_ei.
PURPOSE: Answer football community analysis questions using SQL.

MODIFICATION LOG:
Ver      Date        Author              Description
-----   ----------   -----------         ---------------------------------------------
1.0     06/03/2026   Eghosa Igbinidu     Created football community analysis script.

RUNTIME:
xx

NOTES:
This script answers four business questions related to football players,
matches, and league performance using the Football Database.
**************************************/

-- Q1 (Author: Eghosa Igbinidu):
-- Which players scored the most goals across all appearances?

-- A1:
-- This query totals goals scored by each player and ranks them from highest to lowest.

SELECT
       p.playerID,
       p.name,
       SUM(a.goals) AS total_goals
FROM players p
INNER JOIN appearances a
       ON p.playerID = a.playerID
GROUP BY
       p.playerID,
       p.name
ORDER BY total_goals DESC;

-- Q2 (Author: Eghosa Igbinidu):
-- Which players provided the most assists?

-- A2:
-- This query totals assists recorded by each player.

SELECT
       p.playerID,
       p.name,
       SUM(a.assists) AS total_assists
FROM players p
INNER JOIN appearances a
       ON p.playerID = a.playerID
GROUP BY
       p.playerID,
       p.name
ORDER BY total_assists DESC;

-- Q3 (Author: Eghosa Igbinidu):
-- Which leagues have the highest number of player appearances?

-- A3:
-- This query counts appearance records for each league.

SELECT
       l.leagueID,
       l.name AS league_name,
       COUNT(*) AS total_appearances
FROM appearances a
INNER JOIN leagues l
       ON a.leagueID = l.leagueID
GROUP BY
       l.leagueID,
       l.name
ORDER BY total_appearances DESC;

-- Q4 (Author: Josué Ernesto Mercado Rivero):
-- How do goals and assists recorded by players relate to match outcomes,
-- and do teams with higher-performing players tend to achieve more wins?

-- A4:
-- This query summarizes player goals and assists by game and compares
-- them against the final match result.

SELECT
       g.gameID,
       SUM(a.goals) AS total_goals,
       SUM(a.assists) AS total_assists,
       CASE
            WHEN g.homeGoals > g.awayGoals THEN 'Home Win'
            WHEN g.homeGoals < g.awayGoals THEN 'Away Win'
            ELSE 'Draw'
       END AS match_result
FROM appearances a
INNER JOIN games g
       ON a.gameID = g.gameID
GROUP BY
       g.gameID,
       g.homeGoals,
       g.awayGoals
ORDER BY total_goals DESC;

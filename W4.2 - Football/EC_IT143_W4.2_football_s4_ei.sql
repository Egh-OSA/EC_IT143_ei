
DROP VIEW IF EXISTS v_football_player_goals;


/***************************************
NAME:    EC_IT143_W4.2_football_s4_ei.sql
PURPOSE: Create football analysis view.

MODIFICATION LOG:
Ver      Date            Author               Description  
1.0      05/28/2026      Eghosa Igbinidu      Created Week 4.2 script.


RUNTIME: 
1s

NOTES: 
This script converts the ad hoc query into a reusable SQL Server view.
 
**************************************/

-- Q1: How many goals has each player scored?

-- A1: The view stores the reusable football player count query.

CREATE VIEW v_football_player_goals 
AS

SELECT
    playerID,
    SUM(goals) AS total_goals
FROM appearances
GROUP BY playerID;

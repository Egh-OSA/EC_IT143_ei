
-- Q1: What is today’s date and time?

TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world
       SELECT v.my_message
            , v.current_date_time
FROM dbo.v_hello_world_current_date AS v;


--2) Review results

SELECT t.*
FROM dbo.t_hello_world_current_date AS t;

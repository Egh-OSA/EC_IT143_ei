

-- Q1: What is today’s date and time?

DROP TABLE IF EXISTS dbo.t_hello_world;


CREATE TABLE dbo.t_hello_world
(my_message               VARCHAR(25) NOT NULL,
 current_date_time DATETIME NOT NULL
                            DEFAULT GETDATE(),
 CONSTRAINT PK_t_hello_world PRIMARY KEY CLUSTERED(my_message ASC)
 );
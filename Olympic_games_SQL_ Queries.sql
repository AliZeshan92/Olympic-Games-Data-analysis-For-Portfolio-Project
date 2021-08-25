-- retrieve data from athletic_event_results and team_info --

Select [ID],[Name],[Sex],[Age],[Height],[Weight],[NOC],[Games],[City],[Sport],[Event],[Medal]
From PortfolioProject2.dbo.athletic_event_results;
Select*
From PortfolioProject2.dbo.athletic_event_results;

 -- sort data for insights --
 Select 
            [ID]
		    ,[Name] AS 'Athlete_name'
	-- changing the gender abbreviation to their respective full form for filter and visualization --
		    ,CASE WHEN Sex = 'M' THEN 'MALE' ELSE 'FEMALE' END AS Sex
			,[Age]
			,CASE WHEN [Age] < 18 THEN ' Under 18'
			 WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
			WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
			WHEN [Age] > 30   THEN 'Above 30'
		    END AS [ Age Groups]
		  ,[Height]
		  ,[Weight]
		  ,[NOC] AS ' Country Code'
-- spliting the 'Season' and 'Year' columns
--  ,CHARINDEX(' ', Games) -1 AS 'Numbers'
 -- , CHARINDEX(' ', EVERSE(Games))-1 AS'WORDs'
--  ,RIGHT(Games, CHARINDEX(' ', EVERSE(Games))-1 AS'WORDs') AS 'Season'
		  ,LEFT(Games,CHARINDEX(' ', Games)-1) AS 'Year'
		  ,[Sport]
		  ,[Event]
-- Replacing 'NA' with ' Not Registered'	
	,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal
From PortfolioProject2.dbo.athletic_event_results
Where RIGHT(Games,CHARINDEX(' ', REVERSE(Games))-1) = 'Summer';
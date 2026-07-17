CREATE VIEW Customer_FullTable AS 
	(SELECT   
		c.CustomerID,
		c.CustomerName,
		c.Email,
		c.Gender,
		c.Age,
		g.City,
		CASE 
			WHEN g.Country = 'UK' THEN 'England' 
			ELSE g.Country 
		END AS Country  
	FROM 
		customers as c  
	LEFT JOIN 
		[geography] as g 
	ON 
		c.GeographyID = g.GeographyID)

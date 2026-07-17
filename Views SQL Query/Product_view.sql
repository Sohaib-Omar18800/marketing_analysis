CREATE OR ALTER VIEW Product AS(
	SELECT   
		ProductID,
		ProductName,   
		Price,   
		CASE     
			WHEN Price < 50 THEN 'Low'    
			WHEN Price BETWEEN 50 AND 200 THEN 'Meduim'    
			WHEN Price > 200 THEN 'High'    
			ELSE 'No Value'    
		END AS PriceLevel  
	FROM 
	products)


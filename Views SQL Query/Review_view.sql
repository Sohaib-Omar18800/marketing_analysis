CREATE OR ALTER VIEW Review_by_Rating AS (   
	SELECT    
		ReviewID,
		CustomerID,
		ProductID,
		ReviewDate,
		Rating,
		TRIM(replace(replace(replace(ReviewText,' ','{}'),'}{',''),'{}',' ')
		) as ReviewText,
		CASE             
			WHEN Rating < 3 THEN 'Bad'      
			WHEN Rating > 3 THEN 'Good'      
			ELSE 'Average' 
		END AS ReviewCategory   
	FROM     
		customer_reviews
)  

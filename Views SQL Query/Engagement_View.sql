CREATE OR ALTER VIEW Engagement AS (
	SELECT    
		EngagementID,
		ContentID,
		CampaignID,   
		ProductID,   
		CONCAT(UPPER(SUBSTRING(ContentType,1,1)),
		SUBSTRING(Lower(ContentType),2,len(ContentType))) as ContentType,
		Likes,   
		EngagementDate,   
		LEFT(viewsclickscombined,CHARINDEX('-',viewsclickscombined,1)-1) as [Views],
		SUBSTRING(viewsclickscombined,CHARINDEX('-',viewsclickscombined,1)+1,
		len(viewsclickscombined)) as Clicks  
	FROM    
		engagement_data   
		)

create OR ALTER view customer_journey_view as
	with cte as(
		select 
			JourneyID,
			CustomerID,
			ProductID,
			concat(Upper(left([action],1)),LOWER(SUBSTRING([action],2,len([action]))))as [Action],   
			CONCAT(UPPER(LEFT(Stage,1)),LOWER((SUBSTRING(Stage,2,len(stage))))) as Stage,
			VisitDate,    
			Duration,
			ROW_NUMBER() OVER(PARTITION BY JourneyID ORDER BY JourneyID ASC) as row_numbered
		from 
			customer_journey),
	unique_rows_cte as(
		select
			JourneyID,
			CustomerID,
			ProductID,
			Stage,
			[Action],
			VisitDate,
			Duration 
			from cte where row_numbered = 1
					),
	average_duration as (
		select avg(duration) as avg_duration from unique_rows_cte)

	SELECT 
		JourneyID,
		CustomerID,
		ProductID,
		coalesce(Duration,round((select avg_duration from average_duration),1)) as Duration,
		VisitDate,
		[Action],
		Stage
	from 
	unique_rows_cte

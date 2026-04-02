-- netflix project

CREATE TABLE netflix (

	show_id VARCHAR(6),
	type 	VARCHAR(10),
	title	VARCHAR(150),
	director	VARCHAR(208),
	casts	VARCHAR(1000),
	country	VARCHAR(150),
	date_added	VARCHAR(50),
	release_year	INT,
	rating	VARCHAR(10),
	duration	VARCHAR(15),
	listed_in	VARCHAR(100),
	description		VARCHAR(250)
);

SELECT * FROM netflix;

SELECT 
	COUNT(*) as total_content
FROM netflix;

SELECT 
	DISTINCT type
FROM netflix;

SELECT * FROM netflix

-- # of TV Show vs Movie (type)

SELECT
	type,
	COUNT(*) as total_content
FROM netflix
GROUP BY type


--most common rating for movie and tv show
SELECT
	type,
	rating,


SELECT 
	type,
	rating,
	COUNT(*),
	RANK() OVER(PARTITION BY type ORDER BY count(*) DESC) as ranking
FROM netflix
GROUP BY 1,2
ORDER BY 1,3 DESC


-- all movies released in a specific year, FILTER 2020


SELECT *FROM netflix
WHERE	
	type = 'Movie'
	AND
	release_year = 2020


-- top 5 countries with most content on netflix

SELECT
	country,
	COUNT(*) as total_content
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 5


-- longest movie

SELECT * FROM netflix
WHERE 
	type = 'Movie'
	AND
	duration = (SELECT MAX(duration) FROM netflix)

-- find content made by director 'Rajiv Chilaka'

SELECT * FROM netflix

WHERE
	director LIKE '%Rajiv Chilaka%'

-- list all tv shows with more than 5 seasons

SELECT 
	*
FROM netflix

WHERE 
	type = 'TV Show'
	AND
	SPLIT_PART(duration,' ', 1)::numeric > 5 

--- number of items in each genre

SELECT 
	UNNEST(	STRING_TO_ARRAY(listed_in , ',')) as genre,
	COUNT(show_id)
FROM netflix
GROUP BY 1
ORDER BY 2 DESC

-- list all movies that are documentaries
SELECT * FROM netflix
WHERE
listed_in ILIKE '%documentaries%'

--find all content where there is no director
SELECT * FROM netflix
WHERE
	director IS NUll


-- find content that has keywords 'kill' or 'violence',label that content as bad, everything else label as good

SELECT *
FROM netflix


WHERE
	description ILIKE '%kill%'
	OR
	description ILIKE '%violence'




	

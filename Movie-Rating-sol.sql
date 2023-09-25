SELECT countingUser.name AS results
FROM
(SELECT TOP 1 u.name 
FROM users u
INNER JOIN MovieRating mr ON u.user_id = mr.user_id
GROUP BY u.name 
ORDER BY COUNT(mr.rating) DESC, u.name ) countingUser
UNION ALL
SELECT avgRating.title AS results
FROM
(SELECT TOP 1 m.title 
FROM Movies m
INNER JOIN MovieRating r ON m.movie_id = r.movie_id
WHERE MONTH(r.created_at) = 2 AND YEAR(r.created_at)=2020
GROUP BY m.title
ORDER BY AVG(CAST(r.rating AS DECIMAL)) DESC, m.title ) avgRating


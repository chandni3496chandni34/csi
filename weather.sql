#1
SELECT DISTINCT City 
FROM Station 
WHERE UPPER(LEFT(CITY, 1)) IN ('A', 'E', 'I', 'O', 'U') AND LOWER(RIGHT(CITY,1))IN ('a','e','i','o','u')
#2
select ((max(population))-(min(population))) from CITY
#3

SELECT ROUND(SQRT(POW(MAX(LAT_N)-MIN(LAT_N),2) + POW(MAX(LONG_W)-MIN(LONG_W),2)) , 4) FROM STATION;
#4
select round(LAT_N,4) from ( select ROW_NUMBER() over(order by LAT_N) as rownumber, LAT_N from station ) as test where rownumber = (select round((count(LAT_N)/2)+0.5,0) from station);
#5
select CITY.NAME from CITY inner join COUNTRY on CITY.COUNTRYCODE=COUNTRY.CODE where COUNTRY.CONTINENT='Africa';
#6
select CITY.NAME from CITY inner join COUNTRY on CITY.COUNTRYCODE=COUNTRY.CODE where COUNTRY.CONTINENT='Africa';
#7
SELECT Names, Grade, Marks FROM ( SELECT *, CASE WHEN Grade <=7 THEN Null Else Name END AS Names FROM ( SELECT *, CASE WHEN Marks <=9 THEN 1 WHEN Marks <= 19 THEN 2 WHEN Marks <= 29 THEN 3 WHEN Marks <=39 THEN 4 WHEN Marks <=49 THEN 5 WHEN Marks <=59 THEN 6 WHEN Marks <=69 THEN 7 WHEN Marks <= 79 THEN 8 WHEN Marks <=89 THEN 9 Else 10 END AS Grade FROM Students ) as p ) as q ORDER BY Grade DESC, Names ASC, Marks Asc
#8
SELECT H.hacker_id, H.name 
FROM Hackers H 
JOIN Submissions S ON H.hacker_id=S.hacker_id 
JOIN Challenges C ON S.challenge_id=C.challenge_id 
JOIN Difficulty D ON C.difficulty_level=D.difficulty_level 
WHERE S.score=D.score 
GROUP BY  hacker_id, name 
HAVING COUNT(C.challenge_id)>1 
ORDER BY COUNT(C.challenge_id) DESC, H.hacker_id;
#9
SELECT W.id, WP.age, W.coins_needed, W.power 
FROM Wands W INNER JOIN Wands_Property WP ON W.code=WP.code 
WHERE 
((W.coins_needed, W.power, WP.age) IN (SELECT MIN(W.coins_needed) AS coins_needed, W.power, WP.age FROM Wands W INNER JOIN Wands_Property WP ON W.code=WP.code GROUP BY W.power, WP.age)) 
AND 
(is_evil=0) 
ORDER BY W.power DESC, WP.age DESC;
#0
select hacker_id, name, sum(score) as total_score from ( select h.hacker_id, h.name, challenge_id, max(score) score from Submissions s join Hackers h on s.hacker_id = h.hacker_id group by h.hacker_id, h.name, challenge_id ) rs group by hacker_id, name having sum(score) > 0 order by total_score desc, hacker_id;

#1
select * from CITY;
#2
SELECT * 
FROM CITY 
WHERE ID = 1661;
#3
select name from Employee  order by name asc;
#4
select * from CITY where COUNTRYCODE="JPN"
#5
select CITY,STATE from STATION ;
#6
SELECT DISTINCT CITY FROM STATION WHERE mod(ID , 2) = 0;
#7
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION
#8
SELECT CITY, LENGTH(CITY) FROM STATION WHERE CITY IN ( (SELECT CITY FROM STATION ORDER BY LENGTH(CITY), CITY LIMIT 1), (SELECT CITY FROM STATION ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1) ) ORDER BY CITY ASC;
#9
SELECT FLOOR(AVG(POPULATION)) FROM CITY;
#0
SELECT COUNTRY.CONTINENT , FLOOR(AVG(CITY.POPULATION)) FROM COUNTRY, CITY WHERE COUNTRY.CODE = CITY.COUNTRYCODE GROUP BY COUNTRY.CONTINENT;
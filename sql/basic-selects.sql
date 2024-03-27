/* CITIES */

-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT * FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;

-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

SELECT NAME FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

-- Query all columns (attributes) for every row in the CITY table.

SELECT * FROM CITY;

-- Query all columns for a city in CITY with the ID 1661.

SELECT * FROM CITY WHERE ID = 1661;

-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN';

-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';

/* WEATHER STATIONS */

-- Query a list of CITY and STATE from the STATION table.

SELECT CITY, STATE FROM STATION;

-- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

SELECT UNIQUE CITY FROM STATION WHERE MOD(ID, 2) = 0;

-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT (COUNT(CITY) - COUNT(UNIQUE CITY)) FROM STATION;

/*
Initially, I tried:

(SELECT COUNT(CITY) FROM STATION) - (COUNT(UNIQUE CITY)) FROM STATION);

and also using `MINUS` in place of `-`
*/


/*
Query the two cities in STATION with the shortest and longest CITY names,
as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city,
choose the one that comes first when ordered alphabetically.
*/

SELECT * FROM (SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY), CITY) WHERE ROWNUM = 1;

SELECT * FROM (SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY) WHERE ROWNUM = 1;

/* REGEX Challenges

Reminder of the basic rules
– .: Matches any single character except a newline.
– *: Matches zero or more occurrences of the preceding character or group.
– +: Matches one or more occurrences of the preceding character or group.
– ?: Matches zero or one occurrence of the preceding character or group.
– [ ]: Matches any single character within the brackets.
– ( ): Groups characters together and creates a capture group.
*/

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE REGEXP_LIKE(CITY,'^[AEIOU]');

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE REGEXP_LIKE(CITY,'[aeiou]$');

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE REGEXP_LIKE(CITY,'^[AEIOU].*[aeiou]$');

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE NOT REGEXP_LIKE(CITY,'^[AEIOU]');

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE NOT REGEXP_LIKE(CITY,'[aeiou]$');

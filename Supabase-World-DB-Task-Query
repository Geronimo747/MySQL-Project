--Count Cities in USA

select count(city) as Cities_In_USA from city 
where city.countrycode = 'USA'; 

--Country with Highest Life Expectancy

select country.name, country.lifeexpectancy from country 
where country.lifeexpectancy is not null 
order by country.lifeexpectancy desc 
limit 1; 


--New Year Promotion: Featuring Cities with

Select city.name as City_Name, country.name as Country_Name from city 
join country on city.countrycode = country.code
Where city.name like '%New %';

--Display Columns with Limit (First 10 Rows)
select City.name from city
order by city.population desc
limit 10;

--Cities with Population Larger than 2,000,000
select * from city
where city.population > 2000000;

--Cities Beginning with 'Be' Prefix
select * from city
where city.name like 'Be%';

--Cities with Population Between 500,000-1,000,000
select * from city
where city.population between 500000 and 1000000;

--Display Cities Sorted by Name in Ascending Order
select City.name from city
order by city.name asc

--Most Populated City
select City.name from city
order by city.population desc
limit 1;



-- City Name Frequency Analysis: Supporting Geography Education
SELECT name, COUNT(*) AS frequency FROM CITY
GROUP BY name
ORDER BY name ASC;

--City with the Lowest Population
select City.name from city
order by city.population asc
limit 1;


--Country with Largest Population
select country.name from country
where country.population is not null 
order by country.population desc
limit 1;

--Capital of Spain
select city.name from city
join country on city.id = country.capital
where country.name = 'Spain'

--Cities in Europe
select city.name, country.continent from city
join country on city.id = country.capital
where country.continent = 'Europe'

--Average Population by Country
select country.name, round(avg(city.population)) as Average_Population from country
join city on country.code = city.countrycode
group by country.name;


--Capital Cities Population Comparison
select city.name, city.population, country.name as Country_Name from city
join country on city.id = country.capital
where city.id = country.capital

--Countries with Low Population Density
select country.name, round(country.population/country.surfacearea,2) as pop_density from country
where country.population != 0
order by pop_density;  

--Display Columns with Limit (Rows 31-40)
SELECT * FROM CITY 
ORDER BY POPULATION DESC 
LIMIT 10 OFFSET 30; 


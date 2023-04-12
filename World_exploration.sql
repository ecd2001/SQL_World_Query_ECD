use `world`;

# Retrieve all of the information from table city
select * from City;

# Retrieve all of the information from table country
select * from Country;

# How many records city has 
select count(*) from City;

# How many rows/record in country
select count(*) from Country;

# Get set of records matching some criteria population more than 7 million
select * from City where Population>7000000;

# Get Name and head of state name where population more than 5 million and life expectancy 70
select Name, HeadOfState from Country 
where Population>5000000 and LifeExpectancy>70;

# List Name and Population fields from country table that are Caribbean region and popluation is more than 9000000
select Name, Population  from Country
where Region='Caribbean' and Population>9000000;

# Make it descending
select Name, Population  from Country
where Region='Caribbean' and Population>8000000
order by Population desc;

#Give the name and the per capita GNP for those countries a population of at least 200 million and having GNPper capota atleast .005
select Name, GNP/Population as GNPperCapita from Country
where Population>=200000000
having GNPperCapita>.005;

# Show the name and population for France, Germany, Italy
select Name, Population from Country
where Name in ('France','Germany','Italy');

#A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. Show the countries that are big by area or big by population. Show name, population and area.
select Name, SurfaceArea, Population from Country
where SurfaceArea>3000000 or Population>250000000
order by population desc;

# The name of three countries which are least populated among the countries which have at least 40,0000 people
select Name, Population from Country
where Population>=40000
order by Population limit 3;

# Search for population in the last table where Name contains ‘U.S.’
select Name, Population from Country
where Name like "%U.S.%";

# Search for records in the Country table where the head of state’s name 'bush'
select Name, HeadOfState, Population from Country
where HeadOfState like "%bush%";

# Search for records in the Country table where the head of state’s name end with 'II'
select Name, HeadOfState from Country
where HeadOfState like "%II";

# Search for records in the Country table where the head of state’s name ends with ‘i’, 
# And the country name starts with a ‘U’. 
select Name, HeadOfState from Country
where HeadOfState like "%i" and Name like "U%";

# Select the country with the minimum population
select min(Population) as MinPop from Country;   # min Pop = 0
select Name, Population from Country
where Population=0;

# Select the city name with the maximum population
select max(Population) as MaxPop from City;   # max Pop = 10500000
select Name, Population from City
where Population=10500000;

# Find out the language spoken for the cities started with UZ
select c.Name, l.Language
from City c 
join CountryLanguage l on l.CountryCode=c.CountryCode
where c.Name like "UZ%";
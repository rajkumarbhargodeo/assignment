create table CITY (
ID INT,
NAME VARCHAR(17),
COUNTRYCODE VARCHAR(3),
DISTRICT VARCHAR(20),
POPULATION INT);

insert into CITY(ID,NAME,COUNTRYCODE,DISTRICT,POPULATION) values(6,'Rotterdam','NLD','Zuid-Holland',593321);
insert into CITY(ID,NAME,COUNTRYCODE,DISTRICT,POPULATION) values(3878, 'Scottsdale', 'USA', 'Arizona',202705),
(3965,'Corona', 'USA','California',124966),
(3973,'Concord', 'USA', 'California', 121780),
(3977,'Cedar Rapids', 'USA', 'Iowa', 120758),
(3982,'Coral Springs', 'USA', 'Florida', 117549),
(4054,'Fairfield', 'USA', 'California', 92256),
(4058,'Boulder', 'USA', 'Colorado', 91238),
(4061,'Fall River', 'USA', 'Massachusetts', 90555);

# Q1. Query all columns for all American cities in the CITY table with populations larger than 100000.
# The CountryCode for America is USA.
select * from CITY where POPULATION > 100000 AND COUNTRYCODE like ('USA');

# Q2. Query the NAME field for all American cities in the CITY table with populations larger than 120000.
# The CountryCode for America is USA.
select NAME from CITY where POPULATION > 120000 AND COUNTRYCODE like ('USA');

# Q3. Query all columns (attributes) for every row in the CITY table.
select * from CITY;

# Q4. Query all columns for a city in CITY with the ID 1661.
select * from CITY where ID = 1661;

# Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
select * from CITY where COUNTRYCODE like ('JPN');

# Q6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
select NAME from CITY  where COUNTRYCODE like ('JPN');

create table STATION(
ID int,
CITY varchar(21),
STATE varchar(2),
LAT_N int,
LONG_W int);
select * from STATION;

insert into STATION (ID,CITY,STATE,LAT_N,LONG_W) values(794, "Kissee Mills", "MO", 139, 73),
(824, 'Loma Mar', 'CA', 48, 130),
(603, 'Sandy Hook', 'CT', 72, 148),
(478, 'Tipton', 'IN', 33, 97),
(619, 'Arlington', 'CO', 75, 92),
(711, 'Turner', 'AR', 50, 101),
(839, 'Slidell', 'LA', 85, 151),
(411, 'Negreet', 'LA', 98, 105),
(588, 'Glencoe', 'KY', 46, 136),
(665, 'Chelsea', 'IA', 98, 59),
(342, 'Chignik Lagoon', 'AK', 103, 153),
(733, 'Pelahatchie', 'MS', 38, 28),
(441, 'Hanna City', 'IL', 50, 136),
(811, 'Dorrance', 'KS', 102, 121),
(698, 'Albany', 'CA', 49, 80),
(325, 'Monument', 'KS', 70, 141),
(414, 'Manchester', 'MD', 73, 37),
(113, 'Prescott', 'IA', 39, 65),
(971, 'Graettinger', 'IA', 94, 150),
(266, 'Cahone', 'CO', 116, 127);
select * from STATION;
# Q7. Query a list of CITY and STATE from the STATION table.
select CITY, STATE from STATION;

# Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results
# in any order, but exclude duplicates from the answer.
select distinct CITY from STATION where ID%2 = 0;

# Q9. Find the difference between the total number of CITY entries in the table and the number of
# distinct CITY entries in the table.
select count(CITY) - CIT.distcity from STATION, (select count(distinct CITY) as distcity from STATION) as CIT;

# Q10. Query the two cities in STATION with the shortest and longest CITY names, as well as their
# respective lengths (i.e.: number of characters in the name). If there is more than one smallest or
# largest city, choose the one that comes first when ordered alphabetically.
(select min(CITY) CITY,length(CITY) from STATION where length(CITY) = (select min(length(CITY)) from STATION order by CITY))
UNION 
(select max(CITY) CITY,length(CITY) from STATION where length(CITY) = (select max(length(CITY)) from STATION order by CITY));

# Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result
# cannot contain duplicates.
select distinct CITY from STATION where CITY in (
select CITY from STATION where CITY like ('a%')
UNION
select CITY from STATION where CITY like ('e%')
UNION
select CITY from STATION where CITY like ('i%')
UNION
select CITY from STATION where CITY like ('o%')
UNION
select CITY from STATION where CITY like ('u%'));

# Q12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot
# contain duplicates.
select distinct CITY from STATION where CITY in (
select CITY from STATION where CITY like ('%a')
UNION
select CITY from STATION where CITY like ('%e')
UNION
select CITY from STATION where CITY like ('%i')
UNION
select CITY from STATION where CITY like ('%o')
UNION
select CITY from STATION where CITY like ('%u'));

# Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot
# contain duplicates.
select distinct CITY from STATION where CITY not in (
select CITY from STATION where CITY like ('a%')
UNION
select CITY from STATION where CITY like ('e%')
UNION
select CITY from STATION where CITY like ('i%')
UNION
select CITY from STATION where CITY like ('o%')
UNION
select CITY from STATION where CITY like ('u%'));

# Q14. Query the list of CITY names from STATION that do not end with vowels. Your result cannot
# contain duplicates.
select distinct CITY from station where CITY not in (
select CITY from STATION where CITY like ('%a')
UNION
select CITY from STATION where CITY like ('%e')
UNION
select CITY from STATION where CITY like ('%i')
UNION
select CITY from STATION where CITY like ('%o')
UNION
select CITY from STATION where CITY like ('%u'));

# Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end
# with vowels. Your result cannot contain duplicates.
select distinct CITY from STATION where CITY in 
(select CITY from STATION where CITY like ('a%') OR CITY like ('%a')
UNION
select CITY from STATION where CITY like ('e%') OR CITY like ('%e') 
UNION
select CITY from STATION where CITY like ('i%') OR CITY like ('%i')
UNION
select CITY from STATION where CITY like ('o%') OR CITY like ('%o')
UNION
select CITY from STATION where CITY like ('u%') OR CITY like ('%u'));

# Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with
# vowels. Your result cannot contain duplicates.
select distinct CITY from STATION where CITY in 
(select CITY from STATION where CITY like ('a%') and CITY like ('%a')
UNION
select CITY from STATION where CITY like ('e%') and CITY like ('%e') 
UNION
select CITY from STATION where CITY like ('i%') and CITY like ('%i')
UNION
select CITY from STATION where CITY like ('o%') and CITY like ('%o')
UNION
select CITY from STATION where CITY like ('u%') and CITY like ('%u'));

# Q17 Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
# between 2019-01-01 and 2019-03-31 inclusive. Return the result table in any order.
create table Product(
product_id int ,
product_name varchar(50),
unit_price int,
constraint PK_product_id primary key (product_id));

create table Sales(
seller_id int,
product_id int,
buyer_id int,
sale_date date,
quantity int,
price int,
constraint FK_product_id foreign key (product_id) references Product (product_id));

insert into Product(product_id,product_name,unit_price) values
(1, 'S8', 1000),
(2, 'G4', 800),
(3, 'iPhone', 1400);

insert into Sales(seller_id,product_id,buyer_id,sale_date,quantity,price) values 
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 2, 3, '2019-06-02', 1, 800),
(3, 3, 4, '2019-05-13', 2, 2800);

select product_id, product_name from Product where 
(product_id in (select product_id from Sales where sale_date between '2019-01-01' AND '2019-03-31') ) and 
(product_id not in(select product_id from Sales where sale_date between '2019-03-01' AND '2019-12-31'));

# Q18. Write an SQL query to find all the authors that viewed at least one of their own articles.
# Return the result table sorted by id in ascending order.
create table Views(
article_id int,
author_id int,
viewer_id int,
view_date date
);

insert into Views(article_id,author_id,viewer_id,view_date) values
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');

select distinct author_id id from Views where viewer_id = author_id ;

# Q19. Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal
# places.
create table  Delivery (
delivery_id int,
customer_id int,
order_date date,
customer_pref_delivery_date date,
constraint PK_delivery_id primary key (delivery_id)
);

insert into Delivery(delivery_id,customer_id,order_date,customer_pref_delivery_date) values 
(1, 1, '2019-08-01', '2019-08-02'),
(2, 5, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-11'),
(4, 3, '2019-08-24', '2019-08-26'),
(5, 4, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');

select round(sum(summary.ordertype)/count(summary.delivery_id) * 100,2) immediate_percentage from (select 
       delivery_id,
       case 
            when order_date = customer_pref_delivery_date then 1
            when order_date != customer_pref_delivery_date then 0
       end as ordertype
from Delivery) as summary;

# Q20. Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
# Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a tie.
create table Ads(
ad_id int,
user_id int,
action enum('Clicked','Viewed','Ignored'),
constraint PK_ad_id primary key (ad_id,user_id)
);

insert into Ads(ad_id,user_id,action) values
(1, 1, 'Clicked'),
(2, 2, 'Clicked'),
(3, 3, 'Viewed'),
(5, 5, 'Ignored'),
(1, 7, 'Ignored'),
(2, 7, 'Viewed'),
(3, 5, 'Clicked'),
(1, 4, 'Viewed'),
(2, 11, 'Viewed'),
(1, 2, 'Clicked');
select summary.ad_id,
round(IFNULL((sum(summary.action_clicked)/(sum(summary.action_clicked) + sum(summary.action_viewed))) * 100,0),2) ctr
from 
(select 
		*,
		case 
			when action = 'Clicked' then 1
            when action != 'Clicked' then 0
		end as action_clicked,
		case 
			when action = 'Viewed' then 1
            when action != 'Viewed' then 0
		end as action_viewed,
		case 
			when action = 'Ignored' then 1
            when action != 'Ignored' then 0
		end as action_Ignored
from Ads) as summary group by summary.ad_id order by ctr desc,summary.ad_id asc;

# Q21. Write an SQL query to find the team size of each of the employees.
# Return result table in any order
create table Employee(
employee_id int,
team_id int,
constraint PK_employee_id primary key (employee_id)
);
insert into Employee (employee_id,team_id) values
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

select employee_id, e2.team_size from Employee e1
INNER JOIN ( select team_id, count(*) team_size from Employee group by team_id) as e2
on e1.team_id = e2.team_id;

# Q22. Write an SQL query to find the type of weather in each country for November 2019.
# The type of weather is:
# ● Cold if the average weather_state is less than or equal 15,
# ● Hot if the average weather_state is greater than or equal to 25, and
# ● Warm otherwise.
# Return result table in any order.

create Table Countries(
country_id int,
country_name varchar(50),
constraint PK_country_id primary key (country_id)
);

create Table Weather (
country_id int,
weather_state int,
day date,
constraint PK_country_id primary key(country_id,day)
);

insert into Countries(country_id,country_name) values
(2, 'USA'),
(3, 'Australia'),
(7, 'Peru'),
(5, 'China'),
(8, 'Morocco'),
(9, 'Spain');

insert into Weather(country_id,weather_state,day) values
(2, 15, '2019-11-01'),
(2, 12, '2019-10-28'),
(2, 12, '2019-10-27'),
(3, -2, '2019-11-10'),
(3, 0, '2019-11-11'),
(3, 3, '2019-11-12'),
(5, 16, '2019-11-07'),
(5, 18, '2019-11-09'),
(5, 21, '2019-11-23'),
(7, 25, '2019-11-28'),
(7, 22, '2019-12-01'),
(7, 20, '2019-12-02'),
(8, 25, '2019-11-05'),
(8, 27, '2019-11-15'),
(8, 31, '2019-11-25'),
(9, 7, '2019-10-23'),
(9, 3, '2019-12-23');

select country_name,
 case 
	when avg_temp <=15 then 'Cold'
    when avg_temp >= 25 then 'Hot'
    else 'Warm'
    end as weather_type
from Countries c
INNER JOIN 
(select country_id,sum(weather_state)/count(*) avg_temp from 
Weather where MONTH(day) = 11 AND YEAR(day) = 2019 group by country_id) as w
on c.country_id = w.country_id;

# Alternate solution

select w.country_name,
 case 
	when w.avg_temp <=15 then 'Cold'
    when w.avg_temp >= 25 then 'Hot'
    else 'Warm'
    end as weather_type
from 
(Select c.country_name,sum(w.weather_state)/count(w.weather_state) avg_temp 
from Countries c,Weather w 
where 
	c.country_id = w.country_id AND 
	MONTH(w.day) = 11 AND 
	YEAR(w.day) = 2019 
group by c.country_id) as w;

# Q23. Write an SQL query to find the average selling price for each product. average_price should be
# rounded to 2 decimal places. Return the result table in any order.
create table Prices (
product_id int,
start_date date,
end_date date,
price int,
constraint PK_product_id primary key (product_id,start_date,end_date)
);

create table UnitsSold (
product_id int,
purchase_date date,
units int
);
insert into Prices(product_id,start_date,end_date,price) values
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

insert into UnitsSold(product_id,purchase_date,units) values
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

select sale.product_id,round(sum(sale.amount)/sum(sale.units),2) average_price from 
(select p.product_id product_id,us.units units,us.units * p.price amount 
from Prices p,UnitsSold us 
where 
	p.product_id = us.product_id AND 
    us.purchase_date between p.start_date and p.end_date) as sale group by sale.product_id;

# Q24. Write an SQL query to report the first login date for each player.
# Return the result table in any order
create table Activity (
player_id int,
device_id int,
event_date date,
games_played int,
constraint PK_player_id primary key(player_id,event_date)
);

insert into Activity(player_id,device_id,event_date,games_played) values
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);
select player_id,min(event_date) from Activity group by player_id;

# Q25. Write an SQL query to report the device that is first logged in for each player.
# Return the result table in any order.
select player_id,device_id from Activity a 
where 
	event_date  = (select min(event_date) from Activity s 
                    where 
						a.player_id = s.player_id 
                    group by player_id);

# Q26. Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
# and their amount. Return result table in any order.
create table Products (
product_id int,
product_name varchar(50),
product_category varchar(50),
constraint PK_product_id primary key(product_id)
);

create table Orders(
product_id int,
order_date date,
unit int,
constraint FK_product_id_1 foreign key(product_id) references Products(product_id)
);

insert into Products(product_id,product_name,product_category) values
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');

insert into Orders(product_id,order_date,unit) values
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);
select p.product_name product_name, sum(unit) unit from Orders o,Products p
where 
	p.product_id = o.product_id AND
	MONTH(order_date) = 2 AND YEAR(order_date) = 2020 
    group by o.product_id 
    having sum(unit) >= 100;

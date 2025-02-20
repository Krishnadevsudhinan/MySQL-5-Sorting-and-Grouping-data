create database employee;
use employee;
create table Country_with_fields 
( ID Int Primary Key ,
country_name varchar(50),
population_in_lacs decimal,
area_in_sq_miles decimal);
insert into Country_with_fields(id,country_name,population_in_Lacs,area_in_sq_miles)
values
(11,"USA",3454,665384.04),
(12,"Canada",401,3855100),
(13,"UK",683,94060),
(14,"India",14509,1269219),
(15,"China",14193,663705405 ),
(16,"Indonesia",2834,735358),
(17,"Mexico",1280,761610 ),
(18,"Turkey",853,302535),
(19,"Germany",844,138069),
(20,"Australia",266.4, 2968464 );
create table person_with_fields 
( Id int unique primary key,
 Fname varchar(50),
 Lname varchar(50),
Population_in_lacs decimal(10),
 Rating decimal(2),
 Country_Id  int ,
 Country_name varchar(50),
 foreign key (country_id) references country_with_fields(id) 
 on update cascade
 on delete cascade
 );
insert into person_with_fields(Id,Fname,Lname,Population_in_lacs,Rating,Country_Id,Country_name) 
values
(101,"John","David",3454,4,11,"USA"),
(102,"Simon","Andrews",266.4,9,20,"Australia"),
(103,"Robert","xavier",2834,8,16,"Indonesia"),
(104,"Mariam","Muhammad",401,5,12,"canada"),
(105,"Veena","Nair",844,7,19,"Germany"),
(106,"Abdul","Salam",14193,6,15,"china"),
(107,"Asia","Khan",14509,5,14,"India"),
(108,"Roy","krishna",683,4,13,"UK"),
(109,"Teresa","Davis",1280,3,17,"Mexico"),
(110,"Ram","Varma",853,2,18,"Turkey");
drop table person_with_fields;
use employee;
select * from person_with_fields;
select*,left(country_name,3) as first_3_char_country
from Country_with_fields;
select concat(fname,' ',lname) as fullname
from person_with_fields;
use employee;
select count(distinct country_name)
from person_with_fields;
select   max(population_in_Lacs)as maximum_population
from country_with_fields;
select   min(population_in_Lacs)as maximum_population
from country_with_fields;

insert into person_with_fields(Id,Fname,Lname,Population_in_lacs,Rating,Country_Id,Country_name) 
values
(111,"Rony",null,3454,5,11,"USA"),
(112,"Jackson",null,266.4,7,20,"Australia");
select count(lname)
from person_with_fields;
select count(*)
from person_with_fields;
select id, population_in_Lacs
from country_with_fields
limit 3 ; 
select rand(Lname)
from person_with_fields
limit 3 ;
select*from person_with_fields;
select fname,lname,rating from person_with_fields
order by rating desc;
select sum(population_in_lacs)
from Person_with_fields;
select country_name,population_in_lacs
from person_with_fields
where population_in_lacs>0.5;

select country_name,
count (id) as
total_persons,
avg(rating) as average_rating
from person_with_fields 
group by country_name 
having count(id)>2
order by
average_rating Asc;

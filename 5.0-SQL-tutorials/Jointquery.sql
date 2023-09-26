select * from sales;
select * from people;
select * from geo;

-- join function 
-- there are left or right join tables. Means for left join, SQL will try to keep all the data from
-- the left table and try to find any data in the right table. If any thing matches, it will take data 
-- from the right and merge it to the left table.



select s.saleDate, s.amount, p.team, p.Salesperson, s.SPID, p.SPID
from sales as s
join people as p on p.SPID=p.SPID;

-- on the basis of products

select s.saleDate, s.Amount, s.PID, pr.PID, p.Team, p.Salesperson,  pr.Product, pr.Category
from sales as s
join people as p on p.SPID=p.SPID
join Products as pr on pr.PID=s.PID;

-- conditional joint, under 500 amount

select s.saleDate, s.Amount, s.PID, pr.PID, p.Team, p.Salesperson,  pr.Product, pr.Category
from sales as s
join people as p on p.SPID=p.SPID
join Products as pr on pr.PID=s.PID
where s.Amount < 500;

-- conditional joint, under 500 amount for a specific team
select s.saleDate, s.Amount, s.PID, pr.PID, p.Salesperson,  pr.Product, pr.Category, p.Team
from sales as s
join people as p on p.SPID=p.SPID
join Products as pr on pr.PID=s.PID
where s.Amount < 500 and p.team='Delish';


-- conditional joint, under 500 amount for a specific team but no team
select s.saleDate, s.Amount, s.PID, pr.PID, p.Salesperson,  pr.Product, pr.Category, p.Team
from sales as s
join people as p on p.SPID=p.SPID
join Products as pr on pr.PID=s.PID
where s.Amount < 500 and p.team='';

-- conditional joint, under 500 amount for a specific team but from either India or New Zeland
select s.saleDate, s.Amount, s.PID, pr.PID, p.Salesperson,  pr.Product, pr.Category, p.Team, g.Geo
from sales as s
join people as p on p.SPID=p.SPID
join Products as pr on pr.PID=s.PID
join geo as g on g.GeoID=s.GeoID
where s.Amount < 500 and p.team='' and g.Geo in ('New Zealand', 'India')
Order by Geo;




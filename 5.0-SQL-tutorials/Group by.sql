select * from geo;
select * from people;
select products;
select sales;

-- group by geoID
select geoID, sum(amount), avg(amount), sum(Boxes)
from sales
group by geoID;

-- group by with joints
select g.geoID, sum(amount), avg(amount), sum(Boxes)
from sales as s
join geo as g on g.geoID=s.GeoID
group by g.geo;

-- group by with multiple join
select pr.category, p.team, sum(amount), sum(Boxes), avg(amount)
from sales as s
join people as p on p.SPID=s.SPID  
join products as pr on pr.PID=s.PID
group by pr.category, p.team
order by pr.category, p.team;

-- group by with multiple join without null
select pr.category, p.team, sum(s.amount), sum(Boxes), avg(amount)
from sales as s
join people as p on p.SPID=s.SPID  
join products as pr on pr.PID=s.PID
where p.team <> ''
group by pr.category, p.team
order by pr.category, p.team;

-- top 10 products only in above
select pr.product, sum(s.amount) as 'Total amount'
from sales as s
join products pr on pr.PID=s.PID
join people as p on p.SPID=s.SPID  
where p.team <> ''
group by pr.Product, p.team
order by 'Total amount' desc
limit 10;



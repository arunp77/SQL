show tables;
desc sales;

select * from sales;
select SaleDate, Amount, Customers, Boxes from sales;

select SaleDate, Customers, Amount, Boxes, Amount/Boxes as 'Amount per box' from sales;

select * from sales
where Amount > 10000
order by Amount;

select * from sales	
where GeoID='G1'
order by PID, Amount desc;

select * from sales	
where Amount > 10000 and SaleDate >= '2022-01-01'
order by Amount;

select SaleDate, Amount from sales	
where Amount > 10000 and year(SaleDate)=2022
order by Amount;

select SaleDate, Amount from sales	
where Boxes > 0 and Boxes <= 50
order by Amount;

Select SaleDate, Amount from sales
where Boxes between 0 and 50
order by Amount;

Select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week'
from sales
where weekday(SaleDate)=4;

select * From people
where team = 'Yummies' or team = 'Delish'
order by SPID;

select * From people
where team in ('Yummies', 'Delish')
order by SPID;

-- TO SELECT NAME WHICH HAS B IN IT.
select * from people
where Salesperson like '%B%';

-- TO SELECT NAME WHICH HAS B AT THE BEGGING IT.
select * from people
where Salesperson like 'B%';


-- CASE OPERATORS
-- Using CASE to create branching logic in SQL
select 	SaleDate, Amount,
		case 	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount category'
from sales;



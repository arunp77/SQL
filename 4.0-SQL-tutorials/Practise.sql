select * from sales;
select * from people;
select * from geo;
select * from products;

-- -----------------------------------------------------------
-- Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?
select * from sales
where amount > 2000 and boxes <100;

-- -----------------------------------------------------------
--  How many shipments (sales) each of the sales persons had in the month of January 2022?
select s.SaleDate, p.Salesperson, s.Boxes, s.Amount, s.Amount / s.Boxes as 'Amount per box', count(*)
from sales as s
join people as p on p.SPID=s.SPID
where SaleDate Between '2022-01-01' and '2022-01-31'
group by p.Salesperson
order by count(*) desc  -- just to order table by count
limit 10;               -- to limit the output by highest 10 counts

-- -----------------------------------------------------------
-- Which product sells more boxes? Milk Bars or Eclairs?
select s.PID, pr.PID, s.Boxes, pr.Product, sum(Boxes) as 'Total Boxes'
from sales as s
join products as pr on s.PID=pr.PID
where pr.Product in ('Milk Bars', 'Eclairs')
group by pr.product;

select s.PID, pr.PID, s.Boxes, pr.Product, sum(Boxes) as 'Total Boxes'
from sales as s
join products as pr on s.PID=pr.PID
where pr.Product in ('Milk Bars', 'Eclairs', 'Drinking Coco')
group by pr.product;

-- -----------------------------------------------------------
-- Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?
Select pr.Product, sum(Boxes) as 'Total Boxes'
from sales as s
join products as pr on pr.PID=s.PID
where pr.Product in ('Milk Bars', 'Eclairs')
and s.SaleDate between '2022-02-01' and '2022-02-07'
group by pr.Product
order by sum(Boxes) desc;

-- -----------------------------------------------------------
-- Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?
select * from sales
where customers < 100 and boxes < 100;

select *,
	case when weekday(saledate)=2 then 'Wednesday Shipment'
		else ''
	end as 'W Shipment'
from sales
where customers < 100 and boxes < 100;
-- -----------------------------------------------------------
-- What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?
select p.Salesperson
from sales as s
Join people as p on p.SPID=s.SPID
where s.SaleDate between '2022-01-01' and '2022-01-07'
order by Salesperson;

select distinct p.Salesperson  -- for distinct salesperson 
from sales as s
Join people as p on p.SPID=s.SPID
where s.SaleDate between '2022-01-01' and '2022-01-07'
order by Salesperson;

-- -----------------------------------------------------------
-- Which salespersons did not make any shipments in the first 7 days of January 2022?
select p.salesperson
from people p
where p.spid not in
(select distinct s.spid from sales s where s.SaleDate between '2022-01-01' and '2022-01-07');




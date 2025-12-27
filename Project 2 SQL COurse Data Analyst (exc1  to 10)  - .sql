---exc1 revisado - projecto 2

select  YEAR (so.OrderDate) as "Year",
sum ((sil.extendedprice)-(sil.TaxAmount)) as income_per_Invoice,
Count (Distinct Month (so.OrderDate)) as "Months", 

Format ((sum ((sil.extendedprice)-(sil.TaxAmount)) /
Count (Distinct Month (so.OrderDate)))*12, '0.00')
as YearlyLinearIncome,


Format( floor(
((sum ((sil.extendedprice)-(sil.TaxAmount)) /
Count (Distinct Month (so.OrderDate)))*12
-
lag ((sum ((sil.extendedprice)-(sil.TaxAmount)) /
Count (Distinct Month (so.OrderDate)))*12 ) 
over (order by YEAR (so.OrderDate)))
/
(lag ((sum ((sil.extendedprice)-(sil.TaxAmount)) /
Count (Distinct Month (so.OrderDate)))*12 ) 
over (order by YEAR (so.OrderDate)))
*100
*100)
/100, '0.00')

AS Growth_Rate

from sales.invoices si join sales.InvoiceLines sil
on si.InvoiceID=sil.InvoiceID
join sales.orders so
on so.orderID=si.OrderID
group by Year(so.OrderDate)
order by YEAR(so.OrderDate)

---exc 2 revisado - proyecto 2

with Ranked as (
select 
Year(so.orderdate) as year, datepart (quarter,so.orderdate) as Quarter,
sc.customername as CustomerName, 
sum (sil.extendedprice-sil.taxamount) as IncomePerYear,

rank () OVER(PARTITION BY YEAR(so.orderdate),datepart (quarter,so.orderdate)
 order by sum (sil.extendedprice-sil.taxamount)desc ) AS DNR 

from sales.invoices si join sales.invoicelines sil
on si.invoiceID=sil.invoiceID
join sales.Orders so
on si.orderID=so.OrderID
join sales.customers sc
on so.customerID=sc.CustomerID

group by YEAR(so.orderdate), datepart (quarter,so.orderdate), sc.customername)

select*
from Ranked
where dnr<=5

order by Year, Quarter,  DNR

-----  exc 3 - project 2

select StockItemID, StockItemName, TotalRevenue 
from 
(
select ws.StockItemID, ws.StockItemName, 
sum (si.ExtendedPrice - si.TaxAmount) as TotalRevenue,
Rank () over (order by (sum (si.ExtendedPrice - si.TaxAmount)) desc)  RN

from sales.invoiceLines si join warehouse.stockitems ws
on si.StockitemID = ws.StockitemID

group by ws.StockItemID, ws.StockItemName) C

where RN <=10

----- exc 4 - proyect 2 
select  
Row_Number(
)over(order by (RecommendedRetailPrice-UnitPrice)desc,
Left (StockItemName,3), StockItemID
)as Rn,
 StockItemID, StockItemName, UnitPrice, RecommendedRetailPrice,
RecommendedRetailPrice-UnitPrice as NominalProductProfit,
Dense_rank()over(order by (RecommendedRetailPrice-UnitPrice)desc)  as DNR

from  warehouse.stockitems
where ValidTo > getdate()

----- exc 5 - project 2

with cte1 as (

select concat (ps.SupplierID ,' - ',  ps.SupplierName) as 'SupplierDetails', 
string_agg
(concat (ws.StockItemID, '  ' , StockItemName) , '  /,  ') as 'ProductDetails',

ps.supplierID as supplierID

from warehouse.stockitems ws join purchasing.suppliers ps
on ws.supplierID=ps.SupplierID

group by concat (ps.SupplierID ,' - ',  ps.SupplierName), ps.SupplierID   
)

select supplierDetails, ProductDetails
from cte1
order by supplierID

-----exc6 revisdo - project6

select top 5
sc.CustomerID, aci.cityname, aco.countryname, aco.continent, aco.region, 
format (sum (sil.ExtendedPrice), '#,#.00') as 'TotalExtendedPrice'


from 
sales.invoices si join sales.invoicelines sil
on si.invoiceID=sil.InvoiceID

join sales.customers sc
on si.customerID=sc.CustomerID

join application.Cities aci
on sc.DeliveryCityID = aci.cityID

join application.stateprovinces asp
on aci.StateProvinceID= asp.StateProvinceID

join application.Countries aco
on aco.countryID=asp.CountryID

group by sc.CustomerID, aci.cityname, aco.countryname, aco.continent, aco.region
order by sum (sil.ExtendedPrice) desc

-----exc 7 project 2

with cte1 as(
select Year (so.orderdate) as OrderYear, Month (so.orderdate) as OrderMonth,
Format (sum (sil.ExtendedPrice) - sum (sil.TaxAmount), '#,#.00') as MonthlyTotal,
Format (
SUM (sum (sil.ExtendedPrice) - sum (sil.TaxAmount)) OVER 
(PARTITION BY Year (so.orderdate)
ORDER BY Year (so.orderdate), Month (so.orderdate) ROWS BETWEEN 
UNBOUNDED PRECEDING AND CURRENT ROW), '#,#.00') 
AS CumulativeTotal

from sales.Orders so join sales.invoices si
on so.orderID=si.OrderID
join sales.InvoiceLines sil 
on si.InvoiceID=sil.InvoiceID

group by Year (so.orderdate), Month (so.orderdate)
),
cte2 AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY OrderYear 
           ORDER BY  OrderMonth      DESC) AS rn
    FROM cte1
)
SELECT OrderYear, OrderMonth, MonthlyTotal, CumulativeTotal

From (
select
    OrderYear,
    CAST(OrderMonth AS VARCHAR(10)) AS OrderMonth,
    MonthlyTotal,
    CumulativeTotal,
    OrderMonth as OrdenMes
FROM cte1

UNION ALL

SELECT 
    OrderYear,
    'GrandTotal' as OrderMonth,
    CumulativeTotal AS MonthlyTotal,
    CumulativeTotal,
    13 as OrdenMes
FROM cte2
WHERE rn = 1
) as Final
ORDER BY OrderYear, OrdenMes asc

-----exc 8  - project 2

select OrderMonth, [2013],[2014],[2015],isnull([2016],0)
from(
select  Year(orderdate) as orderYear, Month(Orderdate) as OrderMonth, 
count(orderID)as QuantityOfOrders 
from sales.Orders
group by Year(orderdate), Month(Orderdate) 
) A
pivot (sum (QUantityoforders) for Orderyear in ([2013],[2014],[2015],[2016])) as PVT

---exc 9 nuevo revisado (assuming getdate as 31/5/16)- project2

with cte1 as (
select sc.CustomerID, sc.CustomerName, so.OrderDate, 
lag (so.orderdate,1) over (partition by sc.customerID order by so.orderdate) as PreviousOrderDate
,
datediff (day, 
lag (so.orderdate,1) over (partition by sc.customerID order by so.orderdate), so.orderdate
) as DayDifferenceBetweenOrders

from  sales.orders so join sales.customers sc
on so.CustomerID=sc.CustomerID
),
-------
cte2 as (
select sc.CustomerID, sc.CustomerName, 
max (so.orderdate) as LastOrderDate, 
DATEDIFF (day, max(so.orderdate),'2016-5-31') as DaysSinceLastOrder

from  sales.orders so join sales.customers sc
on so.CustomerID=sc.CustomerID

group by sc.CustomerID, sc.customerName
)
------
select  
sc.CustomerID, sc.CustomerName, so.OrderDate,
lag (so.orderdate,1) over (partition by sc.customerID order by so.orderdate) as PreviousOrderDate
, ct2.DaysSinceLastOrder,
AVG (ct1.DayDifferenceBetweenOrders) as 'AvgDaysBetweenOrders',
case 
when ct2.DaysSinceLastOrder >  AVG (ct1.DayDifferenceBetweenOrders)*2
then 'potential chunk'
else 'active'
end as 'CustomerStatus'

from  sales.orders so join sales.customers sc
on so.CustomerID=sc.CustomerID
join cte1 ct1
on ct1.CustomerID=sc.CustomerID
join cte2 ct2
on ct2.customerID=so.CustomerID

group by sc.CustomerID, sc.CustomerName, so.OrderDate,ct2.DaysSinceLastOrder
order by sc.CustomerID, so.OrderDate

-----exc 10 - Project 2

with cte1 as (
select distinct cc.customercategoryname,
case 
    WHEN c.customername LIKE '%Wingtip%' THEN 'WingtipCustomers'
    WHEN c.customername LIKE '%Tailspin%' THEN 'TailspinCustomers'
    ELSE c.customername
    END AS NewCustomerNameList
FROM 
sales.customers c join sales.customerCategories cc
on c.customercategoryID=cc.CustomerCategoryID

group by cc.CustomerCategoryName,c.customername 
)
select distinct customercategoryname,
count (customercategoryname) as CustomerCOUNT,
(select  (count (*)) from cte1) as TotalGeneral,

Format(round(
count (customercategoryname)*100.0/(select(count (*))from cte1)
,2), '0.00') + '%'

as DistributorFactor
FROM
cte1
group by CustomerCategoryName
order by CustomerCategoryName





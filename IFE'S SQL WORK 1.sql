 SELECT CUSTOMERID, NAMESTYLE, TITLE, FIRSTNAME AS FNAME, MIDDLENAME AS [M NAME]
FROM SalesLT.Customer

---Aliases

SELECT *
FROM SalesLT.Address


SELECT Name AS Pname, (ListPrice - StandardCost) AS Profit, productID AS PID, Color AS ProductColor, Size,
		ListPrice LP, (StandardCost * 2) AS ElevatedCost, PRODUCTNUMBER
FROM SalesLT.Product


---ORDER BY CLAUSE

SELECT ProductID, ListPrice, StandardCost, (ListPrice - StandardCost) AS Profit, (StandardCost * 2) [Elevated Cost], Color AS ProductColor, SellStartDate, 
NAME, Weight
FROM SalesLT.Product
ORDER BY Color ASC, Profit DESC

---TO FIND THE PREMIUM COST:  (StandardCost * 2/400) AS PremiumCost

SELECT Name, Color, ListPrice, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellStartDate, ProductID, ProductNumber
FROM SalesLT.Product
ORDER BY (ListPrice - StandardCost) - (StandardCost * 2)/400 DESC


---TOP is used to sort
SELECT TOP 5 Name, Color, ListPrice, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellStartDate, ProductID, ProductNumber
FROM SalesLT.Product
ORDER BY (ListPrice - StandardCost) - (StandardCost * 2)/400 DESC

---OFFSET and FETCH
SELECT Name, Color, ListPrice, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellStartDate, ProductID, ProductNumber
FROM SalesLT.Product
ORDER BY (ListPrice - StandardCost) - (StandardCost * 2)/400 DESC
OFFSET 10 ROWS 
FETCH NEXT 5 ROWS ONLY

SELECT Name [Product Name], Color, ListPrice AS Price, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 50 ROWS 
FETCH NEXT 50 ROWS ONLY

SELECT Name [Product Name], Color, ListPrice AS Price, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 50 ROWS 
FETCH NEXT 50 ROWS ONLY


---DISTINCT
SELECT Distinct Top 5 Color
FROM SalesLT.Product

select distinct size
from SalesLT.Product

---THE WHERE CLAUSE
SELECT Name [Product Name], Color, ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID
FROM SalesLT.Product
WHERE StandardCost > 1000

---AND/OR
SELECT Name [Product Name], Color, ListPrice AS Price, Standardcost, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID
FROM SalesLT.Product
WHERE StandardCost > 1000 AND 
Color = 'black'

SELECT Name [Product Name], Color, ListPrice AS Price, Standardcost, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID
FROM SalesLT.Product
WHERE StandardCost > 1000 OR
Color = 'black'

---!= OR NOT
SELECT Name [Product Name], Color, ListPrice AS Price, Standardcost, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID
FROM SalesLT.Product
WHERE StandardCost != 1000

SELECT Name [Product Name], Color, ListPrice AS Price, Standardcost, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID
FROM SalesLT.Product
WHERE NOT StandardCost = 1000



---List all the products whose prices are beyond 1000
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit
FROM SalesLT.Product
WHERE ListPrice > 1000

---List all the products whose standard cost at most 500
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit
FROM SalesLT.Product
WHERE StandardCost <= 500

---We are only interested in products whose prices fall between 30 and 500
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit
FROM SalesLT.Product
WHERE ListPrice Between 30 And 500

---We are only interested in products whose prices are 30, 40 and 500
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit
FROM SalesLT.Product
WHERE ListPrice = 30
or ListPrice = 40
or ListPrice = 500

---Another way to answer the previous question instead of using OR multiple times we can use IN
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit
FROM SalesLT.Product
WHERE ListPrice IN (30, 40, 500)


---List the products that started selling in July 2001
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit
, SellStartDate
FROM SalesLT.Product
WHERE SellStartDate BETWEEN '2001-07-01' 
 AND '2001-07-31'

---List all the information about products with model between 6 and 33
SELECT *
FROM SalesLT.ProductModel
WHERE ProductModelID between 6 and 33

---IS 
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit, Size
FROM SalesLT.Product
WHERE Size IS Null

---IS NOT
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit, Size
FROM SalesLT.Product
WHERE SIZE IS NOT NULL

---NOT 
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit, Size
FROM SalesLT.Product
WHERE NOT SIZE ='58'

---!=
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit, Size
FROM SalesLT.Product
WHERE SIZE !='58'

SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit, 
(StandardCost * 20)/400 AS Premiumcost,
(StandardCost * 20)/400 +  (ListPrice - StandardCost) AS ultimateamount, Color, SellEndDate
FROM SalesLT.Product
WHERE color IN ('BLUE', 'RED') AND SellEndDate IS NOT NULL
OR ((StandardCost * 20)/400 +  (ListPrice - StandardCost) <= 200000)

---LIKE Operator
SELECT Name [Product Name], ListPrice AS Price, standardCost, (ListPrice - StandardCost) AS Profit, Size, color
FROM SalesLT.Product
WHERE Color Like  '%e%'

---Display the 20 costliest product with list prices higher than 560 and also started selling in 2001
SELECT Top 20 Name, ListPrice, sellstartdate
FROM SalesLT.Product
WHERE ListPrice > 560
and SellStartDate between '2001-01-01' and '2001-12-31'
order by ListPrice desc

---Display the details of all products that started selling in the year they stopped selling, for only products that have stopped selling
SELECT Name, sellstartdate, sellenddate
FROM SalesLT.Product
WHERE SellStartDate = SellEndDate
AND SellEndDate IS NOT NULL

---The boss is only interested to see the Jersey-related products with their prices not up to 50
SELECT Name, ListPrice AS prices
FROM SalesLT.Product
WHERE Name Like '%Jersey%'
and ListPrice < 50

---Our stakeholders are looking to taking a huge business decision.
---This critical decision, which must be carefully taken requires deep insight into the profitability of each product. All Platinum products will be suspended!
---You must perform an analysis on the products such that any product whose profits are less than or exactly 500 should be categorized as Common.
---Those with profit from 501 to 1000 should be categorized as Gold;
---Those with profit from 1001 and 3000, are still in sale and have the word 'Black' in their names should be categorized as Platinum;
---While those with profit above 3000, still in sale and have their premium costs more than their profits and should be categorized as Emerald.
---You are to write a query that displays ONLY the details of the last 5 products that will be suspended


SELECT TOP 5 Name, ListPrice, StandardCost, Color, (ListPrice - StandardCost) AS Profit, (StandardCost * 2) AS ElevatedCost, 
(StandardCost * 20)/400 AS PremiumCost, SellStartDate, SellEndDate,
      (CASE
            WHEN (ListPrice - StandardCost) <= 500 THEN 'Common'
            WHEN (ListPrice - StandardCost) BETWEEN 501 AND 1000 THEN 'Gold'
            WHEN (ListPrice - StandardCost) BETWEEN 1001 AND 3000 
                 AND Name LIKE '%Black%' AND SellEndDate IS NOT NULL THEN 'Platinum'
            WHEN (ListPrice - StandardCost) > 3000 
                 AND (StandardCost * 20)/400 > (ListPrice - StandardCost) AND SellEndDate IS NOT NULL THEN 'Emerald'
            ELSE 'Irrelevant'
       END) AS Category
FROM SalesLT.Product
WHERE (CASE
            WHEN (ListPrice - StandardCost) <= 500 THEN 'Common'
            WHEN (ListPrice - StandardCost) BETWEEN 501 AND 1000 THEN 'Gold'
            WHEN (ListPrice - StandardCost) BETWEEN 1001 AND 3000 
                 AND Name LIKE '%Black%' AND SellEndDate IS NOT NULL THEN 'Platinum'
            WHEN (ListPrice - StandardCost) > 3000 
                 AND (StandardCost * 20)/400 > (ListPrice - StandardCost) AND SellEndDate IS NOT NULL THEN 'Emerald'
            ELSE 'Irrelevant'
      END) = 'Platinum'
ORDER BY SellStartDate DESC

---System Function

---Character  String Functions Len(), Left(), Right(), Concat(), Replace()

SELECT Name, Color, ListPrice AS Price, (ListPrice - StandardCost) AS Profit, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID, LEN(Color) as ColorCharacterCount, 
LEFT(Name, 5) as LeftName, Len(LEFT(Name, 5)), CONCAT(LEFT(Name, 5), ' ', Len(LEFT(Name, 5))) AS Countofsomething
FROM SalesLT.Product
where LEN(Color) < 6 

---Some key functions --- CAST()
SELECT Name, Color, ListPrice AS Price, (ListPrice - StandardCost) AS Profit, (standardcost * 20), (CAST(CAST(Standardcost as nvarchar) AS MONEY) *20) AS textcost,
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID, LEN(Color) as ColorCharacterCount, 
LEFT(Name, 5) as LeftName, Len(LEFT(Name, 5)), CONCAT(LEFT(Name, 5), ' ', Len(LEFT(Name, 5))) AS Countofsomething
FROM SalesLT.Product
where (CAST(CAST(Standardcost as nvarchar) AS MONEY) *20) < 100

---ISNULL
SELECT Name, Color, (ListPrice - StandardCost) AS Profit, (StandardCost *20), (CAST(CAST(Standardcost as nvarchar) AS MONEY) *20) AS textcost,
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID, LEN(Color) as ColorCharacterCount, 
LEFT(Name, 5) as LeftName, Len(LEFT(Name, 5)), CONCAT(LEFT(Name, 5), ' ', Len(LEFT(Name, 5))) AS Countofsomething, ISNULL(Standardcost, 200.09)
FROM SalesLT.Product
where (CAST(CAST(Standardcost as nvarchar) AS MONEY) *20) < 100 


---Date Functions
SELECT Name, Color, (ListPrice - StandardCost) AS Profit, (StandardCost *20) as doublestandadardcost, (CAST(CAST(Standardcost as nvarchar) AS MONEY) *20) AS textcost,
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount,  Weight, SellEndDate, ProductID, LEN(Color) as ColorCharacterCount, 
LEFT(Name, 5) as LeftName, Len(LEFT(Name, 5)), CONCAT(LEFT(Name, 5), ' ', Len(LEFT(Name, 5))) AS Countofsomething, ISNULL(Standardcost, 200.09),
Year(sellstartdate) AS sellstartyear, month(sellstartdate) AS sellstartmonth, Day(sellstartdate) AS sellstartday,
DATENAME(MM, sellstartdate), DATENAME(DW, SellStartDate), DATEADD(mm, 2, SellStartDate), DATEDIFF(MM, SellStartDate, SellEndDate),
DATEDIFF(MM, SellStartDate, GETDATE()) AS productage, Lower(Name)
FROM SalesLT.Product
where (CAST(CAST(Standardcost as nvarchar) AS MONEY) *20) < 100 AND
DATENAME(DW, SellStartDate) > 'Sunday'

---AGGREGATE FUNCTIONS SUM(), AVG(), MIN(), MAX(), STDEV() and group by
---ALPHABETS ARE TREATED AS HIGHER IN RANK THAN NUMBERS 

SELECT SUM(Listprice), color, size
FROM SalesLT.Product
GROUP BY size, color

SELECT SUM(Listprice), color
FROM SalesLT.Product
WHERE Color != 'BLACK'
GROUP BY color

---HAVING CLAUSE - IS USED T0 FILTER GROUPS/aggregate functions
SELECT SUM(Listprice), color
FROM SalesLT.Product 
WHERE Color != 'BLACK'
GROUP BY color
HAVING SUM(Listprice) <= 500



---(ListPrice - StandardCost) AS Profit, (StandardCost * 20)/400 AS PremiumCost, (ListPrice - StandardCost) + (StandardCost * 2)/400 AS Ultimateprice
SELECT SUM(standardcost), AVG((ListPrice - StandardCost) + (StandardCost * 2)/400 ) AS UltimatePrice, year(SellStartDate) AS year
FROM SalesLT.Product
WHERE color IN ('BLUE', 'RED') AND SellEndDate IS NOT NULL
OR (ListPrice - StandardCost) + (StandardCost * 2)/400 <= 200000
GROUP BY year(SellStartDate)
HAVING AVG(Listprice) <5000 or sum((ListPrice - StandardCost) + (StandardCost * 2)/400) >=5000

SELECT SUM(standardcost), AVG((ListPrice - StandardCost) + (StandardCost * 2)/400 ) AS UltimatePrice, year(SellStartDate) AS year
FROM SalesLT.Product
WHERE Productid in( 714, 715, 716, 722, 723, 724, 725, 726, 727, 728, 729, 730, 736, 737, 738, 754, 755, 756, 771, 772, 773, 774, 775, 776, 777, 778,
779, 780, 781, 782, 783, 784, 789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 
807, 808, 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 841, 842) 
and DATEDIFF(mm, sellstartdate, getdate()) < 280 and
color IN ('BLUE', 'RED') AND SellEndDate IS NOT NULL
OR (ListPrice - StandardCost) + (StandardCost * 2)/400 <= 200000
GROUP BY year(SellStartDate)
HAVING AVG(Listprice) <5000 or sum((ListPrice - StandardCost) + (StandardCost * 2)/400) >=5000

---The JOIN
select*
From salesLT.product Inner join SalesLT.ProductCategory
on salesLT.Product.productCategoryID = SalesLT.ProductCategory.productCategoryID 
Inner Join SalesLT.ProductModel
on SalesLT.Product.productModelID = SalesLT.ProductModel.productModelID
Left Join SalesLT.SalesOrderDetail
on SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID

select Listprice, Standardcost, productnumber, weight, SalesLT.Product.Name AS ProductName, SalesLT.ProductCategory.Name AS PCName
From salesLT.product Inner join SalesLT.ProductCategory
on salesLT.Product.productCategoryID = SalesLT.ProductCategory.productCategoryID 
Inner Join SalesLT.ProductModel
on SalesLT.Product.productModelID = SalesLT.ProductModel.productModelID
Left Join SalesLT.SalesOrderDetail
on SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID

---Table Aliases
select Listprice, Standardcost, productnumber, weight, P.Name AS ProductName, PC.Name AS PCName
From salesLT.product AS P Inner join SalesLT.ProductCategory AS PC
on P.productCategoryID = PC.productCategoryID 
Inner Join SalesLT.ProductModel AS PM
on P.productModelID = PM.productModelID
Left Join SalesLT.SalesOrderDetail AS SOD
on P.ProductID = SOD.ProductID

SELECT Name AS ProductNames, Color, (ListPrice - StandardCost) AS Profit, (StandardCost * 20)/400 AS PremiumCost, 
(ListPrice - StandardCost) - (StandardCost * 2)/400 AS UltimateAmount, Weight, SellEndDate, ProductID
FROM SalesLT.Product
Order by Weight DESC
OFFSET 50 Rows FETCH NEXT 50 Rows only


---VIEW
CREATE VIEW SalesLT.vTEST AS 
SELECT 
    ProductID,
    Name AS ProductName,
    Color,
    ListPrice - StandardCost AS Profit,
    (StandardCost * 20.0 / 400) AS PremiumCost,
    ((StandardCost * 20.0 / 400) - (ListPrice - StandardCost)) AS UltimateAmount,
   CAST(Weight AS int) AS [Weight],
    SellEndDate
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 50 ROWS FETCH NEXT 50 ROWS ONLY;

SELECT *
FROM SalesLT.vTEST



---AI PROMPT ENGINEERING
SELECT 
    ProductID,
    Name AS ProductName,
    Color,
    ListPrice - StandardCost AS Profit,
    (StandardCost * 20.0 / 400) AS PremiumCost,
    ((StandardCost * 20.0 / 400) - (ListPrice - StandardCost)) AS UltimateAmount,
    Weight,
    SellEndDate
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 50 ROWS FETCH NEXT 50 ROWS ONLY;

SELECT 
    ProductID,
    Name AS ProductName,
    Color,
    ListPrice - StandardCost AS Profit,
    (StandardCost * 20.0 / 400) AS PremiumCost,
    (ListPrice - StandardCost) - (StandardCost * 20.0 / 400) AS UltimateAmount,
    Weight,
    SellEndDate
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 50 ROWS FETCH NEXT 50 ROWS ONLY;

SELECT @@SERVERNAME, DB_NAME();

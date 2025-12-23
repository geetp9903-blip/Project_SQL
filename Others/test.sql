WITH sales_data AS(
SELECT 
    s.customerkey AS customer_id,
    SUM(netprice*quantity*exchangerate) as total_sales 
FROM sales as s 
group by s.customerkey
)

SELECT
    AVG(sd.total_sales) as Spending_Customers,
    AVG(COALESCE(sd.total_sales , 0)) as All_Customers
FROM customer AS c 
LEFT JOIN sales_data AS sd 
on c.customerkey = sd.customer_id

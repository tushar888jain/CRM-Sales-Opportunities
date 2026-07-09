--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
-- phase 1- exploring the data



select*
from accounts;

select*
from products;


select*
from dictionary;

select*
from sales_pipeline;


select*
from sales_teams;

-- inspecting the structure


describe accounts;

describe dictionary;

describe products;

DESCRIBE sales_pipeline;

describe sales_teams;

-- checking data quality

Select opportunity_id, count(*)
from sales_pipeline
group by opportunity_id
having count(*)>1;


SELECT *
FROM accounts
WHERE account IS NULL;

select*
from products 
where product is null;

select*
from sales_teams
where sales_agent is null;

-- understand the business

select count(*)
from sales_pipeline;

select count(*)
from accounts;

select count(*)
from products;


select count(*)
from sales_teams;

-- Building a Table


SELECT
sp.opportunity_id,
sp.deal_stage,
sp.engage_date,
sp.close_date,
sp.close_value,

a.account,
a.sector,
a.revenue,
a.employees,

p.product,
p.series,
p.sales_price,

st.sales_agent,
st.manager,
st.regional_office

FROM sales_pipeline sp

LEFT JOIN accounts a
ON sp.account = a.account

LEFT JOIN products p
ON sp.product = p.product

LEFT JOIN sales_teams st
ON sp.sales_agent = st.sales_agent;

-- analysing business

select deal_stage, count(*) as total_deals
from sales_pipeline
group by deal_stage
order by total_deals desc ;


select sales_agent, sum(close_value) as revenue
from sales_pipeline
group by sales_agent
order by revenue desc;

select a.sector, sum(close_value) as revenue
from sales_pipeline as sp
join accounts as a
on sp.account = a.account
group by a.sector
order by revenue desc;

-- Revenue by Product

select product, sum(close_value) as revenue
from sales_pipeline
group by product 
order by revenue desc;

-- Revenue by Manager

select st.manager, sum(close_value) as revenue
from sales_pipeline as sp
join sales_teams as st
on sp.sales_agent= st.sales_agent
group by st.manager
order by revenue desc;

-- Deals won by agent

select sales_agent, count(*) as won_deals
from sales_pipeline
where deal_stage= 'won'
group by sales_agent
order by won_deals desc;

-- Reveue by Regional office

select st.regional_office, sum(sp.close_value) as revenue
from sales_pipeline sp
join sales_teams st
on sp.sales_agent= st.sales_agent
group by st.regional_office
order by revenue desc;

-- Top 10 accounts by revenue

select account, sum(close_value) as revenue
from sales_pipeline
group by account
order by revenue desc 
limit 10;

-- deals by sector

select a.sector, count(sp.opportunity_id) AS TOTAL_DEALS
from sales_pipeline as sp
join accounts as a
on sp.account= a.account
group by a.sector
order by total_deals desc;

-- average deal value

select avg(close_value) as average_deal_value
from sales_pipeline
where close_value is not null;

-- highest value deal

select opportunity_id,account,product,sales_agent,close_value
from sales_pipeline
order by close_value desc
limit 1;


-- How many deals are High, Medium, and Low value?

select opportunity_id, close_value,
    case
    when close_value>=5000 then 'high value'
    when close_value>=1000 then 'medium value'
    else 'low value'
    end as sales_value
    	from sales_pipeline;
        
-- How many deals fall into each category?

select
case 
when close_value >= 5000 then 'high value'
when close_value>= 1000 then 'medium value'
else 'low value'
end as deal_category,
count(*) as total_deals
from sales_pipeline
group by deal_category 
order by total_deals desc;

-- Which sales agents generated more revenue than the average sales agent?

SELECT
    sales_agent,
    SUM(close_value) AS revenue
FROM sales_pipeline
GROUP BY sales_agent
HAVING SUM(close_value) >
(
    SELECT AVG(agent_revenue)
    FROM
    (
        SELECT SUM(close_value) AS agent_revenue
        FROM sales_pipeline
        GROUP BY sales_agent
    ) AS avg_table
);

-- Rank Sales Agents by Revenue

select sales_agent, sum(close_value) as total_revenue,
rank() over(order by sum(close_value) desc) revenue_rank
from sales_pipeline
group by sales_agent;


-- Dense Rank Products

SELECT
    product,
    SUM(close_value) AS revenue,
    DENSE_RANK() OVER (ORDER BY SUM(close_value) DESC) AS product_rank
FROM sales_pipeline
GROUP BY product;


-- Top 3 sales agent

with agentrevenue as
(
	select sales_agent, sum(close_value) as total_revenue,
    rank() over ( order by sum(close_value)desc) as revenue_rank
    from sales_pipeline
    group by sales_agent
    )
    select*
    from agentrevenue
    where revenue_rank <= 3;





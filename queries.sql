-- P: Quantos armazéns existem e qual é a sua capacidade?
select *
from warehouses;
-- R: Existem quatro armazéns com seus respectivos códigos, nomes e capacidade atual em porcentagem. O armazém C tem mais espaço disponível, estando apenas 50% cheio.

-- P: Quais são todos os produtos desta empresa?
select * 
from products;
-- Total de produtos na companhia 
select count(*)
from products;
-- R: A empresa atualmente possui um inventário diversificado de 110 produtos distintos.

-- Q: Verifique se algum produto está armazenado em múltiplos armazéns.
select productCode, count(warehouseCode) as warehouse
from products
group by productCode
having count(warehouseCode) > 1;
-- R: Não há produtos armazenados em múltiplos armazéns. Portanto, podemos concluir que cada armazém armazena linhas de produtos específicas.

-- Identificar a contagem única de produtos e seu estoque total em cada armazém
select p.warehouseCode, w.warehouseName, count(productCode) as total_product, sum(p.quantityInStock) as total_stock 
from products as p 
join warehouses as w on p.warehouseCode = w.warehouseCode 
group by p.warehouseCode, w.warehouseName 
limit 0, 1000;
 -- O armazém B contém 38 produtos diferentes, com um total de 219.183 unidades em estoque, tornando-se o armazém com maior quantidade armazenada.

 -- Identificar quais linhas de produtos cada armazém armazena
select p.warehouseCode, w.warehouseName, p.productLine, count(p.productCode) as total_product, sum(p.quantityInStock) as total_stock 
from products as p 
join warehouses as w on p.warehouseCode = w.warehouseCode 
group by p.warehouseCode, w.warehouseName, p.productLine 
limit 0, 1000; 

-- Armazém A (Norte): aviões + motocicletas
-- 12 aviões, 13 motocicletas = 25 produtos no total

-- Armazém B (Leste): carros clássicos
-- 38 produtos no total de carros clássicos

-- Armazém C (Oeste): carros vintage
-- 24 produtos no total de carros vintage

-- Armazém D (Sul): caminhões + ônibus, navios, trens
-- 11 caminhões + ônibus, 9 navios, 3 trens = 23 produtos no total
 
 -- Qual linha de produto teve o maior e o menor número de vendas?
select products.productLine, count(orderdetails.productCode) as no_of_sales
from products 
join orderdetails 
on products.productCode = orderdetails.productCode
group by products.productLine
order by no_of_sales desc;

-- Criar uma tabela temporária inventory_summary para indicar o status das linhas de produtos
create temporary table inventory_summary as(
 select p.warehouseCode as warehouseCode, 
 p.productCode as productCode, 
 p.productName as productName, 
 p.quantityInStock as quantityInStock, 
 sum(od.quantityOrdered) as total_ordered, 
 p.quantityInStock - sum(od.quantityOrdered) as remaining_stock,
	case 
	when(p.quantityInStock - SUM(od.quantityOrdered)) > (2 * SUM(od.quantityOrdered)) then 'Overstocked'
	when (p.quantityInStock - SUM(od.quantityOrdered)) < 650 then 'Understocked'
	else 'Well-Stocked'
	end as inventory_status
 from products AS p
 join orderdetails AS od ON p.productCode = od.productCode
 join orders o ON od.orderNumber = o.orderNumber
 where o.status in ('Shipped', 'Resolved')
 group by p.warehouseCode, p.productCode, p.quantityInStock
);

-- Quantos produtos estão superlotados e subabastecidos em cada armazém?
select warehouseCode, inventory_status, count(*) as product_count
from inventory_summary
group by warehouseCode, inventory_status
order by warehouseCode;
-- O armazém B tem o maior número de produtos superlotados, com um total de 29 produtos, enquanto os armazéns A e C possuem 19 produtos superlotados cada.
select warehouseCode, count(*) as product_overstocked
from inventory_summary
where inventory_status = 'Overstocked'
group by warehouseCode;

-- Analisar várias linhas de produtos, identificando aquelas com os maiores percentuais de vendas e obter insights sobre o inventário e desempenho de vendas de cada linha de produtos.
select p.productLine,
pl.textDescription as productLineDescription,
sum(p.quantityInStock) as totalInventory,
sum(od.quantityOrdered) as totalSales,
sum(od.priceEach * od.quantityOrdered) as totalRevenue,
(sum(od.quantityOrdered) / sum(p.quantityInStock)) * 100 as salesToInventoryPercentage
from mintclassics.products as p
left join mintclassics.productlines as pl on p.productLine = pl.productLine
left join mintclassics.orderdetails as od on p.productCode = od.productCode
group by p.productLine, pl.textDescription
order by  salesToInventoryPercentage desc



 
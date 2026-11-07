--Berapa jumlah order yang tercatat?
SELECT COUNT(*) jumlah_order
FROM bigquery-public-data.thelook_ecommerce.orders;

--Berapa jumlah item yg dibeli?
SELECT COUNT(*) jumlah_item
FROM bigquery-public-data.thelook_ecommerce.order_items;

--Berapa jumlah order untuk masing-masing status?
SELECT 
 status,
 COUNT(*) jumlah_order
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY status;

--Apa saja 10 produk terlaris berdasarkan jumlah order?
SELECT product_id, COUNT(*) item_cnt
FROM bigquery-public-data.thelook_ecommerce.order_items
GROUP BY product_id
ORDER BY 2 DESC
LIMIT 10;

--Berapa jumlah customer untuk masing-masing negara?
SELECT country, COUNT(*) jumlah_cust
FROM bigquery-public-data.thelook_ecommerce.users
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

--Bagaimana performa masing-masing status jumlah item, jumlah order, total sales, rata-rata sale price
SELECT
 status,
 COUNT(*) jumlah_item,
 COUNT(DISTINCT order_id) jumlah_order,
 ROUND(SUM (sale_price), 2) total_sales,
 ROUND(AVG (sale_price), 2) avg_sales_price
FROM bigquery-public-data.thelook_ecommerce.order_items
GROUP BY 1
ORDER BY 4 DESC;

--Berapa revenue yang dihasilkan?
SELECT
 ROUND(SUM(sale_price) / 1000000, 2 ) total_revenue
FROM bigquery-public-data.thelook_ecommerce.order_items;

--Berapa total product dan rata-rata harga product per kategori
SELECT
 category,
 COUNT(*),
 AVG(retail_price) rata2_harga
FROM bigquery-public-data.thelook_ecommerce.products
GROUP BY 1;

 --Berapa jumlah transaksi, jumlah sale price, dan rata-rata nilai per transaksi (AOV) untuk masing-masing user tampilkan hanya 10 user dengan jumlah sale price tertinggi
SELECT 
FROM 
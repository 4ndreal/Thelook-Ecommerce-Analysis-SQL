--Mini project SQL

--1. Analisa produk
SELECT
 name,
 category,
 department,
 brand,
 ROUND(retail_price, 2)
FROM bigquery-public-data.thelook_ecommerce.products
LIMIT 20;

--2. Identifikasi produk premium
SELECT
 name,
 category,
 brand,
 ROUND(retail_price, 2) harga_retail
FROM bigquery-public-data.thelook_ecommerce.products
WHERE retail_price >100
ORDER BY harga_retail DESC
LIMIT 20;

--3. Evaluasi kategori produk
SELECT
 category,
 COUNT(name) jumlah_produk
FROM bigquery-public-data.thelook_ecommerce.products
GROUP BY category
ORDER BY jumlah_produk DESC
LIMIT 20;

--4. Mengenal pelanggan dan pesanan
SELECT
  o.order_id AS ID_pesanan,
  status,
  o.user_id,
  o.created_at,
  first_name,
  last_name
FROM bigquery-public-data.thelook_ecommerce.users u
INNER JOIN bigquery-public-data.thelook_ecommerce.orders o
  ON u.id = o.user_id;

--5. Analisi penjualan per kategori
SELECT
  category,
  ROUND(SUM(sale_price), 2) total_penjualan
FROM bigquery-public-data.thelook_ecommerce.order_items oi
INNER JOIN bigquery-public-data.thelook_ecommerce.products p
  ON oi.product_id = p.id
GROUP BY p.category
ORDER BY total_penjualan DESC;

--Insight hasil dari soal no. 3. Jumlah produk per kategori
--1. Intimates punya katalog terbesar. Intimates punya 2.362 produk, jauh di atas Jeans di posisi kedua (1.999). Ini menunjukkan fokus koleksi di pakaian dalam wanita, yang modelnya beragam (ukuran warna, gaya) dan sering dibeli ulang.
--2. Katalog bertumpu pada pakaian sehari-hari. Lima kategori terbesar adalah Intimates, Jeans, Tops & Tees, Fashion Hoodies & Sweatshirts dan Swim. Bersama-sama ada 9.893 produk, sekitar 36% dari produk di 20 kategori ini. Fokusnya di pakaian kasual yang permintaannya stabil.
--3. Banyak kategori di level menengah dan rata. Posisi 4 sampai 9 (Hoodies, Swim, Sleep & Lounge, Shorts, Sweaters, Accessories) hanya berselisih tipis, sekitar 1.560–1.870 produk. Pilihan produknya cukup luas dan seimbang, tidak bergantung pada satu kategori saja.
--4. Kategori khusus jumlahnya lebih sedikit. Maternity (898), Plus (758) dan Suits & Sport Coats (739) melayani segmen yang lebih spesifik. Kalau permintaannya ada, ini peluang untuk menambah pilihan dan menjangkau pelanggan yang kurang terlayani.

--Insight hasil dari soal no. 5.Insight: total penjualan per kategori
--Total penjualan dari 26 kategori adalah $10,8 juta, dengan rata-rata sekitar $415 ribu per kategori.
--1. Outerwear & Coats dan Jeans menjadi penyumbang utama. Outerwear & Coats ($1,34 juta, 12,4%) dan Jeans ($1,24 juta, 11,5%) bersama-sama menghasilkan 23,9% dari total penjualan. Nilai keduanya ($2,58 juta) lebih dari 2 kali lipat 10 kategori terbawah ($1,14 juta). Prioritaskan stok, visibilitas di website, dan promosi untuk dua kategori ini.
--2. Penjualan terkonsentrasi di sebagian kategori (pola Pareto). Kelompok	Kontribusi penjualan. 6 kategori teratas	49,5%, 13 kategori teratas	80,5%, 13 kategori terbawah	19,5%Setengah kategori menghasilkan 80% penjualan. Anggaran marketing dan pengadaan stok sebaiknya difokuskan ke 13 kategori teratas.
--3. Kategori bernilai tinggi lebih unggul daripada kategori berjumlah produk terbanyak. Hasil soal nomor 3 menunjukkan Intimates punya produk terbanyak (2.362), tapi penjualannya hanya peringkat 11. Sebaliknya, Outerwear & Coats (1.419 produk) dan Suits & Sport Coats (739 produk) masuk 4 besar penjualan. Penjualan lebih ditentukan oleh harga per item daripada banyaknya pilihan produk.
--4. Kategori pakaian hangat dan formal mendominasi. Outerwear, Sweaters, Suits & Sport Coats, dan Hoodies semuanya masuk 6 besar. Produk ini harganya tinggi dan penjualannya kemungkinan dipengaruhi musim, jadi siapkan stok dan kampanye menjelang musim dingin. Cek tren penjualan bulanannya untuk memastikan.
--5. Beberapa kategori berkontribusi sangat kecil. Clothing Sets ($16,9 ribu, 0,2%), Jumpsuits & Rompers ($40,3 ribu, 0,4%), dan Socks & Hosiery ($63,3 ribu, 0,6%) ada di posisi terbawah. Selisih kategori teratas dan terbawah mencapai 79 kali lipat. Kategori ini perlu dievaluasi untuk dibundling, dipromosikan, atau dikurangi stoknya.
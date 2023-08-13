-- 1
SELECT pt.name product, pt.id product_id, pc.name provider, pc.id provider_id FROM Product pt
LEFT JOIN Producer pc ON pt.id_producer = pc.id;

-- 2
SELECT p.name, d.date_of_delivery, s.name FROM Product p
LEFT JOIN Delivery d ON p.id = d.id_product
RIGHT JOIN Supplier s ON s.id = d.id_supplier;

-- 3
SELECT DISTINCT c.name
FROM Product p LEFT JOIN Category c ON p.id_category = c.id
EXCEPT
SELECT DISTINCT c.name
FROM Product p LEFT JOIN Category c ON p.id_category = c.id
WHERE c.name = 'Amway'; 

-- 4
SELECT s.name, p.name, c.name FROM Supplier s LEFT JOIN Delivery d ON d.id_product = s.id
LEFT JOIN Product p ON p.id = d.id_product
LEFT JOIN Category c ON p.id_category = c.id
EXCEPT
SELECT s.name, p.name, c.name FROM Supplier s LEFT JOIN Delivery d ON d.id_product = s.id
LEFT JOIN Product p ON p.id = d.id_product
LEFT JOIN Category c ON p.id_category = c.id AND c.name = 'Dairy';
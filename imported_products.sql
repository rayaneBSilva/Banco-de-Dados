SELECT p.name AS product_name, pr.name AS provider_name, c.name AS category_name
FROM products p
JOIN providers pr ON p.id_providers = pr.id
JOIN categories c ON p.id_categories = c.id
WHERE pr.name = 'Sansul SA' AND c.name = 'Imported';

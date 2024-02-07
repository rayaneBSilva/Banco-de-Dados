SELECT prod.name , forn.name 
FROM products prod INNER JOIN providers forn ON prod.id_providers = forn.id
WHERE id_categories = '6';
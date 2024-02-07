SELECT
  name,
  ROUND(omega * 1.618, 3) AS "The N Factor"
FROM life_registry
WHERE dimensions_id IN (5, 1) -- Select dimensions C875 and C774
AND name LIKE 'Richard%'
ORDER BY omega;
SELECT
  d.name AS name,
  ROUND(SUM(a.hours * 150 * (1 + (w.bonus / 100))), 1) AS salary
FROM doctors d
JOIN attendances a ON d.id = a.id_doctor
JOIN work_shifts w ON a.id_work_shift = w.id
GROUP BY d.name
ORDER BY salary DESC;
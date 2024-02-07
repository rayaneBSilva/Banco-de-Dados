SELECT name, ROUND(((math * 2 + specific * 3 + project_plan * 5) / 10)::numeric, 2) AS avg
FROM candidate
JOIN score ON candidate.id = score.candidate_id
ORDER BY avg DESC;

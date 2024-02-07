WITH RankedTeams AS (
  SELECT
    team,
    ROW_NUMBER() OVER (ORDER BY position) AS rnk
  FROM league
)

SELECT
  CASE
    WHEN rnk <= 3 THEN 'Podium: ' || team
    WHEN rnk > 13 THEN 'Demoted: ' || team
  END AS name
FROM RankedTeams
WHERE rnk <= 3 OR rnk > 13;
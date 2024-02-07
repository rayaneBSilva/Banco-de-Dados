WITH TeamResults AS (
    SELECT
        t.name AS team_name,
        COUNT(m.id) AS matches,
        SUM(CASE
            WHEN m.team_1 = t.id AND m.team_1_goals > m.team_2_goals THEN 1
            WHEN m.team_2 = t.id AND m.team_2_goals > m.team_1_goals THEN 1
            ELSE 0
        END) AS victories,
        SUM(CASE
            WHEN m.team_1 = t.id AND m.team_1_goals < m.team_2_goals THEN 1
            WHEN m.team_2 = t.id AND m.team_2_goals < m.team_1_goals THEN 1
            ELSE 0
        END) AS defeats,
        SUM(CASE
            WHEN m.team_1 = t.id AND m.team_1_goals = m.team_2_goals THEN 1
            WHEN m.team_2 = t.id AND m.team_2_goals = m.team_1_goals THEN 1
            ELSE 0
        END) AS draws,
        SUM(
            CASE
                WHEN m.team_1 = t.id AND m.team_1_goals > m.team_2_goals THEN 3
                WHEN m.team_2 = t.id AND m.team_2_goals > m.team_1_goals THEN 3
                WHEN m.team_1 = t.id AND m.team_1_goals = m.team_2_goals THEN 1
                WHEN m.team_2 = t.id AND m.team_2_goals = m.team_1_goals THEN 1
                ELSE 0
            END
        ) AS score
    FROM teams t
    LEFT JOIN matches m ON t.id = m.team_1 OR t.id = m.team_2
    GROUP BY t.name
)

SELECT * 
FROM TeamResults
ORDER BY score DESC;
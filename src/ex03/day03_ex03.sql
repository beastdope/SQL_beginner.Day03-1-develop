WITH male_visits AS (
    SELECT piz.name AS pizzeria_name,
        COUNT(pv.person_id) AS visited_by_male
    FROM pizzeria piz
        JOIN person_visits pv ON piz.id = pv.pizzeria_id
        JOIN person ON pv.person_id = person.id
    WHERE person.gender = 'male'
    GROUP BY piz.name
    ORDER BY piz.name
),
female_visits AS (
    SELECT piz.name AS pizzeria_name,
        COUNT(pv.person_id) AS visited_by_female
    FROM pizzeria piz
        JOIN person_visits pv ON piz.id = pv.pizzeria_id
        JOIN person ON pv.person_id = person.id
    WHERE person.gender = 'female'
    GROUP BY piz.name
    ORDER BY piz.name
)
SELECT COALESCE(m.pizzeria_name, f.pizzeria_name) AS pizzeria_name
FROM male_visits m
    FULL OUTER JOIN female_visits f ON m.pizzeria_name = f.pizzeria_name
ORDER BY CASE
        WHEN COALESCE(m.visited_by_male, 0) > COALESCE(f.visited_by_female, 0) THEN 1
        WHEN COALESCE(m.visited_by_male, 0) < COALESCE(f.visited_by_female, 0) THEN 2
        ELSE 3
    END,
    COALESCE(m.pizzeria_name, f.pizzeria_name);
SELECT DISTINCT piz.name AS pizzeria_name
FROM person
    JOIN person_visits pv ON person.id = pv.person_id
    JOIN pizzeria piz ON pv.pizzeria_id = piz.id
WHERE person.id = 2
EXCEPT
SELECT DISTINCT piz.name
FROM person
    JOIN person_order po ON person.id = po.person_id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria piz ON menu.pizzeria_id = piz.id
WHERE person.id = 2;
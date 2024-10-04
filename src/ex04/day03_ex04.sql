(
    SELECT DISTINCT piz.name AS pizzeria_name
    FROM person
        JOIN person_order po ON person.id = po.person_id
        JOIN menu ON menu.id = po.menu_id
        JOIN pizzeria piz ON piz.id = menu.pizzeria_id
    WHERE person.gender = 'female'
    EXCEPT
    SELECT DISTINCT piz.name
    FROM person
        JOIN person_order po ON person.id = po.person_id
        JOIN menu ON menu.id = po.menu_id
        JOIN pizzeria piz ON piz.id = menu.pizzeria_id
    WHERE person.gender = 'male'
)
UNION
(
    SELECT DISTINCT piz.name
    FROM person
        JOIN person_order po ON person.id = po.person_id
        JOIN menu ON menu.id = po.menu_id
        JOIN pizzeria piz ON piz.id = menu.pizzeria_id
    WHERE person.gender = 'male'
    EXCEPT
    SELECT DISTINCT piz.name
    FROM person
        JOIN person_order po ON person.id = po.person_id
        JOIN menu ON menu.id = po.menu_id
        JOIN pizzeria piz ON piz.id = menu.pizzeria_id
    WHERE person.gender = 'female'
)
ORDER BY pizzeria_name;
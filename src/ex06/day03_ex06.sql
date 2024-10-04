SELECT menu.pizza_name,
    piz.name AS pizzeria_name_1,
    piz2.name AS pizzeria_name_2,
    menu.price
FROM menu
    JOIN menu menu2 ON menu.pizza_name = menu2.pizza_name
    AND menu.price = menu2.price
    JOIN pizzeria piz ON menu.pizzeria_id = piz.id
    JOIN pizzeria piz2 ON menu2.pizzeria_id = piz2.id
WHERE menu.pizzeria_id != menu2.pizzeria_id;
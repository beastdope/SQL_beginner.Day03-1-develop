UPDATE menu
SET price = ROUND(price * 0.90, 0)
WHERE pizza_name = 'greek pizza';
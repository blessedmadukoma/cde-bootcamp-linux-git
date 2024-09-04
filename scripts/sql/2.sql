-- Find orders where standard_qty is 0 and either gloss_qty or poster_qty is greater than 1000
SELECT id, standard_qty, gloss_qty, poster_qty
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

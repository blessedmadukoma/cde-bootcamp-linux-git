-- Display regions, sales reps, and accounts, sorted alphabetically by account name
SELECT region_name, sales_rep_name, account_name
FROM sales_reps
JOIN accounts ON sales_reps.sales_rep_id = accounts.sales_rep_id
ORDER BY account_name ASC;

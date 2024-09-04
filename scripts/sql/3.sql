-- Find company names that start with 'C' or 'W', and primary contact contains 'ana' but not 'eana'
SELECT company_name
FROM companies
WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
  AND (primary_contact ILIKE '%ana%' AND primary_contact NOT ILIKE '%eana%');

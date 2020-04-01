SELECT date, totalTestResultsIncrease
FROM `states_daily`
WHERE totalTestResultsIncrease IS NOT NULL
AND state = 'NY'
ORDER BY date DESC
LIMIT 200;

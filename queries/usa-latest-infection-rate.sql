SELECT
  date,
  SUM(positive) AS positive,
  SUM(positiveIncrease) as positive_increase,
  (100.0 * SUM(positiveIncrease)/(SUM(positive) - SUM(positiveIncrease))) as percentage_increase
FROM states_daily
WHERE date = (SELECT DISTINCT date from states_daily ORDER BY date DESC LIMIT 1 OFFSET 0)
;

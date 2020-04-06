SELECT
  date,
  state,
  positive,
  positiveIncrease as positive_increase,
  (100.0 * positiveIncrease/(positive - positiveIncrease)) as percentage_increase
FROM states_daily
WHERE date = (SELECT DISTINCT date from states_daily ORDER BY date DESC LIMIT 1 OFFSET 0)
ORDER BY state
;


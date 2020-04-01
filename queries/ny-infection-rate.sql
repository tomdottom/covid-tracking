SELECT
  date,
  state,
  positive,
  positiveIncrease as positive_increase,
  (100.0 * positiveIncrease/(positive - positiveIncrease)) as percentage_increase
FROM states_daily
WHERE state = 'NY'
AND positiveIncrease IS NOT NULL
ORDER BY date
;


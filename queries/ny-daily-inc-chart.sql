SELECT
  date,
  state,
  positiveIncrease AS positiveIncrease,
  LPAD ('', positiveIncrease / (SELECT (MAX(positiveIncrease)/25) FROM states_daily WHERE state = 'NY'), '#') AS graph
FROM states_daily
WHERE state = 'NY'
AND positiveIncrease IS NOT NULL
ORDER BY date DESC
;


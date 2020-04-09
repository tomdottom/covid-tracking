SELECT
    date
  , IFNULL(SUM(positive), 0) AS positive
  , IFNULL(SUM(positiveIncrease), 0) as positive_increase
  , IFNULL((100.0 * SUM(positiveIncrease)/(SUM(positive) - SUM(positiveIncrease))), 0) as percentage_increase
FROM states_daily
GROUP BY date
ORDER BY date DESC
;


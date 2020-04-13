# Covid Tracking

Loads State daily data from https://covidtracking.com/api/

Repos:

- https://www.dolthub.com/repositories/tomdottom/covid-tracking/
- https://github.com/tomdottom/covid-tracking


## Updating data

Use script:

    ./update.sh

Or just run:

    curl http://covidtracking.com/api/states/daily.csv > states-daily
    dolt table import --update-table states_daily states-daily.csv

NOTE: Data is updated at 2am via GitHub Actions.


## Querying NY infection rate

### Using saved query

    dolt sql -x=ny-infection-rate


### Using raw query

    dolt sql << EOF
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
    EOF 

### Using SQL files

    dolt sql < queries/ny-infection-rate.sql


## Notes on initialising db

See `docs/setup.md`


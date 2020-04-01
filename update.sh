#/bin/sh

curl http://covidtracking.com/api/states/daily.csv > states-daily.csv
dolt table import --update-table states_daily states-daily.csv


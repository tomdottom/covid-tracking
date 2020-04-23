#/bin/sh

export TMPDIR="$PWD/tmp"
mkdir -p "${TMPDIR}"

dolt config --list
dolt config --global --list

git dolt fetch covid-tracking.git-dolt || true

cd covid-tracking
dolt checkout master
dolt pull

curl http://covidtracking.com/api/states/daily.csv > states-daily.csv
dolt table import --update-table states_daily states-daily.csv
dolt add states_daily
dolt commit -m "Update states_daily $(date --iso=second)"
dolt push --set-upstream origin master


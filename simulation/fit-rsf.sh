#!/bin/bash

## using four cores here
limit=4
count=0

echo "[$(date)]: simulation started."
for ((process = 1; process < 1001; process++))
do
    Rscript --vanilla fit-rsf.R $process &
    count=$(($count + 1))
    echo "[$(date)]: process $process started."
    if [[ $count -ge $limit ]]
    then
        wait
        count=0
    fi
done

echo "[$(date)]: all done."

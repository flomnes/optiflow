#!/bin/bash

for i in {1..7}; do
    mkdir resu/case$i
    time (./run_case.sh $i > resu/case$i/output.log)
done

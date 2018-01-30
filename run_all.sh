#!/bin/bash

# Florian OMNES (florian.omnes@upmc.fr)
# Charles DAPOGNY (charles.dapogny@univ-grenoble-alpes.fr)
# Pascal FREY (pascal.frey@upmc.fr)
# Yannick PRIVAT (yannick.privat@upmc.fr
# Copyright Sorbonne-Universités 2015-2018
# PLEASE DO NOT REMOVE THIS BANNER


for i in {1..7}; do
    mkdir resu/case$i
    time (./run_case.sh $i > resu/case$i/output.log)
done

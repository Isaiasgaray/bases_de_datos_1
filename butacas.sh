#!/bin/bash
printf "INSERT INTO butaca (posicion, sala_id)\nVALUES"

BUTACAS=$(
for sala_id in {1..9}; do
  for letra_pos in {A..E}; do
    printf "\t"
    printf "('$letra_pos%s', $sala_id), " {1..5}
    echo
  done
done
)

echo "${BUTACAS%??}"

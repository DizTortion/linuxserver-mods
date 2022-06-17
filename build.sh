#!/bin/sh

set -e

for d in */; do
  MOD=$(basename $d)
  echo "$MOD"
  docker build $MOD -t diztortion/linuxserver-mods:$MOD
  docker push diztortion/linuxserver-mods:$MOD
done

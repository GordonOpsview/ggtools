#!/usr/bin/env bash

echo wibble
ls -l | grep 'r[w-]x' | awk '{print $9}'
# https://raw.githubusercontent.com/GordonOpsview/ggtools/main/ansiblog
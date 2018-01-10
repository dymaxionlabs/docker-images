#!/bin/bash
set -eu

L2A_Process=$SEN2COR_BIN/L2A_Process.py

if [ $# -eq 0 ]; then
  python $L2A_Process --help
  exit 1
fi

python $L2A_Process "$@"

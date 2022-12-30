#!/bin/bash
set -e
PATH=$PATH:/home/${USER}/.local/bin
exec jupyter lab --ip=0.0.0.0 "$@"

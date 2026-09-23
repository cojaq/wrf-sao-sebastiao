#!/bin/bash -l
#PBS -N ssc_smoke
#PBS -A PROJECT_CODE
#PBS -q main
#PBS -l walltime=01:00:00
#PBS -l select=1:ncpus=128:mpiprocs=32
#PBS -j oe
set -euo pipefail
source config/local.json 2>/dev/null || true
echo "Use ./experiment setup antes de submeter."
echo "Atualize a conta PBS neste arquivo ou gere-o pelo workflow."

#!/bin/bash

set -e

# Created 2026-10-01 09:29:06

CASEDIR="/glade/work/pheidary/crocodile2026/workspace/westcoast_lowres"

/glade/work/pheidary/crocodile2026/CESM_DA/cime/scripts/create_newcase --compset CR_JRA_DA --res USER_RES --case "${CASEDIR}" --machine derecho --run-unsupported --handle-preexisting-dirs a --pecount L --project UCGD0009 --ninst 3 --non-local

cd "${CASEDIR}"

./xmlchange OCN_GRID=westcoast_lowres --non-local

./xmlchange OCN_NX=370 --non-local

./xmlchange OCN_NY=380 --non-local

./xmlchange OCN_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast_lowres/ocn/ESMF_mesh_westcoast_lowres_d479ab.nc --non-local

./xmlchange ICE_GRID=westcoast_lowres --non-local

./xmlchange ICE_NX=370 --non-local

./xmlchange ICE_NY=380 --non-local

./xmlchange ICE_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast_lowres/ocn/ESMF_mesh_westcoast_lowres_d479ab.nc --non-local

./xmlchange WAV_GRID=westcoast_lowres --non-local

./xmlchange WAV_NX=370 --non-local

./xmlchange WAV_NY=380 --non-local

./xmlchange WAV_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast_lowres/ocn/ESMF_mesh_westcoast_lowres_d479ab.nc --non-local

./xmlchange MASK_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast_lowres/ocn/ESMF_mesh_westcoast_lowres_d479ab.nc --non-local

./xmlchange ATM_GRID=TL319 --non-local

./xmlchange LND_GRID=TL319 --non-local

./xmlchange ATM_DOMAIN_MESH=/glade/campaign/cesm/cesmdata/inputdata/share/meshes/TL319_151007_ESMFmesh.nc --non-local

./xmlchange LND_DOMAIN_MESH=/glade/campaign/cesm/cesmdata/inputdata/share/meshes/TL319_151007_ESMFmesh.nc --non-local

./case.setup --non-local

./xmlchange MOM6_MEMORY_MODE=dynamic_symmetric --non-local

./xmlchange CALENDAR=GREGORIAN --non-local

./xmlchange RUN_STARTDATE=2024-06-15 --non-local

./xmlchange STOP_OPTION=ndays --non-local

./xmlchange STOP_N=3 --non-local

./xmlchange DATA_ASSIMILATION_OCN=TRUE

./xmlchange STOP_OPTION=ndays,STOP_N=1

./xmlchange DATA_ASSIMILATION_CYCLES=3

./xmlchange DOUT_S=FALSE

./xmlchange DART_OBS_ROOT=/glade/work/pheidary/crocodile2026/workspace/obs/real

./preview_namelists --comp esp

./xmlchange JOB_QUEUE=tutorial --force

./case.setup --reset

./xmlchange JOB_QUEUE=tutorial --subgroup case.run

./xmlchange JOB_WALLCLOCK_TIME=01:00:00 --subgroup case.run

./case.setup --reset

./xmlchange JOB_QUEUE=tutorial --subgroup case.run

./xmlchange JOB_WALLCLOCK_TIME=01:00:00 --subgroup case.run

./case.setup --reset

./xmlchange NTASKS_OCN=128,NTASKS_ESP=128

./xmlchange ROOTPE_OCN=128

./case.setup --reset

./case.setup --reset

./case.build

./case.submit


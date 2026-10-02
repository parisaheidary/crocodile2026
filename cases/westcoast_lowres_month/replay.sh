#!/bin/bash

set -e

# Created 2026-10-01 15:07:11

CASEDIR="/glade/work/pheidary/crocodile2026/workspace/westcoast_lowres_month"

/glade/work/pheidary/crocodile2026/CESM_DA/cime/scripts/create_newcase --compset CR_JRA_DA --res USER_RES --case "${CASEDIR}" --machine derecho --run-unsupported --handle-preexisting-dirs a --pecount L --project UCGD0009 --ninst 30 --non-local

cd "${CASEDIR}"

./xmlchange OCN_GRID=westcoast_lowres_month --non-local

./xmlchange OCN_NX=370 --non-local

./xmlchange OCN_NY=380 --non-local

./xmlchange OCN_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast_lowres_month/ocn/ESMF_mesh_westcoast_lowres_month_0a64c3.nc --non-local

./xmlchange ICE_GRID=westcoast_lowres_month --non-local

./xmlchange ICE_NX=370 --non-local

./xmlchange ICE_NY=380 --non-local

./xmlchange ICE_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast_lowres_month/ocn/ESMF_mesh_westcoast_lowres_month_0a64c3.nc --non-local

./xmlchange WAV_GRID=westcoast_lowres_month --non-local

./xmlchange WAV_NX=370 --non-local

./xmlchange WAV_NY=380 --non-local

./xmlchange WAV_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast_lowres_month/ocn/ESMF_mesh_westcoast_lowres_month_0a64c3.nc --non-local

./xmlchange MASK_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast_lowres_month/ocn/ESMF_mesh_westcoast_lowres_month_0a64c3.nc --non-local

./xmlchange ATM_GRID=TL319 --non-local

./xmlchange LND_GRID=TL319 --non-local

./xmlchange ATM_DOMAIN_MESH=/glade/campaign/cesm/cesmdata/inputdata/share/meshes/TL319_151007_ESMFmesh.nc --non-local

./xmlchange LND_DOMAIN_MESH=/glade/campaign/cesm/cesmdata/inputdata/share/meshes/TL319_151007_ESMFmesh.nc --non-local

./case.setup --non-local

./xmlchange MOM6_MEMORY_MODE=dynamic_symmetric --non-local

./xmlchange CALENDAR=GREGORIAN --non-local

./xmlchange RUN_STARTDATE=2024-05-15 --non-local

./xmlchange STOP_OPTION=ndays --non-local

./xmlchange STOP_N=61 --non-local

./xmlchange DATA_ASSIMILATION_OCN=TRUE

./xmlchange STOP_OPTION=ndays,STOP_N=5

./xmlchange DATA_ASSIMILATION_CYCLES=12

./xmlchange DATA_ASSIMILATION_OCN=TRUE

./xmlchange STOP_OPTION=ndays,STOP_N=5

./xmlchange DATA_ASSIMILATION_CYCLES=12

./xmlchange DOUT_S=FALSE

./xmlchange DART_OBS_ROOT=/glade/work/pheidary/crocodile2026/workspace/obs/real

./xmlchange JOB_QUEUE=Tutorial

./xmlchange JOB_QUEUE=tutorial --force

./preview_namelists --comp esp

./case.setup --reset

./xmlchange JOB_QUEUE=tutorial --subgroup case.run

./xmlchange JOB_WALLCLOCK_TIME=02:00:00 --subgroup case.run

./case.setup --reset

./case.build

./case.build

./xmlchange NTASKS_OCN=128,NTASKS_ESP=128

./xmlchange ROOTPE_OCN=128

./xmlchange JOB_WALLCLOCK_TIME=05:00:00 --subgroup case.run

./case.setup --reset

./xmlchange JOB_WALLCLOCK_TIME=05:00:00 --subgroup case.run

./xmlchange JOB_WALLCLOCK_TIME=08:00:00 --subgroup case.run

./case.setup --reset

./case.build

./preview_namelists --comp esp

./xmlchange DATA_ASSIMILATION_CYCLES=10

./case.build

./case.submit

./xmlchange DATA_ASSIMILATION_CYCLES=10

./xmlchange JOB_WALLCLOCK_TIME=03:00:00 --subgroup case.run

./xmlchange CONTINUE_RUN=FALSE

./preview_namelists

./case.submit


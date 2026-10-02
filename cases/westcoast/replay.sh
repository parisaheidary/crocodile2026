#!/bin/bash

set -e

# Created 2026-09-30 16:05:48

CASEDIR="/glade/work/pheidary/crocodile2026/workspace/westcoast"

/glade/work/pheidary/crocodile2026/CESM_DA/cime/scripts/create_newcase --compset CR_JRA_DA --res USER_RES --case "${CASEDIR}" --machine derecho --run-unsupported --handle-preexisting-dirs a --pecount L --project UCGD0009 --ninst 3 --non-local

cd "${CASEDIR}"

./xmlchange OCN_GRID=westcoast --non-local

./xmlchange OCN_NX=740 --non-local

./xmlchange OCN_NY=760 --non-local

./xmlchange OCN_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast/ocn/ESMF_mesh_westcoast_121cfd.nc --non-local

./xmlchange ICE_GRID=westcoast --non-local

./xmlchange ICE_NX=740 --non-local

./xmlchange ICE_NY=760 --non-local

./xmlchange ICE_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast/ocn/ESMF_mesh_westcoast_121cfd.nc --non-local

./xmlchange WAV_GRID=westcoast --non-local

./xmlchange WAV_NX=740 --non-local

./xmlchange WAV_NY=760 --non-local

./xmlchange WAV_DOMAIN_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast/ocn/ESMF_mesh_westcoast_121cfd.nc --non-local

./xmlchange MASK_MESH=/glade/work/pheidary/crocodile2026/workspace/input_files/westcoast/ocn/ESMF_mesh_westcoast_121cfd.nc --non-local

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

./xmlchange DART_OBS_ROOT=/glade/campaign/cgd/oce/projects/CROCODILE/workshops/2026/dart/obs/real

./preview_namelists --comp esp

./xmlchange DATA_ASSIMILATION_OCN=TRUE

./xmlchange STOP_OPTION=ndays,STOP_N=1

./xmlchange DATA_ASSIMILATION_CYCLES=3

./xmlchange DOUT_S=FALSE

./xmlchange DART_OBS_ROOT=/glade/work/pheidary/crocodile2026/workspace/obs/real

./preview_namelists --comp esp

./xmlchange JOB_QUEUE=develop

./xmlchange NTASKS=16

./xmlchange ROOTPE_OCN=0

./xmlchange NTASKS_CPL=128,NTASKS_ATM=128,NTASKS_LND=128,NTASKS_ICE=128,NTASKS_ROF=128,NTASKS_GLC=128,NTASKS_WAV=128

./xmlchange NTASKS_OCN=896,NTASKS_ESP=896

./xmlchange ROOTPE_OCN=128

./case.setup --reset

./case.setup --reset

./xmlchange JOB_QUEUE=tutorial --force

./case.setup --reset

./xmlchange JOB_QUEUE=tutorial --subgroup case.run

./xmlchange JOB_WALLCLOCK_TIME=01:00:00 --subgroup case.run

./case.setup --reset

./preview_namelists --comp esp

./preview_namelists --comp esp

./xmlchange DART_OBS_ROOT=/glade/work/pheidary/crocodile2026/workspace/obs/clean

./preview_namelists --comp esp

./preview_namelists --comp esp

./case.build

./case.submit

./case.submit

./case.submit

./xmlchange NTASKS_OCN=512,NTASKS_ESP=512

./xmlchange ROOTPE_OCN=128

./xmlchange JOB_WALLCLOCK_TIME=01:00:00 --subgroup case.run

./case.setup --reset

./xmlchange NTASKS_OCN=512,NTASKS_ESP=512

./xmlchange ROOTPE_OCN=128

./xmlchange JOB_WALLCLOCK_TIME=01:00:00 --subgroup case.run

./case.setup --reset

./case.build

./case.submit


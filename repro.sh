#!/bin/bash

# CORECLR_ENABLE_PROFILING is set in launchsettings.json so that the profiler is only loaded for the target process
# and not for the dotnet process
# export CORECLR_ENABLE_PROFILING=1
export CORECLR_PROFILER={cf0d821e-299b-5307-a3d8-b283c03916dd}

export SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export CORECLR_PROFILER_PATH=$SCRIPT_PATH/libCorProfiler.dylib

dotnet run -c release -p webapp/webapp.csproj
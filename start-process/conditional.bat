echo off
setlocal
setlocal enabledelayedexpansion

set SAMPLE_ENVVAR1_SLEEP_TIME=10
set SAMPLE_ENVVAR1_MAX_RETRIES=6
set SAMPLE_ENVVAR1_RETRY_COUNT=0
:managerwaitloop
IF NOT "%SAMPLE_ENVVAR1%"=="" GOTO managerwaitloopend
echo SAMPLE_ENVVAR1 environment variable is not set. Sleeping for %SAMPLE_ENVVAR1_SLEEP_TIME% seconds...
timeout /t %SAMPLE_ENVVAR1_SLEEP_TIME%
set /a SAMPLE_ENVVAR1_RETRY_COUNT="SAMPLE_ENVVAR1_RETRY_COUNT+1"
IF %SAMPLE_ENVVAR1_RETRY_COUNT% GTR %SAMPLE_ENVVAR1_MAX_RETRIES% (
  set /a WAIT_TIME="SAMPLE_ENVVAR1_RETRY_COUNT*SAMPLE_ENVVAR1_MAX_RETRIES"
  echo SAMPLE_ENVVAR1 environment variable was not set within the expected time.
  exit
)
goto managerwaitloop
:managerwaitloopend

echo SAMPLE_ENVVAR1 environment variable is set to %SAMPLE_ENVVAR1%

timeout /t 10
IF "%SAMPLE_ENVVAR1%"=="1" (
  IF NOT EXIST C:\Users\circleci\project\README.md (
    echo "No README.md file found."
    exit
  )
  echo "Procesing README.md file..."
)
@echo off
rem run-cyc.bat

rem Shell script to execute the cyc server

rem After some time loading the world into memory you will see CYC(1):
rem which is the SubL command prompt.

rem [optional] 
rem You can enter SubL expressions such as (+ 1 2) or (genls #$Person)
rem or (all-genls #$Person) at the command line to verify Cyc's operation.
 
rem At this point the cyc http server is running and you can access
rem Cyc directly via the local web browser.
rem http://localhost:3602/cgi-bin/cyccgi/cg?cb-start
rem You can browse cyc via the Guest account or perform updates by
rem logging on as CycAdminstrator.

rem Modified work @ 2014 Andrew Smart

rem move working directory to scripts/ if not already there
cd %~dp0

rem See if Ant is on PATH, if not then try to run cyc anyway:
for %%X in (ant.bat) do (set FOUNDANT=%%~$PATH:X)
rem call Ant to verify official binaries are installed; if not it will install them
if defined FOUNDANT (ant -f ant-get-binaries.xml -quiet complete) else (echo "^!^!^!Ant not found on system^!^!^! Attempting to start OpenCyc anyway. If cyc fails to start, install Ant so that this script can retrieve official OpenCyc binaries.")

cd ..\server\cyc\run

rem for 64bit WinXP, Vista and Win7
bin\run-cyc.bat

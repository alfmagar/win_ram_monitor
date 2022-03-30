@echo off
set /A run=0
:loop
set /A run=%run%+1
for /f "skip=1" %%p in ('wmic os get freephysicalmemory') do ( 
  set free=%%p
  goto :done
)
:done
for /f "skip=1" %%a in ('wmic os get TotalVisibleMemorySize') do ( 
  set total=%%a
  goto :done2
)
:done2
set /a freeMB=%free% / 1024
set /a totalMB=%total% / 1024
echo ---------------------------------------------------- > ./memory_log.txt
echo Entrada de Log Nº: %run% >> ./memory_log.txt
echo ---------------------------------------------------- >> ./memory_log.txt
echo Nombre del equipo: %computername% >> ./memory_log.txt
echo Fecha: %DATE% >> ./memory_log.txt
echo Hora: %TIME% >> ./memory_log.txt
echo Memoria total: %totalMB% Megabytes >> ./memory_log.txt
echo Memoria libre: %freeMB% Megabytes >> ./memory_log.txt
echo ---------------------------------------------------- >> ./memory_log.txt
TIMEOUT /T 20
goto loop
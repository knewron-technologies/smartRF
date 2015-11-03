@echo off

cls
echo.
echo KNEWRON Technologies (c) 2015

set mcu=%1
set ostr=%4
set ostr=%ostr:"=%
set ext=%ostr:~-3%

for %%a in ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") do (call set ext=%%ext:%%~a%%)

if %ext% == hex goto next
if %ext% NEQ hex set ostr=%ostr%.hex

:next
if %mcu% == m328p goto program_328p
if %mcu% == m324a goto program_324a
if %mcu% == m324p goto program_324p
goto end

:program_328p
echo smartRF V1.0 [ mega328P ]
goto program

:program_324p
echo smartRF V1.0 [ mega324P ]
goto program

:program_324a
echo smartRF V1.0 [ mega324A ]
goto program

:program
mode %2 dtr=on>NUL
avrdude -p %1 -e -s -P %2 -c AVR109 -b %3 -U flash:w:%ostr%:i
echo KNEWRON Technologies (c) 2015
echo.

:end
@echo off
rem RunScript.bat
rem Evan Sutherland
rem 12/02/2020
rem Script to run our powershell script
Powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& 'c:\scripts\backup.ps1'"

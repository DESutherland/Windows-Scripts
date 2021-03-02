@echo off
Title ShareReport
rem Evan Sutherland 11/05/2020
rem Viewing shared folder permissions

net share Management$ > c:\scripts\ShareReport.txt
rem This line will show the share permissions of Management$ folder and save the report as a .txt file
pause

net share Marketing$ >> c:\scripts\ShareReport.txt
rem This line will show the share permissions of Marketing$ folder and update the previous .txt file with the new report
pause

net share Sales$ >> c:\scripts\ShareReport.txt
rem This line will show the share permissions of Sales$ folder and update the previous .txt file with the new report
pause

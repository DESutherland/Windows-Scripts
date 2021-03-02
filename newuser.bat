#Below is a .bat script that is used to create a new local user, add them to a User group, creates new folders, 
#sets security permissions, copies an .exe file, produces an ICACLS report, and moves the .bat file.

@echo off
rem This turns auto echo off, only lines I specify to echo will
title NewUser
rem This is the title of my batch file
rem Author - Evan Sutherland
rem Create a new user and grant permissions
rem Run the script as administrator
rem These previous 3 lines were for Author and a brief description of the script, and telling us to run as an admin
mkdir c:\Scripts\
rem This command will create a new folder called Scripts in the root of the C drive

net user ABruce student /add /fullname:”Aisha Bruce”
rem This will add a new user ABruce with a password of student
pause


cd e:\CompanyInc\Management
rem This will change our working directory

mkdir e:\CompanyInc\Management\ABruce_Files
rem This will create a directory ABruce_Files

icacls e:\CompanyInc\Management\ABruce_Files /grant ABruce:(OI)(CI)F
rem This grants the full control permissions and establishes object inheritance and container inheritance
pause


copy c:\windows\system32\cmd.exe e:\CompanyInc\Management\ABruce_Files
rem this will copy cmd.exe to ABruce_Files

net localgroup Management ABruce /add
rem This will add ABruce to the Management Group
pause


icacls e:\CompanyInc\Management\ABruce_Files
rem This command will return a list of all users and groups who are assigned permissions to this directory

echo Created icaclsReport.txt
rem This will print on the screen "Created icaclsReport.txt" but it won't create the file

icacls e:\CompanyInc\Management\ABruce_Files > c:\scripts\icaclsReport.txt
rem This will create an icacls report for ABruce_Files and save it in the root of c:\Scripts
pause


copy f:\NewUser.bat c:\Scripts
rem This will copy NewUser.bat to the root of c:\Scripts
pause


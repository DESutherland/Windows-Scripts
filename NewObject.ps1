# Title - NewObject.ps1
# Author - Evan Sutherland
# Creating a new user/group/directory and adjusting their memberships

#This line sets the password in a variable. Because we are setting a password it needs to be a secure string to not throw an error
$password = ConvertTo-SecureString "Student2020" -AsPlainText -Force

#This line creates a new user and takes the password variable to create a password
New-LocalUser -Name "Amelia Max" -Password $password

#This line creates a new group and gives it a description
New-LocalGroup -Name "ITAdmins" -Description "Tech Group"

#Adds our new user to the local group Users
Add-LocalGroupMember -Group "Users" -Member "Amelia Max" 

#This line adds our new group we just created to the Administrators group
Add-LocalGroupMember -Group "Administrators" -Member "ITAdmins"

#This line creates a new directory on the root of our c:\ drive
New-Item -Path "c:\" -Name "Backup" -ItemType "directory"

#This line copies our CompanyInc folder and all of its contents and puts that copy in to our newly made Backups folder
Copy-Item -Path E:\CompanyInc -Destination C:\Backup -Recurse 

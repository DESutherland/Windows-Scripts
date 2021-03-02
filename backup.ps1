# RunScript.bat can be run to execute this script

# This gets the username for the current environment and stores it in $cname variable
$cname = Get-Content env:username

# This gets the current date, formats it (1.Dec.2020 as an example) and saves it in a $date variable
$date = Get-Date -Format d.MMM.yyyy

# This saves the string entered with the $date variable included in it as the $drive variable
$drive = "C:\Backup\$date"

# This puts the two strings from the #drive and $cname together
$dest = $drive + $cname

# Creates a new item in the location in the $dest variable. The new item created with be a directory
New-Item -Path $dest -ItemType directory 

# Saves the entered string in the $path variable
$path = "E:\CompanyInc"

# This sets the $include variable as an array with the string provided
$include = @("*.*")

# This gets all child items from the $path directory. Because the -Include parameter is used our $path variable needs a trailing *. -Recurse gets items from all child containers from our path.
# -Force allows us to get items from the child containers that we might not otherwise have access to. -ErrorAction tells the script how to respond when an error is encountered, with SilentlyContinue suppresses errors from displaying to the screen
# This information is then pass along (piped) into a foreach loop where copy-item copies that path of $_(this is a variable in our pipeline and refers to our $path variable. It then sets the destination to our previously entered $dest variable
# -Recurse in the copy-item ensures we do a recursive copy, so we get all items from the location as well as all the child items, and -Container preserves all container objects.
#-ErrorAction tells the script how to respond when an error is encountered, with SilentlyContinue suppresses errors from displaying to the screen 
Get-ChildItem -Path $path -Include $include -Recurse -Force -ErrorAction SilentlyContinue | foreach { copy-item -Path $_ -Destination $dest -Recurse -Container  } -ErrorAction SilentlyContinue 

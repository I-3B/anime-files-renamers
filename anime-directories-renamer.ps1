Write-Host "This a script for removing brackets from folders name like: [anidl] and so..."
$folders = Get-ChildItem -Directory 
foreach ($folder in $folders) {
    try {
        $newName = $folder.name.Split("[""]")[2].trim();
        $folder | Rename-Item -NewName $newName;
    }
    catch {}
}
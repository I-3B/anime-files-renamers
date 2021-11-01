$fileExists = Test-Path "$env:USERPROFILE\Documents\rename-and-move-config.txt" -PathType Leaf
if ($false -eq $fileExists) {
    Write-output "Starting Configuration... if you Want to edit your configuration you can do so in '%USERPROFILE%\Documents\rename-and-move-config.txt'"
    $location = Read-Host -Prompt 'The parent folder you want your files to move to, e.g. "D:\anime"';
    "$location" | Out-File "$env:USERPROFILE\Documents\rename-and-move-config.txt" 
}
$files = Get-Item -Path "$pwd\*"  -include *.ass , *.srt, *.mp4, *.mkv
foreach ($file in $files) {
    try {
        $newName = ($file.name -replace "\[([^\[]*)\]", "").trim()
        $file | Rename-Item -NewName $newName;
    }
    catch {
    }
}
$files = Get-Item -Path "$pwd\*"  -include *.ass , *.srt, *.mp4, *.mkv
$moveTo = (get-content "$env:USERPROFILE\documents\rename-and-move-config.txt" )
foreach ($file in $files) {
    try {
        $fileNameArray = ([System.IO.Path]::GetFileNameWithoutExtension($file.name) -split ' - ')
        $fileName = '';
        for (($i = 0); $i -lt $fileNameArray.length - 1; $i++) {
            $fileName += $fileNameArray[$i] + " - "
        }
        $fileName = $fileName -replace ".{3}$"
        move-item $file ($moveTo + "\" + $fileName.trim() + "\" + $file.name.trim())
    }
    catch {
        Write-Error "Something went wrong... make sure the parent folder path is correct in '%USERPROFILE%\Documents\rename-and-move-config.txt' and that the parent folder does exists."
        Read-Host -Prompt "click Enter to exit"
    }
}
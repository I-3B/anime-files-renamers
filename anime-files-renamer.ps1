$files = Get-Item -Path "$pwd\*"  -include *.ass , *.srt, *.mp4, *.mkv
foreach ($file in $files) {
    try {
        $ext = [System.IO.Path]::GetExtension($file);
        $name = [System.IO.Path]::GetFileNameWithoutExtension($file);
        $newName = ($name -replace "\[([^\[]*)\]", "" ).trim()
        $file | Rename-Item -NewName ($newName + $ext);
    }
    catch {
        
    }
}
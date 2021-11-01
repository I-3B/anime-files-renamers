$files = Get-Item -Path "$pwd\*"  -include *.ass , *.srt, *.mp4, *.mkv 
foreach ($file in $files) {
    try {
        $ext = [System.IO.Path]::GetExtension($file);
        $name = [System.IO.Path]::GetFileNameWithoutExtension($file);
        $newWithoutBrackets = ($name -replace "\[([^\[]*)\]", "" -replace "\(([^\[]*)\)", "").trim()
        Select-String '[0-9]+' -input $newWithoutBrackets -AllMatches | Foreach {
            $NameWithNumbersOnly = "";
            $size = $_.matches.length
            for (($i = 0); $i -lt $size; $i++) {
                $NameWithNumbersOnly += $_.matches[$i].groups[0].value.trim()
            }
             
        }
        if ($NameWithNumbersOnly.length -ne 0 ) {
            $file | Rename-Item -NewName ($NameWithNumbersOnly + $ext);
        }
    }
    catch {
        
    }

}
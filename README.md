# Overview

NOTE: those script will be useful for you if you download anime from websites like [nyaa.si](nyaa.si) or [anidl.org](ainld.org)
where anime episodes name have a similar format to this:

`[AniDL] Re Zero kara Hajimeru Isekai Seikatsu - 39 [10bit 720p].mkv`

they won't work properly otherwise.

### Scripts:

-   [AFR.exe (anime-files-renamer.ps1)](#afr.exe)
-   [AFE.exe (Anime-files-renamer-episodes-only.ps1)](#afe.exe)
-   [ADR.exe (anime-directories-renamer.ps1)](#adr.exe)
-   [R&M.exe (anime-rename-and-move.ps1)](#r&m.exe)

## Usage

just place the .exe in the parent folder that you want to change its children files/folders and run it.

## AFR.exe

will remove all `[]` and their content, for example:

```bash.
Parent
├── AFR.exe
├── [SSA] Odd Taxi - 01 [720p].mkv
├── [SSA] Odd Taxi - 02 [720p].mkv
├── [SSA] Odd Taxi - 03 [720p].mkv
├── [SSA] Odd Taxi - 04 [720p].mkv
├── [SSA] Odd Taxi - 05 [720p].mkv
├── [SSA] Odd Taxi - 06 [720p].mkv
├── [SSA] Odd Taxi - 07 [720p].mkv
├── [SSA] Odd Taxi - 08 [720p].mkv
├── [SSA] Odd Taxi - 09 [720p].mkv
├── [SSA] Odd Taxi - 10 [720p].mkv
├── [SSA] Odd Taxi - 11 [720p].mkv
├── [SSA] Odd Taxi - 12 [720p].mkv
└── [SSA] Odd Taxi - 13 [1080p].mkv
```

after running the script:

```bash
Parent
├── AFR.exe
├── Odd Taxi - 01.mkv
├── Odd Taxi - 02.mkv
├── Odd Taxi - 03.mkv
├── Odd Taxi - 04.mkv
├── Odd Taxi - 05.mkv
├── Odd Taxi - 06.mkv
├── Odd Taxi - 07.mkv
├── Odd Taxi - 08.mkv
├── Odd Taxi - 09.mkv
├── Odd Taxi - 10.mkv
├── Odd Taxi - 11.mkv
├── Odd Taxi - 12.mkv
└── Odd Taxi - 13.mkv
```

**NOTE:** this script will only recognize files with those extensions: `.mvk`, `.mp4`, `.ass`, `.srt`.

## AFE.exe

will remove all `[]` and `()` with their content then will extract all numbers from the remaining text. If the file name doesn't have numbers in it will not rename the file.

for example:

```bash.
Parent
├── AFE.exe
├── Read.txt
├── [AniDL] Non Non Biyori - 01 - A New Transfer Student Came [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 02 - We Went to the Candy Store [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 03 - I Ran Away from Home with My Sister [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 04 - Summer Vacation Started [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 05 - I Pretended I Forgot My Swimsuit [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 06 - I Became a Ghost and Tried Hard [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 07 - My Rice Cracker Turned Into Curry [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 08 - We Cooked Rice at School [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 09 - We Tried Having a Cultural Festival [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 10 - We Watched the First Sunrise of the Year [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 11 - We Made Snow Houses [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - 12 - Spring Came Again [BD 720p] [Tsundere].mkv
├── [AniDL] Non Non Biyori - OAD [BD 720p] [Tsundere].mkv
├── [Phantom] Non Non Biyori - 01 [BD].ass
├── [Phantom] Non Non Biyori - 02 [BD].ass
├── [Phantom] Non Non Biyori - 03 [BD].ass
├── [Phantom] Non Non Biyori - 04 [BD].ass
├── [Phantom] Non Non Biyori - 05 [BD].ass
├── [Phantom] Non Non Biyori - 06 [BD].ass
├── [Phantom] Non Non Biyori - 07 [BD].ass
├── [Phantom] Non Non Biyori - 08 [BD].ass
├── [Phantom] Non Non Biyori - 09 [BD].ass
├── [Phantom] Non Non Biyori - 10 [BD].ass
├── [Phantom] Non Non Biyori - 11 [BD].ass
├── [Phantom] Non Non Biyori - 12 END [BD].ass
└── [Super-down] Non Non Biyori OVA [BD].ass
```

after running the script:

```bash.
Parent
├── 01.ass
├── 01.mkv
├── 02.ass
├── 02.mkv
├── 03.ass
├── 03.mkv
├── 04.ass
├── 04.mkv
├── 05.ass
├── 05.mkv
├── 06.ass
├── 06.mkv
├── 07.ass
├── 07.mkv
├── 08.ass
├── 08.mkv
├── 09.ass
├── 09.mkv
├── 10.ass
├── 10.mkv
├── 11.ass
├── 11.mkv
├── 12.ass
├── 12.mkv
├── AFE.exe
├── Read.txt
├── [AniDL] Non Non Biyori - OAD [BD 720p] [Tsundere].mkv
└── [Super-down] Non Non Biyori OVA [BD].ass
```

**Caution:** it will keep all the numbers outside `[]` and `()` so be careful.

**NOTE:** this script will only recognize files with those extensions: `.mvk`, `.mp4`, `.ass`, `.srt`.

## ADR.exe (anime-directories-renamer.ps1)

will rename only all the immediate children to the parent directory (the one ADR.exe is in).
so for example consider this directory name: ` [anidl] Tensei shitara Slime Datta Ken [720p][BD]`
the script will read every thing after the first `]` until it reach `[`
then will trim the output and the directory name will become `Tensei shitara Slime Datta Ken`

## R&M.exe (anime-rename-and-move.ps1)

will rename the files the same way AFR.exe does then will move them to a folder with the same name of the file (if it does exist otherwise it won't be moved),
you need to tell the script the path for the parent of this folder that you want to move the file to it.

for example:

```bash
My download folder
├── R&M.exe
├── [ASW] Heike Monogatari - 06 [1080p HEVC][D71FA7AB].mkv
├── [ASW] Heike Monogatari - 07[1080p HEVC][21BA29AD].mkv
├── [ASW] Senpai ga Uzai Kouhai no Hanashi - 02 [1080p HEVC][AD6F7EAC].mkv
├── [ASW] Senpai ga Uzai Kouhai no Hanashi - 03 [1080p HEVC][AD6F7EAC].mkv
├── [Asahi] Heike Monogatari - 06.ass
└── [KazariSubs] Senpai ga Uzai Kouhai no Hanashi - 02.ass
```

the folder you want to move the files to its children (the one you need to tell the script the path to it)

```bash
My anime folder
├── Senpai ga Uzai Kouhai no Hanashi/
└── Heike Monogatari/
```

after running the script the files in the download folder(in our example) will be moved to the folders (inside 'my anime folder') that have the same name of the files (after renaming them).

**NOTE:** the file name need to have the episode number in the end of the name

so this won't work:

```
[AniDL] Non Non Biyori - 01 - A New Transfer Student Came [BD 720p] [Tsundere].mkv
```

those will work:

```
[ASW] Heike Monogatari - 05 [1080p HEVC][A3A2A081].mkv
```

```
[AniDL] Shingeki no Kyojin - The Final Season - 03 [BD 720p].mkv
```

**NOTE 2:** this script will only recognize files with those extensions: `.mvk`, `.mp4`, `.ass`, `.srt`.

if exist build rmdir /q /s build
mkdir build

tools\boo\booc -nologo -debug- -o:build\filetypes.exe src\filetypes.boo
tools\boo\booc -nologo -debug- -o:build\guid.exe      src\guid.boo
tools\boo\booc -nologo -debug- -o:build\split_.exe    src\split.boo
tools\boo\booc -nologo -debug- -o:build\matches_.exe  src\matches.boo
tools\boo\booc -nologo -debug- -o:build\rn_.exe       src\rn.boo

tools\ilrepack\ilrepack /target:exe /out:build\split.exe   build\split_.exe   tools\boo\Boo.Lang.dll
tools\ilrepack\ilrepack /target:exe /out:build\matches.exe build\matches_.exe tools\boo\Boo.Lang.dll
tools\ilrepack\ilrepack /target:exe /out:build\rn.exe      build\rn_.exe      tools\boo\Boo.Lang.dll

del build\*_.exe
rem del build\*.pdb
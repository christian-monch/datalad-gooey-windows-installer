
Outfile "t2-installer-amd64.exe"
ShowInstDetails show

Section "Python 3.9 and datalad gooey"
    StrCpy $INSTDIR "\Users\cristian\nsis\instdir"
    #ExecWait "mkdir C:\Users\cristian\nsis\instdir\python39\Scripts"
    SetOutPath "C:\Users\cristian\nsis\instdir\python39"
    File /r "sources\python39\*.*"
    #SetOutPath "C:\Users\cristian\nsis\instdir\python39\Scripts"
    #File /r "sources\python39\Scripts\*.*"
    ExecWait "\Users\cristian\nsis\instdir\python39\python -m pip install datalad"
    ExecWait "\Users\cristian\nsis\instdir\python39\python -m pip install Pyside6"
    ExecWait "\Users\cristian\nsis\instdir\python39\python -m pip install datalad-gooey"
    #'$INSTDIR\Prerequisits\python-3.9.13-adm64.exe'
SectionEnd

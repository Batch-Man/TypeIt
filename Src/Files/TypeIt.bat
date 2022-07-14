@Echo off
cls
SetLocal EnableDelayedExpansion
Title Demo TypeIt Test - www.batch-man.com

Set "_Text=This is the Default Text, As you have not typed anything when asked. You must be following orders."
Set _PauseTime=350
Set _CharDelayTime=100
Set _CharsAtOnce=1

:Main
Set "_Text=%~1"
Call Getlen "%_Text%"
Set _Text_Len=%Errorlevel%

:Loop
If Defined _Text (
    Set /A _CharsAtOnce=%Random%%%9
    For %%a in (!_CharsAtOnce!) do (
        TypeWriter "!_Text:~0,%%a!" !_CharDelayTime!
        batbox /w !_PauseTime!
        Set "_Text=!_Text:~%%a!"
    )
) ELSE (Goto :Next)
Goto :Loop

:Next
pause
Goto :EOF
@Echo off
Setlocal EnableDelayedExpansion

Set path=%path%;%~dp0;%~dp0Files;%cd%;%cd%\Files;

REM THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY
REM KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
REM WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
REM AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
REM HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
REM WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
REM DEALINGS IN THE SOFTWARE.

REM This program is distributed under the following license:

REM ================================================================================
REM GNU General Public License (GPL) - https://opensource.org/licenses/gpl-license
REM ================================================================================


REM ================= ABOUT THE PROGRAM =================
REM This program is created by Kvc at '14-07-2022 -  7:41'
REM This program help in creating a bit more realistic human typing experience for the
REM can end user, as it adds random delays with random chars - trying to simulate human
REM typing.
REM 
REM For More Visit: www.batch-man.com


REM Setting version information...
Set _ver=20220714


REM Checking for various parameters of the function...
for %%A in ("--help" "-h" "-help") do (if /i "%%A" == "%~1" (goto :help))
If /i "%~1" == "/?" (goto :help)
If /i "%~1" == "-?" (goto :help)

If /i "%~1" == "ver" (Echo.%_ver%&Goto :End)
If /i "%~1" == "" (goto :help)


REM Saving parameters to variables...
Set _1=%~1

REM Starting Main Program...
:Main

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
	Set /A _PauseTime=%Random%%%100
    Set /A _CharsAtOnce=%Random%%%9
    For %%a in (!_CharsAtOnce!) do (
        TypeWriter "!_Text:~0,%%a!" !_CharDelayTime!
        batbox /w !_PauseTime!
        Set "_Text=!_Text:~%%a!"
    )
) ELSE (Goto :End)
Goto :Loop
Goto :End


:End
Goto :EOF

:Help
Echo.
Call Typeit "This function is batch extension of typewriter plugin."&Echo.
Call Typeit "It will help in creating a bit more realistic human typing experience for the "&Echo.
Call Typeit "end user, as it adds random delays with random chars - trying to simulate human"&Echo.
Call Typeit "typing."&Echo.
Call Typeit "CREDITS: TypeIt %_ver% by Kvc"&Echo.
echo.
echo. Syntax: call TypeIt ["Text"]
echo. Syntax: call TypeIt [help , /? , -h , -help]
echo. Syntax: call TypeIt ver
echo.
echo. Where:-
echo.
echo. ver		: Displays version of program
echo. help		: Displays help for the program
echo. Text		: Text to display on console screen
Echo.
Call Typeit "`"&Echo.
Echo.
Echo. Example: Call TypeIt "This is a Test"
Call Typeit "Example: Call TypeIt ver"&Echo.
Call Typeit "Example: Call TypeIt [/? , -h , -help , help]"&Echo.
Echo.
Call Typeit "Now, you can make your help menus more Interactive and interesting like"&Echo.
Call Typeit "this one."&Echo.
Echo.
Call Typeit "PLUGINS REQUIRED FOR THIS PROJECT:"&Echo.
Call Typeit "Getlen		by Kvc"&Echo.
Call Typeit "Batbox		by darkbatcher"&Echo.
Call Typeit "Typewriter	by Zeek	"&Echo.
Echo.
Call Typeit "www.batch-man.com"&Echo.
Call Typeit "#batch-man"&Echo.
Goto :End


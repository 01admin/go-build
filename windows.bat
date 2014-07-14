@ECHO off
set origin=%GOPATH%\src\github.com\ethereum\go-ethereum\ethereal
set target=%GOPATH%\pkg\ethereum\
set qtPath=C:\Qt\Qt5.2.1\5.2.1\mingw48_32
set mingwPath=C:\MingW\

ECHO "Setting up Windows binaries"

ECHO "Copying assets from %GOPATH%"
xcopy /s %origin%\assets %target%assets

ECHO "Compiling Ethereal"
cd %origin%
go install

ECHO "Copying to source folder"
copy %GOPATH%\bin\ethereal.exe %target%

ECHO "Running QT Deploy"
cd %target%
windeployqt --webkit2 --qmldir=assets\qml\ .

echo "Copy missing DLLs & Others"

copy %qtPath%\bin\QtWebProcess.exe %target%
copy %qtPath%\bin\Qt5MultimediaWidgets.dll %target%
copy %qtPath%\bin\Qt5PrintSupport.dll %target%
copy %qtPath%\bin\Qt5OpenGL.dll %target%

copy %qtPath%\bin\libgcc_s_dw2-1.dll %target%
copy "%qtPath%\bin\libstdc++-6.dll" %target%
copy %qtPath%\bin\libwinpthread-1.dll %target%

copy %mingwPath%\bin\libgmp-10.dll %target%

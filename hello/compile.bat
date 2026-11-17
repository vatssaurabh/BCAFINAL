@echo off
REM Set your Tomcat installation directory below if CATALINA_HOME is not set
if "%CATALINA_HOME%"=="" (
    set "TOMCAT_HOME=..\.."
) else (
    set "TOMCAT_HOME=%CATALINA_HOME%"
)

if not exist "WEB-INF\classes" mkdir "WEB-INF\classes"

echo Compiling HelloServlet.java using "%TOMCAT_HOME%\lib\servlet-api.jar"...
javac -cp "%TOMCAT_HOME%\lib\servlet-api.jar" -d "WEB-INF\classes" "src\HelloServlet.java"

if %ERRORLEVEL% EQU 0 (
    echo Compilation successful! Class file created at WEB-INF\classes\HelloServlet.class
) else (
    echo Compilation failed. Make sure this 'hello' folder is inside TOMCAT_HOME\webapps\ or set CATALINA_HOME.
)
pause

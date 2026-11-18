@echo off
REM Set Tomcat path (defaults to ..\.. when placed inside TOMCAT_HOME\webapps\loginapp)
if "%CATALINA_HOME%"=="" (
    set "TOMCAT_HOME=..\.."
) else (
    set "TOMCAT_HOME=%CATALINA_HOME%"
)

if not exist "WEB-INF\classes" mkdir "WEB-INF\classes"
if not exist "WEB-INF\lib" mkdir "WEB-INF\lib"

REM Check if MySQL JDBC Driver exists in WEB-INF\lib; if not, download it automatically
if not exist "WEB-INF\lib\mysql-connector-j-*.jar" (
    echo Downloading MySQL Connector/J JDBC driver into WEB-INF\lib...
    powershell -Command "Invoke-WebRequest -Uri 'https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.4.0/mysql-connector-j-8.4.0.jar' -OutFile 'WEB-INF\lib\mysql-connector-j-8.4.0.jar'"
)

echo Compiling Servlets and DBUtil using "%TOMCAT_HOME%\lib\servlet-api.jar"...
javac -cp "%TOMCAT_HOME%\lib\servlet-api.jar;WEB-INF\lib\*" -d "WEB-INF\classes" src\DBUtil.java src\LoginServlet.java src\LogoutServlet.java

if %ERRORLEVEL% EQU 0 (
    echo Compilation successful! Class files created in WEB-INF\classes\
) else (
    echo Compilation failed. Make sure this 'loginapp' folder is inside TOMCAT_HOME\webapps\
)
pause

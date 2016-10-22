@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  grails startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and GRAILS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-XX:+TieredCompilation" "-XX:TieredStopAtLevel=1" "-XX:CICompilerCount=3"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\dist\grails-shell-3.2.0.jar;%APP_HOME%\lib\org.codehaus.groovy\groovy\jars\groovy-2.4.7.jar;%APP_HOME%\lib\org.slf4j\slf4j-api\jars\slf4j-api-1.7.21.jar;%APP_HOME%\lib\org.slf4j\jcl-over-slf4j\jars\jcl-over-slf4j-1.7.21.jar;%APP_HOME%\dist\grails-bootstrap-3.2.0.jar;%APP_HOME%\dist\grails-gradle-model-3.2.0.jar;%APP_HOME%\lib\org.apache.ant\ant\jars\ant-1.9.4.jar;%APP_HOME%\lib\org.codehaus.groovy\groovy-ant\jars\groovy-ant-2.4.7.jar;%APP_HOME%\lib\org.codehaus.groovy\groovy-json\jars\groovy-json-2.4.7.jar;%APP_HOME%\lib\org.codehaus.groovy\groovy-jmx\jars\groovy-jmx-2.4.7.jar;%APP_HOME%\lib\org.fusesource.jansi\jansi\jars\jansi-1.11.jar;%APP_HOME%\lib\jline\jline\jars\jline-2.12.jar;%APP_HOME%\lib\org.gradle\gradle-tooling-api\jars\gradle-tooling-api-3.0.jar;%APP_HOME%\lib\org.springframework.boot\spring-boot-cli\jars\spring-boot-cli-1.4.0.RELEASE.jar;%APP_HOME%\lib\org.slf4j\slf4j-simple\jars\slf4j-simple-1.7.21.jar;%APP_HOME%\lib\org.codehaus.plexus\plexus-component-api\jars\plexus-component-api-1.0-alpha-33.jar;%APP_HOME%\lib\org.codehaus.groovy\groovy-xml\jars\groovy-xml-2.4.7.jar;%APP_HOME%\lib\org.codehaus.groovy\groovy-templates\jars\groovy-templates-2.4.7.jar;%APP_HOME%\lib\org.yaml\snakeyaml\jars\snakeyaml-1.14.jar;%APP_HOME%\lib\org.apache.ant\ant-launcher\jars\ant-launcher-1.9.4.jar;%APP_HOME%\lib\org.apache.ant\ant-antlr\jars\ant-antlr-1.9.4.jar;%APP_HOME%\lib\org.codehaus.groovy\groovy-groovydoc\jars\groovy-groovydoc-2.4.7.jar;%APP_HOME%\lib\org.apache.ant\ant-junit\jars\ant-junit-1.9.4.jar;%APP_HOME%\lib\org.springframework.boot\spring-boot-loader-tools\jars\spring-boot-loader-tools-1.4.0.RELEASE.jar;%APP_HOME%\lib\net.sf.jopt-simple\jopt-simple\jars\jopt-simple-4.6.jar;%APP_HOME%\lib\org.springframework\spring-core\jars\spring-core-4.3.2.RELEASE.jar;%APP_HOME%\lib\org.json\json\jars\json-20140107.jar;%APP_HOME%\lib\org.apache.maven\maven-aether-provider\jars\maven-aether-provider-3.2.1.jar;%APP_HOME%\lib\org.apache.maven\maven-settings-builder\jars\maven-settings-builder-3.1.1.jar;%APP_HOME%\lib\org.eclipse.aether\aether-api\jars\aether-api-1.0.2.v20150114.jar;%APP_HOME%\lib\org.eclipse.aether\aether-connector-basic\jars\aether-connector-basic-1.0.2.v20150114.jar;%APP_HOME%\lib\org.eclipse.aether\aether-impl\jars\aether-impl-1.0.2.v20150114.jar;%APP_HOME%\lib\org.eclipse.aether\aether-spi\jars\aether-spi-1.0.2.v20150114.jar;%APP_HOME%\lib\org.eclipse.aether\aether-transport-file\jars\aether-transport-file-1.0.2.v20150114.jar;%APP_HOME%\lib\org.eclipse.aether\aether-transport-http\jars\aether-transport-http-1.0.2.v20150114.jar;%APP_HOME%\lib\org.eclipse.aether\aether-util\jars\aether-util-1.0.2.v20150114.jar;%APP_HOME%\lib\org.codehaus.plexus\plexus-classworlds\jars\plexus-classworlds-1.2-alpha-10.jar;%APP_HOME%\lib\junit\junit\jars\junit-3.8.1.jar;%APP_HOME%\lib\org.apache.maven\maven-model\jars\maven-model-3.2.1.jar;%APP_HOME%\lib\org.apache.maven\maven-model-builder\jars\maven-model-builder-3.2.1.jar;%APP_HOME%\lib\org.apache.maven\maven-repository-metadata\jars\maven-repository-metadata-3.2.1.jar;%APP_HOME%\lib\org.codehaus.plexus\plexus-component-annotations\jars\plexus-component-annotations-1.5.5.jar;%APP_HOME%\lib\org.codehaus.plexus\plexus-utils\jars\plexus-utils-3.0.17.jar;%APP_HOME%\lib\org.codehaus.plexus\plexus-interpolation\jars\plexus-interpolation-1.19.jar;%APP_HOME%\lib\org.apache.maven\maven-settings\jars\maven-settings-3.1.1.jar;%APP_HOME%\lib\org.sonatype.plexus\plexus-sec-dispatcher\jars\plexus-sec-dispatcher-1.3.jar;%APP_HOME%\lib\org.apache.httpcomponents\httpclient\jars\httpclient-4.2.6.jar;%APP_HOME%\lib\org.sonatype.plexus\plexus-cipher\jars\plexus-cipher-1.4.jar;%APP_HOME%\lib\org.apache.httpcomponents\httpcore\jars\httpcore-4.2.5.jar;%APP_HOME%\lib\commons-codec\commons-codec\jars\commons-codec-1.6.jar

@rem Execute grails
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRAILS_OPTS%  -classpath "%CLASSPATH%" org.grails.cli.GrailsCli %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable GRAILS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%GRAILS_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega

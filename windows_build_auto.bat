

@echo off

set sw=%cd%

echo Generating jsoncpp projects

cd jsoncpp

mkdir build && cd build

cmake -G "Visual Studio 14 2015" %sw%\jsoncpp

echo Done generating projects

timeout 3

echo Generating libfunctionality projects

cd %sw%

cd libfunctionality

mkdir build && cd build

cmake -G "Visual Studio 14 2015" %sw%\libfunctionality

echo Done generating projects projects

timeout 3

echo Generating Opencv projects

cd %sw%

cd opencv

mkdir build && cd build

cmake -G "Visual Studio 14 2015" %sw%\opencv

echo Done generating projects projects

timeout 3

echo Generating OSVR-Core projects
cd %sw%

cd OSVR-Core

mkdir build && cd build

cmake -G "Visual Studio 14 2015" %sw%\OSVR-Core

echo Done generating projects projects

timeout 3

echo Generating OSVR-RenderManager

cd %sw%

cd OSVR-RenderManager

mkdir build && cd build

cmake -G "Visual Studio 14 2015" %sw%\OSVR-RenderManager

echo Done generating projects projects

timeout 3

echo Generating OSVR-Unity-Rendering

cd %sw%

cd OSVR-Unity-Rendering

mkdir build && cd build

cmake -G "Visual Studio 14 2015" %sw%\OSVR-Unity-Rendering

echo Done generating projects projects





timeout 3

echo Generating Gridraster plugin projects

cd %sw%

cd GridrasterSDKForGaming\example_src\client\projects\GridRasterPlugin\windows

mkdir build && cd build

cmake -G "Visual Studio 14 2015" %sw%\GridrasterSDKForGaming\example_src\client\projects\GridRasterPlugin\windows

echo Done generating projects projects

pause

echo All projects being built in Release mode

echo Building jsoncpp
msbuild %sw%\jsoncpp\build\jsoncpp.sln /p:Configuration=Release
echo Done building jsoncpp
timeout 3 

echo Building LibFunctionality
msbuild %sw%\libfunctionality\build\libfunctionality.sln /p:Configuration=Release
echo Done building LibFunctionality
timeout 3

echo Building Opencv
msbuild %sw%\opencv\build\OpenCV.sln /p:Configuration=Release
echo Done building OpenCV
timeout 3

echo Building OSVR-Core
msbuild %sw%\OSVR-Core\build\osvrcore.sln /p:Configuration=Release
echo Done building OSVR-Core
timeout 3

echo Building OSVR-RenderManager
msbuild %sw%\OSVR-RenderManager\build\osvrRenderManager.sln /p:Configuration=Release
echo Done building OSVR-RenderManager
timeout 3

echo Building OSVR-Unity-Rendering
msbuild %sw%\OSVR-Unity-Rendering\build\osvrUnityRenderingPlugin.sln /p:Configuration=Release
echo Done building OSVR-Unity-Rendering
timeout 3



echo Building Gridrasterplugin.sln
msbuild %sw%\GridrasterSDKForGaming\example_src\client\projects\GridRasterPlugin\windows\build\GridRasterPlugin.sln  /p:Configuration=Release
echo Done building Gridrasterplugin

echo Building GamingAnywhere solution
msbuild %sw%\GamingAnywhere\ga\vs2010\ga.sln /p:Configuration=Release
pause



echo copying server side dlls


echo copying Dlls to x86 plugins folder in palace_demo

copy %sw%\OSVR-Core\build\bin\Release\grClient.dll %sw%\palace_demo\Assets\Plugins\x86
copy %sw%\OSVR-Core\build\bin\Release\grClientKit.dll %sw%\palace_demo\Assets\Plugins\x86
copy %sw%\OSVR-Core\build\bin\Release\grCommon.dll %sw%\palace_demo\Assets\Plugins\x86
copy %sw%\OSVR-Core\build\bin\Release\grUtil.dll %sw%\palace_demo\Assets\Plugins\x86
copy %sw%\OSVR-RenderManager\build\bin\Release\grRenderManager.dll %sw%\palace_demo\Assets\Plugins\x86
copy %sw%\OSVR-Unity-Rendering\build\Release\grUnityRenderingPlugin.dll %sw%\palace_demo\Assets\Plugins\x86
copy %sw%\GridrasterSDKForGaming\example_src\client\projects\GridRasterPlugin\windows\build\Release\GridRasterPlugin.dll %sw%\palace_demo\Assets\Plugins\x86


echo copying Dlls to x86 plugin folder in GR_PLUGIN
copy %sw%\OSVR-Core\build\bin\Release\grClient.dll %sw%\GR_PLUGIN\Assets\Plugins\x86
copy %sw%\OSVR-Core\build\bin\Release\grClientKit.dll %sw%\GR_PLUGIN\Assets\Plugins\x86
copy %sw%\OSVR-Core\build\bin\Release\grCommon.dll %sw%\GR_PLUGIN\Assets\Plugins\x86
copy %sw%\OSVR-Core\build\bin\Release\grUtil.dll %sw%\GR_PLUGIN\Assets\Plugins\x86
copy %sw%\OSVR-RenderManager\build\bin\Release\grRenderManager.dll %sw%\GR_PLUGIN\Assets\Plugins\x86
copy %sw%\OSVR-Unity-Rendering\build\Release\grUnityRenderingPlugin.dll %sw%\GR_PLUGIN\Assets\Plugins\x86
copy %sw%\GridrasterSDKForGaming\example_src\client\projects\GridRasterPlugin\windows\build\Release\GridRasterPlugin.dll %sw%\GR_PLUGIN\Assets\Plugins\x86


echo copying osvr Dlls to osvr bin folder in palace_demo
copy %sw%\OSVR-Core\build\bin\gr-plugins-0\Release\com_gridraster_Tracker.dll %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\gr-plugins-0\Release
copy %sw%\OSVR-Core\build\bin\Release\grCommon.dll %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grConnection.dll %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grPluginHost.dll %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grPluginKit.dll %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grServer.dll %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grUtil.dll %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\functionality.dll %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\gr_server_config.json %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\gr-server.exe %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release

echo copying osvr Dlls to osvr bin folder in GR_PLUGIN
copy %sw%\OSVR-Core\build\bin\gr-plugins-0\Release\com_gridraster_Tracker.dll %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\gr-plugins-0\Release
copy %sw%\OSVR-Core\build\bin\Release\grCommon.dll %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grConnection.dll %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grPluginHost.dll %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grPluginKit.dll %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grServer.dll %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\grUtil.dll %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\functionality.dll %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\gr_server_config.json %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release
copy %sw%\OSVR-Core\build\bin\Release\gr-server.exe %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\bin\Release

echo copying GA related Dlls to palacedemo
copy %sw%\GamingAnywhere\GR-Server %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server
echo All
copy %sw%\GamingAnywhere\GR-Server\mod %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\mod
echo All
copy %sw%\GamingAnywhere\GR-Server\data %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\data
echo All
copy %sw%\GamingAnywhere\GR-Server\config %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\config
echo All
copy %sw%\GamingAnywhere\GR-Server\config\common %sw%\palace_demo\Assets\GridRasterPlugin\Resources\GR-Server\config\common
echo All


echo copying GA related Dlls to GR_PLUGIN
copy %sw%\GamingAnywhere\GR-Server %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server
echo All
copy %sw%\GamingAnywhere\GR-Server\mod %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\mod
echo All
copy %sw%\GamingAnywhere\GR-Server\data %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\data
echo All
copy %sw%\GamingAnywhere\GR-Server\config %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\config
echo All
copy %sw%\GamingAnywhere\GR-Server\config\common %sw%\GR_PLUGIN\Assets\GridRasterPlugin\Resources\GR-Server\config\common
echo All

pause
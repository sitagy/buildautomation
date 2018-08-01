sw=$(pwd)

read -p "Want to build cmake files?  Press y to build the cmake files or n to build Visual Studio projects and then ENTER   " answer


case ${answer:0:1} in
    y|Y )
	echo "Generating projects with CMAKE generator Visual Studio 14"

	echo "Generating jsoncpp project"
	cd jsoncpp
	mkdir build 
	cd build
	cmake -G "Visual Studio 14 2015" $sw/jsoncpp
	echo "Done generating jsoncpp project"

	sleep 3

	echo "Generating libfunctionality project"
	cd $sw
	cd libfunctionality	
	mkdir build  
	cd build
	cmake -G "Visual Studio 14 2015" $sw/libfunctionality
	echo "Done generating libfunctionality project"

	sleep 3

	echo "Generating Opencv project"
	cd $sw
	cd opencv
	mkdir build  
	cd build
	cmake -G "Visual Studio 14 2015" $sw/opencv
	echo "Done generating opencv project"

	sleep 3

	echo "Generating OSVR-Core project"
	cd $sw
	cd OSVR-Core
	mkdir build 
	cd build
	cmake -G "Visual Studio 14 2015" $sw/OSVR-Core
	echo "Done generating OSVR-Core project"

	sleep 3

	echo "Generating OSVR-RenderManager project"
	cd $sw
	cd OSVR-RenderManager
	mkdir build 
	cd build
	cmake -G "Visual Studio 14 2015" $sw/OSVR-RenderManager
	echo "Done generating OSVR-RenderManager project"

	sleep 3

	echo "Generating OSVR-Unity-Rendering project"
	cd $sw
	cd OSVR-Unity-Rendering
	mkdir build 
	cd build
	cmake -G "Visual Studio 14 2015" $sw/OSVR-Unity-Rendering
	echo "Done generating OSVR-Unity-Rendering project"

	sleep 3

	echo "Generating Gridraster plugin project"
	cd $sw
	cd GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/windows
	mkdir build  
	cd build
	cmake -G "Visual Studio 14 2015" $sw/GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/windows
	echo "Done generating Gridraster plugin projects"

	;;
	* )
        echo "Skipping building cmake files"		
    ;;
esac

echo "Choose from following options"
echo "Press A to build All"
echo "Press 1 to build jsoncpp"
echo "Press 2 to build libfunctionality"
echo "Press 3 to build opencv"
echo "Press 4 to build OSVR-Core"
echo "Press 5 to build OSVR-RenderManager"
echo "Press 6 to build OSVR-Unity-Rendering"
echo "Press 7 to build GridrasterPlugin"
echo "Press 8 to build GamingAnywhere"
echo "Press E to exit"


while :
do
	read -p "Choose option or E to exit " answer1
	case $answer1 in
	A|a) 
		echo "Building All Projects in Release Mode"
		echo "Building jsoncpp"
		msbuild.exe "$sw/jsoncpp/build/jsoncpp.sln" /p:Configuration=Release
		echo "Done building jsoncpp"
		sleep 3 

		echo "Building LibFunctionality"
		msbuild.exe $sw/libfunctionality/build/libfunctionality.sln /p:Configuration=Release
		echo "Done building LibFunctionality"
		sleep 3

		echo "Building Opencv"
		msbuild.exe $sw/opencv/build/OpenCV.sln /p:Configuration=Release
		echo "Done building OpenCV"
		sleep 3

		echo "Building OSVR-Core"
		msbuild.exe $sw/OSVR-Core/build/osvrcore.sln /p:Configuration=Release
		echo "Done building OSVR-Core"
		sleep 3

		echo "Building OSVR-RenderManager"
		msbuild.exe $sw/OSVR-RenderManager/build/osvrRenderManager.sln /p:Configuration=Release
		echo "Done building OSVR-RenderManager"
		sleep 3

		echo "Building OSVR-Unity-Rendering"
		msbuild.exe $sw/OSVR-Unity-Rendering/build/osvrUnityRenderingPlugin.sln /p:Configuration=Release
		echo "Done building OSVR-Unity-Rendering"
		sleep 3

		echo "Building Gridrasterplugin.sln"
		msbuild.exe $sw/GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/windows/build/GridRasterPlugin.sln  /p:Configuration=Release
		echo "Done building Gridrasterplugin"
		sleep 3

		echo "Building GamingAnywhere solution"
		msbuild.exe $sw/GamingAnywhere/ga/vs2010/ga.sln /p:Configuration=Release
		echo "Done building GamingAnywhere"
		;;
	1) 
		echo "Building jsoncpp in Release mode"
		msbuild.exe $sw/jsoncpp/build/jsoncpp.sln /p:Configuration=Release
		echo "Done building jsoncpp"
		sleep 3 
		
		;;
	2)
		echo "Building LibFunctionality"
		msbuild.exe $sw/libfunctionality/build/libfunctionality.sln /p:Configuration=Release
		echo "Done building LibFunctionality"
		sleep 3
		
		;;
	3)
		echo "Building Opencv"
		msbuild.exe $sw/opencv/build/OpenCV.sln /p:Configuration=Release
		echo "Done building OpenCV"
		sleep 3
		;;
	4) 
		echo "Building OSVR-Core"
		msbuild.exe $sw/OSVR-Core/build/osvrcore.sln /p:Configuration=Release
		echo "Done building OSVR-Core"
		sleep 3
		;;
	5)  
		echo "Building OSVR-RenderManager"
		msbuild.exe $sw/OSVR-RenderManager/build/osvrRenderManager.sln /p:Configuration=Release
		echo "Done building OSVR-RenderManager"
		sleep 3
		;;
	6) 
		echo "Building OSVR-Unity-Rendering"
		msbuild.exe $sw/OSVR-Unity-Rendering/build/osvrUnityRenderingPlugin.sln /p:Configuration=Release
		echo "Done building OSVR-Unity-Rendering"
		sleep 3
		;;
	7)
		echo "Building Gridrasterplugin.sln"
		msbuild.exe $sw/GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/windows/build/GridRasterPlugin.sln  /p:Configuration=Release
		echo "Done building Gridrasterplugin"
		sleep 3
		;;
	8)
		echo "Building GamingAnywhere solution"
		msbuild.exe $sw/GamingAnywhere/ga/vs2010/ga.sln /p:Configuration=Release
		echo "Done building GamingAnywhere"
		;;
		
	E|e)
		echo "E"
		break
		;;
	esac

done


echo "coping server side dlls"


echo "coping Dlls to x86 plugins folder in palace_demo"

cp $sw/OSVR-Core/build/bin/Release/grClient.dll $sw/palace_demo/Assets/Plugins/x86
cp $sw/OSVR-Core/build/bin/Release/grClientKit.dll $sw/palace_demo/Assets/Plugins/x86
cp $sw/OSVR-Core/build/bin/Release/grCommon.dll $sw/palace_demo/Assets/Plugins/x86
cp $sw/OSVR-Core/build/bin/Release/grUtil.dll $sw/palace_demo/Assets/Plugins/x86
cp $sw/OSVR-RenderManager/build/bin/Release/grRenderManager.dll $sw/palace_demo/Assets/Plugins/x86
cp $sw/OSVR-Unity-Rendering/build/Release/grUnityRenderingPlugin.dll $sw/palace_demo/Assets/Plugins/x86
cp $sw/GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/windows/build/Release/GridRasterPlugin.dll $sw/palace_demo/Assets/Plugins/x86


echo "coping Dlls to x86 plugin folder in GR_PLUGIN"
cp $sw/OSVR-Core/build/bin/Release/grClient.dll $sw/GR_PLUGIN/Assets/Plugins/x86
cp $sw/OSVR-Core/build/bin/Release/grClientKit.dll $sw/GR_PLUGIN/Assets/Plugins/x86
cp $sw/OSVR-Core/build/bin/Release/grCommon.dll $sw/GR_PLUGIN/Assets/Plugins/x86
cp $sw/OSVR-Core/build/bin/Release/grUtil.dll $sw/GR_PLUGIN/Assets/Plugins/x86
cp $sw/OSVR-RenderManager/build/bin/Release/grRenderManager.dll $sw/GR_PLUGIN/Assets/Plugins/x86
cp $sw/OSVR-Unity-Rendering/build/Release/grUnityRenderingPlugin.dll $sw/GR_PLUGIN/Assets/Plugins/x86
cp $sw/GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/windows/build/Release/GridRasterPlugin.dll $sw/GR_PLUGIN/Assets/Plugins/x86


echo "coping osvr Dlls to osvr bin folder in palace_demo"
cp $sw/OSVR-Core/build/bin/gr-plugins-0/Release/com_gridraster_Tracker.dll $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/gr-plugins-0/Release
cp $sw/OSVR-Core/build/bin/Release/grCommon.dll $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grConnection.dll $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grPluginHost.dll $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grPluginKit.dll $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grServer.dll $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grUtil.dll $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/functionality.dll $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/gr_server_config.json $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/gr-server.exe $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release

echo "coping osvr Dlls to osvr bin folder in GR_PLUGIN"
cp $sw/OSVR-Core/build/bin/gr-plugins-0/Release/com_gridraster_Tracker.dll $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/gr-plugins-0/Release
cp $sw/OSVR-Core/build/bin/Release/grCommon.dll $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grConnection.dll $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grPluginHost.dll $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grPluginKit.dll $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grServer.dll $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/grUtil.dll $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/functionality.dll $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/gr_server_config.json $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release
cp $sw/OSVR-Core/build/bin/Release/gr-server.exe $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/bin/Release

echo "coping GA related Dlls to palacedemo"
cp $sw/GamingAnywhere/GR-Server $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server
cp $sw/GamingAnywhere/GR-Server/mod $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/mod
cp $sw/GamingAnywhere/GR-Server/data $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/data
cp $sw/GamingAnywhere/GR-Server/config $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/config
cp $sw/GamingAnywhere/GR-Server/config/common $sw/palace_demo/Assets/GridRasterPlugin/Resources/GR-Server/config/common



echo "coping GA related Dlls to GR_PLUGIN"
cp $sw/GamingAnywhere/GR-Server $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server
cp $sw/GamingAnywhere/GR-Server/mod $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/mod
cp $sw/GamingAnywhere/GR-Server/data $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/data
cp $sw/GamingAnywhere/GR-Server/config $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/config
cp $sw/GamingAnywhere/GR-Server/config/common $sw/GR_PLUGIN/Assets/GridRasterPlugin/Resources/GR-Server/config/common




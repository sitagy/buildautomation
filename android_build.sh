sw=$(pwd)
echo "Enter the location of Android NDK (android-ndk-r10e, where ndk build is present)"
read -r ndk


read -p "Want to build LIVE-555?  Press y or n and then ENTER   " answer
case ${answer:0:1} in
    y|Y )	
	
	cd $sw/LIVE-555
	echo ""
	sleep 1
	echo building live555 for Android
	$ndk/ndk-build
	echo ""
	read -p "If everything looks okay, press ENTER to continue otherwise press Ctrl+C to quit ....."
	
	sleep 2
	echo ""
	echo copying *.a libs to /sw/GridrasterSDKForGaming/3rdparty/android/live555/lib/armeabi-v7a/
	cp $sw/LIVE-555/obj/local/armeabi-v7a/*.a $sw/GridrasterSDKForGaming/3rdparty/android/live555/lib/armeabi-v7a/.
	;;
	* )
        echo skipping build step for live555		
    ;;
esac

read -n1 -r -p " After copying Press any key to continue..." key

echo ""
read -p "Want to build GridrasterSDKForGaming ?  Note that you WILL have to build this if you've made changes to live555. Press y or n and then ENTER   " answer
case ${answer:0:1} in
    y|Y )
		
		
		echo Changing directory to  $sw/GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/android/adt
		cd  $sw/GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/android/adt
		echo ""
		sleep 1

		echo building libGridRasterPlugin.so for Android Unity Plugin
		$ndk/ndk-build
		echo ""
		read -p "If everything looks okay, press ENTER to continue otherwise press Ctrl+C to quit ....."
		
		sleep 2
		echo ""
		echo copying libGridRasterPlugin.so that has been just generated to DayDream project $sw/DaydreamClient/install/lib/gridraster/
		
		cp  $sw/GridrasterSDKForGaming/example_src/client/projects/GridRasterPlugin/android/adt/libs/armeabi-v7a/libGridRasterPlugin.so $sw/DaydreamClient/install/lib/gridraster/.
		echo Also copy the libGridRasterInput.so and libGridRasterUnityPlugin.so that has been just generated to osvr-android-build/src/
	;;
	* )
        echo skipping build step for GridrasterSDKForGaming		
    ;;
esac

echo ""
echo Manually build the osvr-android-build on a linux machine after copying the libGridRasterInput.so and libGridRasterUnityPlugin.so that has been just generated to osvr-android-build/src/
echo ""
echo Follow the instructions on build page to build the osvr-android-build
sleep 2
echo ""
echo After building osvr-android-build, copy osvr-android-build/build/install/lib/libgrRenderManager.so to $sw/DaydreamClient/install/lib/.
sleep 2
echo Also copy osvr-android-build/build/install/lib/gr-plugins-0/libcom_gr_android_sensorTracker.so to $sw/DaydreamClient/install/lib/gr-plugins-0/
sleep 2
echo ""
read -n1 -r -p " After copying Press any key to build the apk..." key
echo Building apk
cd $sw/DaydreamClient/GRClient
sed -i.bak 's/\r$//' gradlew
./gradlew assembleDebug

echo Done
 

read -n1 -r -p " After building connect the pixel device to the system and  press any key to push the apk to pixel phone.." key
cd $sw/DaydreamClient/GRClient/app/build/outputs/apk
adb install app-fat-debug.apk

echo Done




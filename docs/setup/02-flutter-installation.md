# Flutter Installation and Setup

Flutter is an open-source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.

Let's see how we can download/install flutter and setup in our system. Note that we have different ways to set up and download flutter for different operating systems like,

- Windows
- macOS
- Linux

# Prerequisite
1. Android Studio should have been installed and setup.
2. In case setting up through github via `git` command, git must have been installed and setup in the system. [Download GIT from here](https://git-scm.com/downloads) for your operating system. 


# Let's get started

# 1. Windows Install and Setup
1. Head over to [Flutter windows download](https://docs.flutter.dev/get-started/install/windows)
2. Download the latest Flutter version zip file
3. Extract the zip file and place the contained flutter in the desired installation location for the Flutter SDK (for example, C:\flutter).
>Please do not extract the flutter zip file inside other folders in the C drive like `C:\Program Files\flutter` 
4.  `C:\flutter\bin` this bin (binary folder) path needs to be added in the environment variables
5.  So click on start button and search for `edit the system environment variables`. Click on the very first result
6.  A popup will open -> click on the `Environment Variables...` button
7.  Another popup will open and find `path` variable under `system variables`
8.  Double click on `path` then new popup will open
9.  Click on `new` button on the pop
10.  paste the `bin` folder path in the field (eg. `C:\flutter\bin`)
11.  Click `ok` on all popups and close all popups
12.  To verify we have successfully added bin folder in the environment open cmd or PowerShell and type `flutter --version` you could see the output something like this
```
Flutter 2.10.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 7e9793dee1 (4 months ago) • 2022-03-02 11:23:12 -0600
Engine • revision bd539267b4
Tools • Dart 2.16.1 • DevTools 2.9.2
```
13. Run the`flutter doctor` command to see if there are any issues with the flutter development or not (an example output of the command given below)
```
[√] Flutter (Channel stable, 2.10.3, on Microsoft Windows [Version 10.0.22000.739], locale en-IN)
[√] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
[√] Chrome - develop for the web
[X] Visual Studio - develop for Windows
    X Visual Studio not installed; this is necessary for Windows development.
      Download at https://visualstudio.microsoft.com/downloads/.
      Please install the "Desktop development with C++" workload, including all of its default components
[√] Android Studio (version 2020.3)
[√] VS Code (version 1.68.1)
[√] Connected device (3 available)
[√] HTTP Host Availability

! Doctor found issues in 1 category.
```

Here visual studio is giving the issue that, to do Windows development, we need to install [visual studio](https://visualstudio.microsoft.com/). If you are not doing windows development you can turn off that from `flutter config` command or you can simply ignore this issue found by flutter.

Now at first, you will need to accept the android toolchain licenses. So after installing the flutter and running `flutter doctor` command for the first time you will see the cross (error) sign in front of this line 

```
[X] Android toolchain - Android licenses not accepted (Android SDK version 31.0.0)
```

Make sure to run this command to accept all the licenses `flutter doctor --android-licenses`. Type `y` and hit enter to accept every license.

14. Again run `flutter doctor` command to check if all licenses are accepted or not. Now we should be seeing the completed icon in front of every line line.
15. It might show an extension issue, for visual studio code (VScode) and Android Studio you can download `flutter` and `dart` extensions from the extensions tab.

# 2. macOS Install and setup
1. Head over to [Flutter MacOS Download](https://docs.flutter.dev/get-started/install/macos)
2. For Intel chip Mac and Apple Silicon chip Mac there are two different zip files for flutter. Download that zip file that your system supports (eg. for Intel Mac download `intel-flutter-zip`)
3. To manage all the development stuff you can create a new folder in your `home` directory of pc by `mkdir development`
4. Change your current working directory to development `cd development`
5. Unzip downloaded zip file `unzip ~/Downloads/{zip-file-name}`
6. Now add flutter bin path to system path ```export PATH="$PATH:`pwd`/flutter/bin"```. 
>Make sure you are in the `development` folder to successfully run this `export` command
7. To make sure flutter is installed properly run `flutter --version`
```
Flutter 2.10.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 7e9793dee1 (4 months ago) • 2022-03-02 11:23:12 -0600
Engine • revision bd539267b4
Tools • Dart 2.16.1 • DevTools 2.9.2
```
>Note that here my current flutter version is 2.10.3 at the time of writing this document. But it might be different in your system while installing the latest flutter version from the website

>For iOS development on flutter, along with flutter we need to have the XCODE also downloaded from this link [Download XCode](https://developer.apple.com/xcode/)

8. After installing and setting up Xcode, run `flutter doctor` command to make sure everything is installed properly.
9. You might see issues in the android toolchain licenses, to accept those run `flutter doctor --android-licenses` command and type `y` and hit enter to accept those licenses.
10. For extension issues in `flutter doctor`, from the Android Studio or VScode download `flutter` and `dart` extensions from the extensions tab.

# 3. Linux Install and setup
There are two ways to download and install flutter in Linux. 
- [Snap Store](https://snapcraft.io/docs/installing-snapd)
1. If you don't have snap installed in the Linux system, install that first
2. After installing snap, run `sudo snap install flutter --classic`
3. run `flutter --version` command to check if flutter is installed

- Download Compressed file [Flutter Linux download](https://docs.flutter.dev/get-started/install/linux)
1. Download the following installation bundle to get the latest stable release of the Flutter SDK:
Extract the file in the desired location, for example:
2. Create a development folder to your home directory `mkdir development`
3. Change working directory to development `cd ~/development`
4. Extract the downloaded compressed file in the development folder `tar xf ~/Downloads/flutter_linux_3.0.2-stable.tar.xz`

>Now we permanently need to add Flutter to path.

5. Determine the path of your extracted Flutter SDK. (eg. `~/develpoment/flutter/bin`)
6. Open (or create) the `.rc` file for your shell. For example, Linux uses the Bash shell by default, so edit $HOME/.bashrc (in text editor or you can use `nano {filename}` command to edit in terminal). If you are using a different shell, the file path and filename will be different on your machine.
7. Add the following line to the file `export PATH="$PATH:[PATH_OF_FLUTTER_DIRECTORY]/bin"`
8. Run `source $HOME/.<rc file>` to refresh the current window, or open a new terminal window to automatically source the file.
9. Run `flutter doctor` to identify the issues
10. You might see issues in the android tool chain licenses, to accept those run `flutter doctor --android-licenses` command and type `y` and hit enter to accept those licenses.
11. For extension issue in `flutter doctor`, from the Android Studio or VScode download `flutter` and `dart` extension from the extensions tab.

# Wrap Up
While installing and setting up the flutter you may end up to some path or java or any other unknown errors, you can simply google search those errors, may be StackOverflow or the community out there is also facing the same issue and they might have the solution to that particular problem. If they don't have any solution, maybe they want you to fix that error :)

# Useful and Reference Links
- https://flutter.dev/
- https://developer.android.com/studio
- https://git-scm.com/downloads
- https://developer.apple.com/
- https://docs.flutter.dev/
- https://developer.apple.com/xcode/
- https://github.com/flutter
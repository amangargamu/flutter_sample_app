
# Flutter Code Formatting

```  Needs basic Dart and Flutter knowledge  ```

- Android Studio, IntelliJ and Visual Studio Code are the most used IDEs for the Flutter framework and have plugins that support automatic code formatting 

#### Automatically formatting code in Android Studio and IntelliJ

Install the Dart plugin to get automatic formatting of code in Android Studio and IntelliJ. To automatically format your code in the current source code window, use Cmd+Alt+L (on Mac) or Ctrl+Alt+L (on Windows and Linux). Android Studio and IntelliJ also provide a check box named Format code on saving on the Flutter page in Preferences (on Mac) or Settings (on Windows and Linux) which will format the current file automatically when you save it.

#### Automatically formatting code in VS Code

Install the Flutter extension to get automatic formatting of code in VS Code.

To automatically format the code in the current source code window, right-click in the code window and select Format Document. You can add a keyboard shortcut to this VS Code Preferences.

To automatically format code whenever you save a file, set the `editor.formatOnSave` setting to `true`

#### Using trailing commas

Flutter code often involves building fairly deep tree-shaped data structures, for example in a build method. To get good automatic formatting, we recommend you adopt the optional trailing commas. The guideline for adding a trailing comma is simple: *Always add a trailing comma at the end of a parameter list in functions, methods, and constructors where you care about keeping the formatting you crafted.* This helps the automatic formatter to insert an appropriate amount of line breaks for Flutter-style code.

Code formatted with trailing commas looks like this: 
![Code formatted with trailing commas](https://docs.flutter.dev/assets/images/docs/tools/android-studio/trailing-comma-with.png)

And the one with trailing commas looks like this: 
![Code formatted without trailing commas](https://docs.flutter.dev/assets/images/docs/tools/android-studio/trailing-comma-without.png)

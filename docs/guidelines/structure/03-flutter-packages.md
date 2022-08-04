# Packages
**Packages!** The code that is written and maintained by other developers out there in the flutter community. Packages are not only specific to the Flutter, in fact in almost every framework or language we use packages. Like we have https://pub.dev for dart and flutter packages, and also have https://pypi.org for python packages. We can also create packages, that can increase the modularity of the whole project. Okay! enough theories, now let's jump into some popular and useful packages of Dart and Flutter that we most frequently use in our development on daily basis.

### Packages in Flutter
There is `pubspec.yaml` in the root of every flutter project. (Read more about `yaml` here https://yaml.org/spec/1.2.2/). The basic structure of this `.yaml` file is like,
```
name: <name of the project>
description: <description of the project>
version: <version of project>
publish_to: <if the package is to be published on pub.dev> {default: none}

environment: <flutter/dart environment details>
  sdk: <sdk version range that this project supports or developed on>

dependencies: <under this section we mention packages from remote or local>
  flutter:       # Required for every Flutter project
    sdk: flutter # Required for every Flutter project

  cupertino_icons: <latest_version_number>  # Only required if you use Cupertino (iOS style) icons

dev_dependencies: <We write developer-specific dependencies which will not be compiled at the time of building build. eg. Specify code generation library like build_runner under this section because we are not using any of their classes or methods inside our code>

  flutter_test:
    # Required for a Flutter project that includes tests
    sdk: flutter 

flutter:
  # Required if you use the Material icon font
  uses-material-design: true 

  assets:
    # Lists assets, such as image files
    - images/a_dot_burr.jpeg
    - images/a_dot_ham.jpeg

  fonts:
    # Required if your app uses custom fonts
    - family: Schyler
      fonts:
        - asset: fonts/Schyler-Regular.ttf
        - asset: fonts/Schyler-Italic.ttf
          style: italic
    - family: Trajan Pro
      fonts:
        - asset: fonts/TrajanPro.ttf
        - asset: fonts/TrajanPro_Bold.ttf
          weight: 700
```
>Here below an example of what an actual `pubspec.yaml` file looks like,

```
name: humanity_health
description: A new Flutter project.
version: 1.0.6+6
publish_to: none

environment:
  sdk: ">=2.14.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  bloc: ^7.2.1
  flutter_bloc: ^7.3.3
  intl: ^0.17.0
  equatable: ^2.0.0
  smooth_page_indicator: ^1.0.0+2
  better_player: ^0.0.81
  image_picker: ^0.8.4+6
  google_place: ^0.4.6
  webview_flutter: ^3.0.4
  percent_indicator: ^4.0.0
  image_cropper: ^1.5.0

  #project internal repos
  app_ui:
    path: packages/app_ui
  api_controller:
    path: packages/api_controller
  auth_repository:
    path: packages/auth_repository

  repository:
    path: packages/repository
  timeago: ^3.2.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  bloc_test: ^8.5.0
  mocktail: ^0.2.0
  very_good_analysis: 2.1.0

flutter:
  uses-material-design: true
  generate: true

  assets:
    - .env_dev
    - .env_prod
    - .env_staging

  fonts:
    - family: Inter
      fonts:
        - asset: packages/app_ui/assets/fonts/Inter-Regular.ttf
          weight: 400
        - asset: packages/app_ui/assets/fonts/Inter-Medium.ttf
          weight: 500
        - asset: packages/app_ui/assets/fonts/Inter-SemiBold.ttf
          weight: 600
        - asset: packages/app_ui/assets/fonts/Inter-Bold.ttf
          weight: 700
    - family: P22Mackinac
      fonts:
        - asset: packages/app_ui/assets/fonts/P22Mackinac-Medium.otf
          weight: 500
        - asset: packages/app_ui/assets/fonts/P22Mackinac-Bold.otf
          weight: 700
```
### How to add packages in project?
##### 1. Manually via `pubspec.yaml`
- Head over to https://pub.dev and search for `bloc`
![Image](https://i.im.ge/2022/07/04/uhQB1Y.png)
- By clicking on the very first result we can see the page like this,
![Image](https://i.im.ge/2022/07/04/uhTRDP.png)
- Here we can see the version number as `8.0.3`. It is currently the latest available version (may change in the future also). To add any specific older version you can see the `Changelog` tab.
- By adding the `name_of_package: <version>` under the `dependencies` or `dev_dependencies` section.
- Example add, `bloc: ^8.0.3` in `pubspec.yaml`

##### 2. Via command line (**Recommended**)
- It will directly edit the `pubspec.yaml` file and add the package in sorted order and with the most resolvable version :)
- For Dart open the terminal and run this command to add 
`dart pub add <package_name>`
Example: `dart pub add bloc`
- For Flutter open the terminal and run this command to add 
`flutter pub add <package_name>`
Example: `flutter pub add google_fonts`
- After that run `flutter pub get` to get the added packages

### Popular and Useful Packages
1. [bloc](https://pub.dev/packages/bloc)
2. [flutter_bloc](https://pub.dev/packages/flutter_bloc)
> Bloc official documentation, https://bloclibrary.dev/#/
3. [intl](https://pub.dev/packages/intl)
4.  [equatable](https://pub.dev/packages/equatable)
5.  [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)
6.  [better_player](https://pub.dev/packages/better_player)
7.  [image_picker](https://pub.dev/packages/image_picker)
8. [google_place](https://pub.dev/packages/google_place)
9. [webview_flutter](https://pub.dev/packages/webview_flutter)
10. [percent_indicator](https://pub.dev/packages/percent_indicator)
11. [video_player](https://pub.dev/packages/video_player)
12. [video_thumbnail](https://pub.dev/packages/video_thumbnail)
13. [path_provider](https://pub.dev/packages/path_provider)
14. [http](https://pub.dev/packages/http)
15. [url_launcher](https://pub.dev/packages/url_launcher)
16. [visibility_detector](https://pub.dev/packages/visibility_detector)
17. [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
18. [image_cropper](https://pub.dev/packages/image_cropper)
19. [flutter_svg](https://pub.dev/packages/flutter_svg)
20. [shimmer](https://pub.dev/packages/shimmer)
21. [cached_network_image](https://pub.dev/packages/cached_network_image)
22. [shared_preferences](https://pub.dev/packages/shared_preferences)
23. [flutter_spinkit](https://pub.dev/packages/flutter_spinkit)
24. [provider](https://pub.dev/packages/provider)
25. [url_launcher](https://pub.dev/packages/url_launcher)
26. [dartz](https://pub.dev/packages/dartz)
27. [dio](https://pub.dev/packages/dio)
28. [freezed_annotation](https://pub.dev/packages/freezed_annotation)
29. [json_serializable](https://pub.dev/packages/json_serializable)
30. [mime_type](https://pub.dev/packages/mime_type)
31. [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger)

## Conclusion
Yes, packages are good! But every coin has two sides. Software with too many dependencies is not a good thought. Also, suppose in the future the developers of your currently used packages don't support any updates after a specific version, then your software may start showing some failure states. So be wise while adding packages :) 

## Bonus - FlutterGems
In case you are not able to find best package for your specific need, flutter gems might help you in that case. They have categorized packages in different categories :)
[Flutter Gems official website](https://fluttergems.dev/)

## Reference and Useful Links
- https://fluttergems.dev/
- https://pub.dev/
- https://pypi.org/
- https://yaml.org/spec/1.2.2/
- https://docs.flutter.dev/


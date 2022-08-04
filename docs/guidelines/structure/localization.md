## Localization

App localization is where a developer adds multiple languages to an application to cater to users
speaking different languages. This project relies
on [flutter_localizations][flutter_localizations_link] and follows
the [official internationalization guide for Flutter][internationalization_link]. The
flutter_localizations package provides several localization options for various widgets.

## Prerequisites

1. An understanding of the Flutter framework and Dart programming language.
2. [Flutter SDK](https://flutter.dev/) installed on your computer.
3. [Android Studio](https://developer.android.com/studio),
   or [VS Code](https://code.visualstudio.com/download) installer. Now organize your folders and
   files as shown below:

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   ├── app_hi.arb
│   │   ├── app_mr.arb
│   ├── l10n.dart
```

### Adding dependencies

Add [flutter_localizations](https://pub.dev/packages/localization) in your `pubspec.yaml` file

```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations: # Add this line
    sdk: flutter         # Add this line
```

### Add delegate

Add delegate in `app.dart` for init locale of all widgets

```
MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SplashPage(),
      );
```

### Customize locale by your own

Add dependency “init” and “generate” in “pubspec.yaml” with the following content:

```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.17.0 # Add this line
flutter:
  generate: true # Add this line
 ```

### Create file l10n

1. Create l10n file in “lib/l10n.yaml” with the following content

```
arb-dir: lib/l10n/arb
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

2. Create l10n file in lib/l10n/l10n.dart with following content

```
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
```

### Adding Strings

1. To add a new localized string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:humanity_health/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include
the new locale.

```xml

<key>CFBundleLocalizations
    <array>
        <string>en</string>
    </array>
</key>
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └──
```

2. Add the translated strings to each `.arb` file:
   `app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html

[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
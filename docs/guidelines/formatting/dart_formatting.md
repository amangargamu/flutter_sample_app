# Dart formatting

The primary language used in the Flutter framework is Dart. [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines are the best place to start with formatting rules for Dart

## Effective Dart

Effective Dart guidelines consist of two overarching themes: 

- **Be consistent.** When it comes to things like formatting, and casing, arguments about which is better are subjective and impossible to resolve. What we do know is that being _consistent_ is objectively helpful.
- **Be brief.** Dart was designed to be familiar, so it inherits many of the same statements and expressions as C, Java, JavaScript and other languages. But we created Dart because there is a lot of room to improve on what those languages offer. We added a bunch of features, from string interpolation to initializing formals, to help you express your intent more simply and easily.

Effective dart guidelines have been divided further into sections: 
### Effective Dart: Style
#### Types
- In Dart, types are named using `UpperCamelCase`
- Classes, enum types, typedefs, and type parameters should capitalize the first letter of each word (including the first word), and use no separators.
````
class SliderMenu { ... }

class HttpRequest { ... }

typedef Predicate<T> = bool Function(T value);
````
If the annotation class’s constructor takes no parameters, you might want to create a separate `lowerCamelCase` constant for it.
```
const foo = Foo();

@foo
class C { ... }
```
#### Extensions
- Extensions are named using `UpperCamelCase`
- Like types, [extensions](https://dart.dev/guides/language/extension-methods) should capitalize the first letter of each word (including the first word), and use no separators.
```
extension MyFancyList<T> on List<T> { ... }

extension SmartIterable<T> on Iterable<T> { ... }
```
#### Libraries, packages, directories, and source files
- Libraries, packages, directories, and source files are named using `lowercase_with_underscores`
```
library peg_parser.source_scanner;

import 'file_system.dart';
import 'slider_menu.dart';
```
#### Import prefixes
- Import prefixes are named using `lowerCamelCase`
```
var count = 3;

HttpRequest httpRequest;

void align(bool clearItems) {
  // ...
}
```
#### Constant names
- PREFER using  `lowerCamelCase`  for constant names, including enum values
```
const pi = 3.14;
const defaultTimeout = 1000;
final urlScheme = RegExp('^([a-z]+):');

class Dice {
  static final numberGenerator = Random();
}
```
#### Ordering
- We have a prescribed order that directives should appear in. Each “section” should be separated by a blank line
- Place “dart:” imports before other imports
```
import 'dart:async';
import 'dart:html';

import 'package:bar/bar.dart';
import 'package:foo/foo.dart';
```
- Place “package:” imports before relative imports
```
import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'util.dart';
```
- Specify exports in a separate section after all imports
```
import 'src/error.dart';
import 'src/foo_bar.dart';

export 'src/error.dart';
```
- Sort sections alphabetically
```
import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'foo.dart';
import 'foo/foo.dart';
```

### dart format
- The `dart format` command can be used to format whitespaces in your program to follow the dart guidelines
- More information on dart format is [here](https://dart.dev/tools/dart-format)
- To format all the Dart files in or under the current directory:
```
dart format.
```
- To specify multiple files or directories, use a space-delimited list: 
```
dart format lib bin/updater.dart 
```
- For information on additional command-line options:
```
dart help format
```

### Further references
- [Effective Dart: Documentation](https://dart.dev/guides/language/effective-dart/documentation)
- [Effective Dart: Usage](https://dart.dev/guides/language/effective-dart/usage)
- [Effective Dart: Design](https://dart.dev/guides/language/effective-dart/design)

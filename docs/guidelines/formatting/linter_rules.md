# Linter Rules

- We can use the Dart Linter to identify formatting and possible problems in our code. The analyzer package provides a code linter with a wide variety of linter rules. While linter rules are enabled in the IDE, we can also use the `dart analyze` command for the same

The Dart team provides two sets of recommended linter rules in the [lints package](https://pub.dev/packages/lints):

- **Core rules** : Help identify critical issues that are likely to lead to problems when running or consuming Dart code. All code should pass these linter rules.
- **Recommended rules** : Help identify additional issues that may lead to problems when running or consuming Dart code, and enforce a single, idiomatic style and format. We recommend that all Dart codes use these rules, which are a superset of the core rules.

#### Flutter analyzer

In Flutter code, instead of using the `lints` package, use [`flutter_lints`](https://pub.dev/packages/flutter_lints), which provides a superset of the recommended rules. The analyzer can be invoked manually by running `flutter analyze`.

Flutter apps, packages, and plugins created with  `flutter create`  starting with Flutter version 2.3.0 are already set up to use the lints defined in this package. Entities created before that version can use these lints by following these instructions:

1.  Depend on this package as a  **dev_dependency**  by running  `flutter pub add --dev flutter_lints`.
2.  Create an  `analysis_options.yaml`  file at the root of the package (alongside the  `pubspec.yaml`  file) and  `include: package:flutter_lints/flutter.yaml`  from it.

Example `analysis_options.yaml` file:

```yaml
# This file configures the analyzer, which statically analyzes Dart code to
# check for errors, warnings, and lints.
#
# The issues identified by the analyzer surfaced in the UI of Dart-enabled
# IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
# invoked from the command line by running `flutter analyze`.

# The following line activates a set of recommended lints for Flutter apps,
# packages, and plugins designed to encourage good coding practices.
include: package:flutter_lints/flutter.yaml

linter:
  # The lint rules applied to this project can be customized in the
  # section below to disable rules from the `package:flutter_lints/flutter.yaml`
  # included above or to enable additional rules. A list of all available lints
  # and their documentation is published at
  # https://dart-lang.github.io/linter/lints/index.html.
  #
  # Instead of disabling a lint rule for the entire project in the
  # section below, it can also be suppressed for a single line of code
  # or a specific dart file by using the `// ignore: name_of_lint` and
  # `// ignore_for_file: name_of_lint` syntax on the line or in the file
  # producing the lint.
  rules:
    # avoid_print: false  # Uncomment to disable the `avoid_print` rule
    # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule

# Additional information about this file can be found at
# https://dart.dev/guides/language/analysis-options
```

#### Enabling individual rules
To enable a single linter rule, add `linter:` to the analysis options file as a top-level key, followed by `rules:` as a second-level key. On subsequent lines, specify the rules that you want to apply, prefixed with dashes (the syntax for a YAML list). For example:
```
linter:
  rules:
	  - always_declare_return_types 
	  - cancel_subscriptions 
	  - close_sinks 
	  - comment_references 
	  - one_member_abstracts 
	  - only_throw_errors 
	  - package_api_docs 
	  - prefer_final_in_for_each 
	  - prefer_single_quotes
  ```
 
 For additional reference on how to format and use your analysis options files, refer to the [official documentation](https://dart.dev/guides/language/analysis-options#individual-rules)
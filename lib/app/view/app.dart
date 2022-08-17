// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:auto_route/auto_route.dart';
import 'package:bigspoon_foods/di/service_locator.dart';
import 'package:bigspoon_foods/l10n/l10n.dart';
import 'package:bigspoon_foods/navigation/routes.gr.dart';
import 'package:bigspoon_foods/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return CustomTheme(
      builder: (mode) => MaterialApp.router(
        routerDelegate: AutoRouterDelegate(router),
        routeInformationParser: router.defaultRouteParser(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: mode,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

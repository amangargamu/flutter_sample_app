// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grappus_mobile/change_language/provider/change_language_notifier.dart';
import 'package:grappus_mobile/di/service_locator.dart';
import 'package:grappus_mobile/l10n/l10n.dart';
import 'package:grappus_mobile/navigation/routes.gr.dart';
import 'package:grappus_mobile/theme/custom_theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeLanguageNotifier()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    final changeLanguageNotifier = Provider.of<ChangeLanguageNotifier>(context);
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
        locale: Locale(changeLanguageNotifier.localeLanguageCode),
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

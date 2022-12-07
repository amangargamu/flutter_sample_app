/*
 * @author Noor Bhatia
 * Created on 09-08-2022
 */

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:grappus_mobile/change_language/change_language.dart';
import 'package:grappus_mobile/counter/counter.dart';
import 'package:grappus_mobile/counter/view/settings.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: CounterPage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: ChangeLanguageSettingsPage),
    AutoRoute(page: LanguageHome, initial: true)
  ],
)
class $AppRouter {}

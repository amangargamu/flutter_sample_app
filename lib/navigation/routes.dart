/*
 * @author Noor Bhatia
 * Created on 09-08-2022
 */

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:grappus_mobile/counter/counter.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: CounterPage, initial: true),
  ],
)
class $AppRouter {}

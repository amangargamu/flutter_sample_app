// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../change_language/change_language.dart' as _i3;
import '../counter/counter.dart' as _i1;
import '../counter/view/settings.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CounterPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CounterPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SettingsPage());
    },
    ChangeLanguageSettingsPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ChangeLanguageSettingsPage());
    },
    LanguageHomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LanguageHome());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(CounterPageRoute.name, path: '/counter-page'),
        _i4.RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        _i4.RouteConfig(ChangeLanguageSettingsPageRoute.name,
            path: '/change-language-settings-page'),
        _i4.RouteConfig(LanguageHomeRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.CounterPage]
class CounterPageRoute extends _i4.PageRouteInfo<void> {
  const CounterPageRoute()
      : super(CounterPageRoute.name, path: '/counter-page');

  static const String name = 'CounterPageRoute';
}

/// generated route for
/// [_i2.SettingsPage]
class SettingsPageRoute extends _i4.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i3.ChangeLanguageSettingsPage]
class ChangeLanguageSettingsPageRoute extends _i4.PageRouteInfo<void> {
  const ChangeLanguageSettingsPageRoute()
      : super(ChangeLanguageSettingsPageRoute.name,
            path: '/change-language-settings-page');

  static const String name = 'ChangeLanguageSettingsPageRoute';
}

/// generated route for
/// [_i3.LanguageHome]
class LanguageHomeRoute extends _i4.PageRouteInfo<void> {
  const LanguageHomeRoute() : super(LanguageHomeRoute.name, path: '/');

  static const String name = 'LanguageHomeRoute';
}

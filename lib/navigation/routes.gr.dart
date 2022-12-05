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

import '../counter/counter.dart' as _i1;
import '../otp/view/send_otp_screen.dart' as _i2;
import '../otp/view/verify_otp.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CounterPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CounterPage());
    },
    SendOTPScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SendOTPScreenRouteArgs>(
          orElse: () => const SendOTPScreenRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SendOTPScreen(key: args.key));
    },
    VerifyOTPScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.VerifyOTPScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(CounterPageRoute.name, path: '/'),
        _i4.RouteConfig(SendOTPScreenRoute.name, path: '/send-ot-pScreen'),
        _i4.RouteConfig(VerifyOTPScreenRoute.name, path: '/verify-ot-pScreen')
      ];
}

/// generated route for
/// [_i1.CounterPage]
class CounterPageRoute extends _i4.PageRouteInfo<void> {
  const CounterPageRoute() : super(CounterPageRoute.name, path: '/');

  static const String name = 'CounterPageRoute';
}

/// generated route for
/// [_i2.SendOTPScreen]
class SendOTPScreenRoute extends _i4.PageRouteInfo<SendOTPScreenRouteArgs> {
  SendOTPScreenRoute({_i5.Key? key})
      : super(SendOTPScreenRoute.name,
            path: '/send-ot-pScreen', args: SendOTPScreenRouteArgs(key: key));

  static const String name = 'SendOTPScreenRoute';
}

class SendOTPScreenRouteArgs {
  const SendOTPScreenRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'SendOTPScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.VerifyOTPScreen]
class VerifyOTPScreenRoute extends _i4.PageRouteInfo<void> {
  const VerifyOTPScreenRoute()
      : super(VerifyOTPScreenRoute.name, path: '/verify-ot-pScreen');

  static const String name = 'VerifyOTPScreenRoute';
}

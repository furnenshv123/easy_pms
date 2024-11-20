// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:easy_pms/features/electronic_keys/presentation/view/electronic_keys_screen.dart'
    as _i1;
import 'package:easy_pms/features/log_in/presentation/view/log_in_screen.dart'
    as _i2;
import 'package:easy_pms/features/reservation/presentation/view/reservation_screen.dart'
    as _i3;
import 'package:easy_pms/features/reservation/presentation/view/route_navigation_screen.dart'
    as _i4;

/// generated route for
/// [_i1.ElectronicKeysScreen]
class ElectronicKeysRoute extends _i5.PageRouteInfo<void> {
  const ElectronicKeysRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ElectronicKeysRoute.name,
          initialChildren: children,
        );

  static const String name = 'ElectronicKeysRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.ElectronicKeysScreen();
    },
  );
}

/// generated route for
/// [_i2.LogInScreen]
class LogInRoute extends _i5.PageRouteInfo<void> {
  const LogInRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.LogInScreen();
    },
  );
}

/// generated route for
/// [_i3.ReservationScreen]
class ReservationRoute extends _i5.PageRouteInfo<void> {
  const ReservationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ReservationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReservationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.ReservationScreen();
    },
  );
}

/// generated route for
/// [_i4.RouteNavigationScreen]
class RouteNavigationRoute extends _i5.PageRouteInfo<void> {
  const RouteNavigationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RouteNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteNavigationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.RouteNavigationScreen();
    },
  );
}

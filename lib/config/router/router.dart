import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/config/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
        AutoRoute(page: LogInRoute.page, initial: true,),
        AutoRoute(page: RouteNavigationRoute.page, children: [
          AutoRoute(page: ReservationRoute.page, initial:  true),
          AutoRoute(page: ElectronicKeysRoute.page)
        ])
      ];
}

final router = AppRouter();

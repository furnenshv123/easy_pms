import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/config/router/router.gr.dart';
import 'package:easy_pms/features/reservation/presentation/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RouteNavigationScreen extends StatefulWidget {
  const RouteNavigationScreen({super.key});

  @override
  State<RouteNavigationScreen> createState() => _RouteNavigationScreenState();
}

class _RouteNavigationScreenState extends State<RouteNavigationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: true,
      routes: const [
        ReservationRoute(),
        ElectronicKeysRoute(),
        AnalyticsRoute(),
        StaffRoute(),
        TariffsRoute(),
        ServicesRoute(),
        RoomAccountingRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        const listOfTiles = [
          'Guests',
          'Electronic keys',
          'Analytics',
          'Staff',
          'Tariffs',
          'Services',
          'Room accounting',
        ];
        int selectedIndex = tabsRouter.activeIndex;
        return Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 70),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, spreadRadius: 0, blurRadius: 4)
                  ],
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 45,
                          weight: 0.1,
                        )),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 45,
                    )
                  ],
                ),
              )),
          drawer: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: DrawerWidget(
                    list: listOfTiles,
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      selectedIndex = value;
                      _setCurrentIndex(selectedIndex, tabsRouter);
                    }),
              ),
            ),
          ),
          body: child,
        );
      },
    );
  }

  void _setCurrentIndex(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}

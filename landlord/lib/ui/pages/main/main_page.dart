import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landlord/models/test.dart';
import 'package:landlord/ui/pages/add/add_page.dart';
import 'package:landlord/ui/pages/home/home_page.dart';
import 'package:landlord/ui/pages/profile/profile_page.dart';
import 'package:landlord/ui/resource/colors.dart';
import 'package:landlord/ui/resource/images.dart';
import 'package:landlord/ui/resource/styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final borderRadius = 27.0;
  static const tab_transition_duration_ms = 350;
  final navigatorKey = GlobalKey<NavigatorState>();

  int selectedIndex = 0;

  late List<_Tab> tabs;
  late _Tab mainTab;
  late _Tab? selectedTab;

  @override
  void initState() {
    tabs = <_Tab>[
      _Tab(
        title: 'Main',
        iconPath: ResoureImage.ic_home,
        builder: (context) => HomePage(),
      ),
      _Tab(
        title: 'Profile',
        iconPath: ResoureImage.ic_profile,
        builder: (context) => ProfilePage(),
      ),
    ];

    mainTab = tabs[0];
    selectedTab = mainTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(color: ResoureColors.accent_1.withOpacity(0.5), width: 2.5),
        ),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: ResoureColors.accent_1.withOpacity(0.5),
        ),
        onPressed: () {
          setState(() {
            selectedTab = null;
          });
          PlaceList.getSortedAccomodationList();
          final route = MaterialPageRoute(builder: (context) => AddPage());
          Navigator.of(navigatorKey.currentContext!).push(route);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: selectedIndex == 0,
      body: WillPopScope(
        onWillPop: () async {
          if (selectedIndex == 0) {
            selectedIndex = tabs.length - 1;
          } else {
            selectedIndex -= 1;
          }
          selectedTab = tabs[selectedIndex];
          final page = selectedTab!.builder(navigatorKey.currentContext!);

          navigatorKey.currentState?.pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => page,
              transitionDuration: const Duration(milliseconds: tab_transition_duration_ms),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
            ),
          );
          setState(() {});
          return false;
        },
        child: Navigator(
          key: navigatorKey,
          onGenerateInitialRoutes: (state, _) => [
            PageRouteBuilder(pageBuilder: (_, __, ___) {
              return mainTab.builder(state.context);
            })
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius)),
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius)),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: tabs.map((e) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = tabs.indexOf(e);
                      selectedTab = e;

                      final page = selectedTab!.builder(navigatorKey.currentContext!);

                      navigatorKey.currentState?.pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => page,
                          transitionDuration: const Duration(milliseconds: tab_transition_duration_ms),
                          transitionsBuilder: (_, animation, __, child) =>
                              FadeTransition(opacity: animation, child: child),
                        ),
                      );
                      setState(() {});
                    },
                    child: Container(
                      height: 47,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            e.iconPath,
                            color:
                                e == selectedTab ? ResoureColors.primary_1 : ResoureColors.primary_1.withOpacity(0.7),
                          ),
                          Text(
                            e.title,
                            style: ResourceTextStyle.normal.copyWith(
                              color:
                                  e == selectedTab ? ResoureColors.primary_1 : ResoureColors.primary_1.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Tab {
  final String title;
  final String iconPath;
  final dynamic Function(BuildContext context) builder;

  const _Tab({
    required this.title,
    required this.iconPath,
    required this.builder,
  });
}

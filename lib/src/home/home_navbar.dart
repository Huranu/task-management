import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/src/home/dropdown.dart';
import 'package:task/src/widgets/colors.dart';
import 'package:task/src/widgets/icons.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key, required this.child, required this.location});
  final Widget child;
  final String location;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;

  static const List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      initialLocation: '/',
      icon: MyDefaultIcon(svgFile: 'assets/icons/home-2.svg'),
      activeIcon: MyDefaultIcon(svgFile: 'assets/icons/ahome-2.svg'),
      label: 'Home',
    ),
    MyCustomBottomNavBarItem(
      initialLocation: '/workspaces',
      icon: MyDefaultIcon(svgFile: 'assets/icons/buildings-2.svg'),
      activeIcon: MyDefaultIcon(svgFile: "assets/icons/abuildings-2.svg"),
      label: 'Workspaces',
    ),
    MyCustomBottomNavBarItem(
      initialLocation: '/calendar',
      icon: MyDefaultIcon(svgFile: 'assets/icons/calendar.svg'),
      activeIcon: MyDefaultIcon(svgFile: 'assets/icons/acalendar.svg'),
      label: 'Calendar',
    ),
    MyCustomBottomNavBarItem(
      initialLocation: '/profile',
      icon: MyDefaultIcon(svgFile: 'assets/icons/profile.svg'),
      activeIcon: MyDefaultIcon(svgFile: 'assets/icons/aprofile.svg'),
      label: 'Profile',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20, top: 14, bottom: 14),
            child: MyDropdownButton(),
          ),
          leadingWidth: MediaQuery.of(context).size.width * 0.58,
          actions: const [
            MyDefaultIcon(svgFile: 'assets/icons/search-normal.svg')
          ],
        ),
        body: SafeArea(child: widget.child),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColor.whiteColor,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              _goOtherTab(context, index);
            },
            currentIndex: widget.location == '/'
                ? 0
                : widget.location == '/workspaces'
                    ? 1
                    : widget.location == '/calendar'
                        ? 2
                        : widget.location == '/profile'
                            ? 3
                            : 4,
            items: tabs));
  }

  void _goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;

    setState(() {
      _currentIndex = index;
    });
    if (index == 4) {
      context.push('/login');
    } else {
      router.go(location);
    }
  }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const MyCustomBottomNavBarItem(
      {required this.initialLocation,
      required Widget icon,
      String? label,
      Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}

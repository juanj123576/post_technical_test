import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/const/colors.dart';
import 'package:my_app/pages/favorites_screen.dart';
import 'package:my_app/pages/settings.dart';
import 'package:my_app/pages/todos_Screen.dart';
import 'package:provider/provider.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  List<Widget> _buildScreens() {
    return [const todos_Screen(), const favorites_Screen(), const perfil()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_offer_outlined),
        title: ("Posts"),
        activeColorPrimary: basicColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.request_quote_outlined),
        title: ("Favorites"),
        activeColorPrimary: basicColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Settings"),
        activeColorPrimary: basicColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<Store>(context);

    return Center(
        child: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      stateManagement: false,
      handleAndroidBackButtonPress: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      onWillPop: (context) async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      hideNavigationBarWhenKeyboardShows: true,
      popActionScreens: PopActionScreensType.once,
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      navBarStyle: NavBarStyle.simple,
    ));
  }
}

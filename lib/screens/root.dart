import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/screens/chat.dart';
import 'package:the_perfect_home_zm/screens/explore.dart';
import 'package:the_perfect_home_zm/screens/home.dart';
import 'package:the_perfect_home_zm/screens/property.dart';
import 'package:the_perfect_home_zm/screens/setting.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/utils/constant.dart';
import 'package:the_perfect_home_zm/widgets/bottombar_item.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int activeTab = 0;
  List<Map<String, dynamic>> barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": const HomePage(),
      "title": ""
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
      "page": const ExplorePage(),
      "title": ""
    },
    {
      "icon": Icons.favorite_border,
      "active_icon": Icons.favorite_outlined,
      "page": const PropertyPage(),
      "title": ""
    },
    {
      "icon": Icons.forum_outlined,
      "active_icon": Icons.forum_rounded,
      "page": const ChatPage(),
      "title": ""
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": const SettingPage(),
      "title": ""
    },
  ];
  //====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

  //====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: getBarPage(),
      // bottomNavigationBar: getBottomBar1()
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children: List.generate(
            barItems.length,
            (index) => animatedPage(
                barItems[index]["page"] as Widget))); // Cast page to Widget
  }

  Widget getBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1))
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
              barItems.length,
              (index) => BottomBarItem(
                    activeTab == index
                        ? barItems[index]["active_icon"] as IconData
                        : barItems[index]["icon"] as IconData,
                    "",
                    isActive: activeTab == index,
                    activeColor: primary,
                    onTap: () {
                      onPageChanged(index);
                    },
                  ))),
    );
  }
}

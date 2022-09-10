import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:full_module/modules/price_tracker/ui/pages/home_page.dart';
import 'package:full_module/modules/search_module/ui/pages/home_page.dart';

import 'basic_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    BasicHomePage(),
    HomePagePriceTracker(),
    HomePageSearchModule()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState((() => currentIndex = index)),
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Search', icon: Icon(Icons.find_in_page)),
            BottomNavigationBarItem(
                label: 'Tracker', icon: Icon(Icons.track_changes))
          ]),
    );
  }
}

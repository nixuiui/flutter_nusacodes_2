import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/pages/tab_1.dart';
import 'package:flutter_nusacodes_2/pages/tab_2.dart';

class TabNavigationPage extends StatefulWidget {
  const TabNavigationPage({super.key});

  @override
  State<TabNavigationPage> createState() => _TabNavigationPageState();
}

class _TabNavigationPageState extends State<TabNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Navigation"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            Tab1(),
            Tab2(),
          ]
        ),
      ),
    );
  }
}
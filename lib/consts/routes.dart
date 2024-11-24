import 'package:flutter_nusacodes_2/pages/counter_page.dart';
import 'package:flutter_nusacodes_2/pages/home_page.dart';
import 'package:flutter_nusacodes_2/pages/login_page.dart';
import 'package:flutter_nusacodes_2/pages/main_page.dart';
import 'package:flutter_nusacodes_2/pages/profile_page.dart';
import 'package:flutter_nusacodes_2/pages/splash_screen.dart';
import 'package:flutter_nusacodes_2/pages/tab_navigation_page.dart';
import 'package:flutter_nusacodes_2/pages/web_view_page.dart';

class AppRoutes {
  static String get splash => "/splash";
  static String get main => "/main";
  static String get home => "/home";
  static String get profile => "/profile";
  static String get tabNavigation => "/tab-navigation";
  static String get webView => "/web-view";
  static String get counter => "/counter";
  static String get login => "/login";
}

final routes = {
  AppRoutes.splash: (context) => const SplashScreen(),
  AppRoutes.main: (context) => const MainPage(),
  AppRoutes.home: (context) => const HomePage(),
  AppRoutes.profile: (context) => const ProfilePage(),
  AppRoutes.tabNavigation: (context) => const TabNavigationPage(),
  AppRoutes.webView: (context) => const WebViewPage(),
  AppRoutes.counter: (context) => const CounterPage(),
  AppRoutes.login: (context) => const LoginPage(),
};
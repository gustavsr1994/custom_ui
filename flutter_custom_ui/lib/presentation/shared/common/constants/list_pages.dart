import 'package:flutter_custom_ui/presentation/views/main/main_screen.dart';
import 'package:flutter_custom_ui/presentation/views/menu/main_menu_screen.dart';
import 'package:flutter_custom_ui/presentation/views/splash/splash_screen.dart';
import 'package:get/get.dart';

var listPages = [
  GetPage(name: '/', page: () => SplashScreen(), transition: Transition.fade),
  GetPage(name: '/main', page: () => MainScreen()),
  GetPage(name: '/mainMenu', page: () => MainMenuScreen()),
];

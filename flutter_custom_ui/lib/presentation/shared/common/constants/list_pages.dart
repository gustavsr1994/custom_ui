import 'package:flutter_custom_ui/presentation/views/main/main_screen.dart';
import 'package:flutter_custom_ui/presentation/views/menu/cart/cart_screen.dart';
import 'package:flutter_custom_ui/presentation/views/menu/chart/chart_screen.dart';
import 'package:flutter_custom_ui/presentation/views/menu/checkout/checkout_screen.dart';
import 'package:flutter_custom_ui/presentation/views/menu/main_menu_screen.dart';
import 'package:flutter_custom_ui/presentation/views/menu/success/success_screen.dart';
import 'package:flutter_custom_ui/presentation/views/splash/splash_screen.dart';
import 'package:get/get.dart';

var listPages = [
  GetPage(name: '/', page: () => SplashScreen(), transition: Transition.fade),
  GetPage(name: '/main', page: () => MainScreen()),
  GetPage(name: '/mainMenu', page: () => MainMenuScreen()),
  GetPage(name: '/cart', page: () => CartScreen()),
  GetPage(name: '/checkOut', page: () => CheckOutScreen()),
  GetPage(name: '/successPayment', page: () => SuccessScreen()),
  GetPage(name: '/chart', page: () => ChartScreen())
];

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }
  
  _startSplashScreen() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, _navigationPage);
  }

 void _navigationPage() {
    Get.offNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsPallete().mainRedColor,
          body: Center(
            child: Lottie.asset(
                'lib/presentation/shared/assets/animations/welcome_screen.json'),
          )),
    );
  }
}

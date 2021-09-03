import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/views/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'presentation/shared/common/constants/list_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: listPages,
      home: SplashScreen(),
    );
  }
}

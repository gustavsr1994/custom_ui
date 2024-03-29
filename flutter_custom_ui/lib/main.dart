import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_ui/presentation/controllers/bloc/maps_bloc.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/views/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'presentation/shared/common/constants/list_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapsBloc(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: listPages,
        theme: ThemeData(
            fontFamily: 'Horseman',
            appBarTheme: AppBarTheme(color: ColorsPallete().mainColor)),
        home: SplashScreen(),
      ),
    );
  }
}

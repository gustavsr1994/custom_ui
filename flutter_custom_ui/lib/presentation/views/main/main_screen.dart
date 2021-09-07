import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/line_button.dart';
import 'package:flutter_custom_ui/presentation/views/main/login/login_screen.dart';
import 'package:flutter_custom_ui/presentation/views/main/signup/signup_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var colorPallete = ColorsPallete();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: SvgPicture.asset(
                  'lib/presentation/shared/assets/images/images_main_screen.svg',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: LineButton(
                  textButton: 'Log In',
                  buttonColor: colorPallete.transparantColor,
                  lineColor: colorPallete.mainRedColor,
                  textColor: colorPallete.accentRedColor,
                  onPress: () => bottomDialogLogin(context),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: LineButton(
                  textButton: 'Sign Up',
                  buttonColor: colorPallete.accentRedColor,
                  lineColor: colorPallete.mainRedColor,
                  textColor: colorPallete.transparantColor,
                  onPress: () => bottomDialogSignUp(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bottomDialogLogin(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return LoginScreen();
        });
  }

  void bottomDialogSignUp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return SignUpScreen();
        });
  }
}
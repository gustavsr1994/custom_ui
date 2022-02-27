import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/controllers/login/auth_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/button_with_icon.dart';
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
  late String emailLogin = '';

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
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  textButton: 'Log In with GMail',
                  buttonColor: colorPallete.whiteColor,
                  lineColor: colorPallete.accentColor,
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_login_google.svg',
                  onPress: () {
                    loginWithGoogle();
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: LineButton(
                  textButton: 'Log In',
                  buttonColor: colorPallete.whiteColor,
                  lineColor: colorPallete.accentColor,
                  textColor: colorPallete.fontColor,
                  onPress: () => bottomDialogLogin(context),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: LineButton(
                  textButton: 'Sign Up',
                  buttonColor: colorPallete.whiteColor,
                  lineColor: colorPallete.accentColor,
                  textColor: colorPallete.fontColor,
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

  void loginWithGoogle() async {
    AuthController().login().then((value) {
      setState(() {
        emailLogin = value!.email!;
      });
    });
  }
}

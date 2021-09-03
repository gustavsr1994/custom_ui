import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/utils/validator_custom.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/line_button.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/text_field/text_form_field.dart';
import 'package:flutter_custom_ui/presentation/views/main/login/login_screen.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidatorCustom {
  var colorPallete = ColorsPallete();
  TextEditingController usernameController, passwordController;
  FocusNode usernameFocus, passwordFocus;
  bool obscureStatus = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: colorPallete.mainRedColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: 50,
                    height: 5,
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: colorPallete.mainBlueColor,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
                SizedBox(height: 20),
                TextFieldCustom(
                    textController: usernameController,
                    keyboardType: TextInputType.name,
                    focusNode: usernameFocus,
                    obscureText: false,
                    labelText: 'Username',
                    fillColor: colorPallete.mainRedColor,
                    onSubmitted: () {
                      usernameFocus.unfocus();
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                    validator: validateRequired),
                TextFieldCustom(
                  textController: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: usernameFocus,
                  obscureText: obscureStatus,
                  labelText: 'Password',
                    fillColor: colorPallete.mainRedColor,
                  onSubmitted: () {
                    usernameFocus.unfocus();
                    FocusScope.of(context).requestFocus(passwordFocus);
                  },
                  validator: validateRequired,
                  suffixIcon: IconButton(
                      icon: Icon(obscureStatus
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscureStatus = !obscureStatus;
                        });
                      }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3 * 2,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: LineButton(
                      textButton: 'Sign Up',
                      buttonColor: colorPallete.mainRedColor,
                      lineColor: colorPallete.transparantColor,
                      textColor: colorPallete.transparantColor,
                      onPress: () => navigateLogin()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateLogin() {
    if (_formKey.currentState.validate()) {
      Navigator.pop(context);
      bottomDialogLogin(context);
    }
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
}
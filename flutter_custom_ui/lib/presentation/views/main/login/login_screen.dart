import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/utils/validator_custom.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/line_button.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/text_field/text_form_field.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidatorCustom {
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
            color: colorPallete.transparantColor,
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
                      color: ColorsPallete().mainRedColor,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
                SizedBox(height: 20),
                TextFieldCustom(
                    textController: usernameController,
                    keyboardType: TextInputType.name,
                    focusNode: usernameFocus,
                    obscureText: false,
                    labelText: 'Username',
                    fillColor: colorPallete.transparantColor,
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
                    fillColor: colorPallete.transparantColor,
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
                      textButton: 'Sign In',
                      buttonColor: colorPallete.transparantColor,
                      lineColor: colorPallete.mainRedColor,
                      textColor: colorPallete.accentRedColor,
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
      Get.offNamed('/mainMenu');
    }
  }
}

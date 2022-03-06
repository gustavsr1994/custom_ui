import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
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
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();
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
            color: colorPallete.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      width: 30,
                      height: 5,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colorPallete.accentColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Login Screen',
                    style: textMediumColor(
                        boldCondition: true, color: colorPallete.fontColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                    textController: usernameController,
                    keyboardType: TextInputType.name,
                    focusNode: usernameFocus,
                    obscureText: false,
                    labelText: 'Username',
                    fillColor: colorPallete.whiteColor,
                    cursorColor: colorPallete.secondColor,
                    borderColor: colorPallete.accentColor,
                    onSubmitted: (term) {
                      usernameFocus.unfocus();
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                    validator: (value) => validateRequired(value)),
                TextFieldCustom(
                  textController: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: passwordFocus,
                  obscureText: obscureStatus,
                  labelText: 'Password',
                  fillColor: colorPallete.whiteColor,
                  cursorColor: colorPallete.secondColor,
                  borderColor: colorPallete.accentColor,
                  onSubmitted: (term) {
                    passwordFocus.unfocus();
                  },
                  validator: (value) => validateRequired(value),
                  suffixIcon: IconButton(
                      color: colorPallete.secondColor,
                      icon: Icon(obscureStatus
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscureStatus = !obscureStatus;
                        });
                      }),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3 * 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: LineButton(
                        textButton: 'Sign In',
                        buttonColor: colorPallete.whiteColor,
                        lineColor: colorPallete.accentColor,
                        textColor: colorPallete.fontColor,
                        onPress: () => navigateLogin()),
                  ),
                ),
                Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width / 3 * 2,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: colorPallete.mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                          'Note : Silahkan masukkan username dan password secara random.')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateLogin() {
    if (_formKey.currentState!.validate()) {
      Get.offAllNamed('/mainMenu');
    }
  }
}

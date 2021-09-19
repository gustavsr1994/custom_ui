import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/line_button.dart';
import 'package:get/get.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  var colorPallete = ColorsPallete();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple App',
          style: textLargeColor(
              boldCondition: true, color: colorPallete.transparantColor),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: LineButton(
                  buttonColor: colorPallete.transparantColor!,
                  lineColor: colorPallete.mainRedColor,
                  textButton: 'Cart',
                  textColor: colorPallete.accentRedColor,
                  onPress: () => navigateToCart(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: LineButton(
                  buttonColor: colorPallete.transparantColor!,
                  lineColor: colorPallete.mainRedColor,
                  textButton: 'Chart',
                  textColor: colorPallete.accentRedColor,
                  onPress: () => null,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: LineButton(
                  buttonColor: colorPallete.transparantColor!,
                  lineColor: colorPallete.mainRedColor,
                  textButton: 'About Us',
                  textColor: colorPallete.accentRedColor,
                  onPress: () => null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToCart() {
    Get.toNamed('/cart');
  }
}

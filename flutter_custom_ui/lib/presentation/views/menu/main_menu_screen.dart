import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/button_with_icon.dart';
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
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: colorPallete.mainRedColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Check In',
                          style: textLargeColor(
                              boldCondition: true,
                              color: colorPallete.transparantColor),
                        ),
                        Text('Check Out',
                            style: textLargeColor(
                                boldCondition: true,
                                color: colorPallete.transparantColor)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '--:--',
                          style: textLargeColor(
                              boldCondition: false,
                              color: colorPallete.transparantColor),
                        ),
                        Text('--:--',
                            style: textLargeColor(
                                boldCondition: false,
                                color: colorPallete.transparantColor)),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ButtonWithIcon(
                      buttonColor: colorPallete.transparantColor!,
                      lineColor: colorPallete.mainRedColor,
                      textButton: 'Absent',
                      textColor: colorPallete.accentRedColor,
                      image:
                          'lib/presentation/shared/assets/images/ic_barcode.svg',
                      onPress: () => null,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.transparantColor!,
                  lineColor: colorPallete.mainRedColor,
                  textButton: 'Cart',
                  textColor: colorPallete.accentRedColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToCart(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.transparantColor!,
                  lineColor: colorPallete.mainRedColor,
                  textButton: 'Chart',
                  textColor: colorPallete.accentRedColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToChart(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.transparantColor!,
                  lineColor: colorPallete.mainRedColor,
                  textButton: 'About Us',
                  textColor: colorPallete.accentRedColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
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

  void navigateToChart() {
    Get.toNamed('/chart');
  }
}

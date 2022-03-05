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
              boldCondition: true, color: colorPallete.fontColor),
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
                    color: colorPallete.mainColor,
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
                              color: colorPallete.accentColor),
                        ),
                        Text('Check Out',
                            style: textLargeColor(
                                boldCondition: true,
                                color: colorPallete.accentColor)),
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
                              color: colorPallete.fontColor),
                        ),
                        Text('--:--',
                            style: textLargeColor(
                                boldCondition: false,
                                color: colorPallete.fontColor)),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ButtonWithIcon(
                      buttonColor: colorPallete.whiteColor,
                      lineColor: colorPallete.secondColor,
                      textButton: 'Absent',
                      textColor: colorPallete.fontColor,
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
                  buttonColor: colorPallete.mainColor,
                  lineColor: colorPallete.secondColor,
                  textButton: 'Cart',
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToCart(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.mainColor,
                  lineColor: colorPallete.secondColor,
                  textButton: 'Chart',
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToChart(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.mainColor,
                  lineColor: colorPallete.secondColor,
                  textButton: 'Maps',
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToMap(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ButtonWithIcon(
                  buttonColor: colorPallete.mainColor,
                  lineColor: colorPallete.secondColor,
                  textButton: 'About Us',
                  textColor: colorPallete.fontColor,
                  image:
                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                  onPress: () => navigateToAbout(),
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

  void navigateToMap() {
    Get.toNamed('/map');
  }

  void navigateToAbout() {
    Get.toNamed('/about');
  }
}

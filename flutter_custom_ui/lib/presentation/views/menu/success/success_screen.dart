import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/line_button.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var color = ColorsPallete();
    return Scaffold(
      backgroundColor: color.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
                'lib/presentation/shared/assets/animations/success_anim.json',
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3),
            Text(
              'Payment Success',
              style: textLargeColor(boldCondition: true, color: Colors.black),
            ),
            LineButton(
              buttonColor: color.mainColor,
              lineColor: color.accentColor,
              textButton: 'Main Menu',
              textColor: color.accentColor,
              onPress: () => navigateToSuccess(),
            )
          ],
        ),
      ),
    );
  }

  void navigateToSuccess() {
    Get.offAllNamed('/mainMenu');
  }
}

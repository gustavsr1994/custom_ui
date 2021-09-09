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
      backgroundColor: color.transparantColor,
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
                'lib/presentation/shared/assets/animations/success_anim.json'),
            Text('Payment Success', style: textLargeColor(boldCondition: true, color: Colors.black),),
            LineButton(
              buttonColor: color.mainBlueColor,
              lineColor: color.transparantColor,
              textButton: 'Main Menu',
              textColor: color.transparantColor,
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

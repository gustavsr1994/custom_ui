import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWithIcon extends StatelessWidget {
  final Color lineColor;
  final Color textColor;
  final Color buttonColor;
  final String textButton;
  final String image;
  final Function() onPress;
  ButtonWithIcon(
      {required this.lineColor,
      required this.textColor,
      required this.buttonColor,
      required this.textButton,
      required this.image,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        primary: buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: lineColor,
            )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textButton,
            style: textMediumColor(boldCondition: true, color: textColor),
          ),
          SvgPicture.asset(
            image,
            fit: BoxFit.contain,
          )
        ],
      ),
      onPressed: onPress,
    );
  }
}

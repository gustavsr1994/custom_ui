import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';

class LineButton extends StatelessWidget {
  final Color lineColor;
  final Color textColor;
  final Color buttonColor;
  final String textButton;
  final Function() onPress;
  LineButton(
      {required this.lineColor,
      required this.textColor,
      required this.buttonColor,
      required this.textButton,
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
      child: Text(
        textButton,
        style: textMediumColor(boldCondition: true, color: textColor),
      ),
      onPressed: onPress,
    );
  }
}

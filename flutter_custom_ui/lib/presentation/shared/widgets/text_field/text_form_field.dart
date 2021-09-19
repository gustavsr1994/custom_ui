import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final bool? obscureText;
  final Function(String term) onSubmitted;
  final IconButton? suffixIcon;
  final Function(String value) validator;
  final Color fillColor;
  final Color cursorColor;
  final Color borderColor;

  TextFieldCustom(
      {required this.textController,
      required this.keyboardType,
      required this.focusNode,
      this.obscureText,
      required this.labelText,
      required this.onSubmitted,
      this.suffixIcon,
      required this.fillColor,
      required this.cursorColor,
      required this.borderColor,
      required this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: textController,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        onFieldSubmitted: onSubmitted,
        cursorColor: cursorColor,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 2.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: cursorColor, width: 1.5),
          ),
          focusColor: cursorColor,
          labelText: labelText,
          labelStyle: textLargeColor(boldCondition: true, color: borderColor),
          
          filled: true,
          fillColor: fillColor,
          suffixIcon: suffixIcon,
        ),
        validator: (value) => validator(value!),
      ),
    );
  }
}

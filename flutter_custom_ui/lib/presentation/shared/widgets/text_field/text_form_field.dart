import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final bool obscureText;
  final Function onSubmitted;
  final IconButton suffixIcon;
  final Function validator;
  final Color fillColor;
  TextFieldCustom(
      {@required this.textController,
      @required this.keyboardType,
      @required this.focusNode,
      this.obscureText,
      this.labelText,
      @required this.onSubmitted,
      this.suffixIcon,
      @required this.fillColor,
      @required this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: textController,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: fillColor,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';

class TextFieldCustom extends StatelessWidget {
  String labelText;
  TextEditingController textController;
  TextInputType keyboardType;
  FocusNode focusNode;
  bool obscureText;
  Function onSubmitted;
  IconButton suffixIcon;
  Function validator;
  Color fillColor;
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
        onFieldSubmitted: (term) => onSubmitted,
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

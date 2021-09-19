import 'package:flutter/material.dart';

TextStyle textVerySmallColor(
    {Color? color, required bool boldCondition, bool? strikeThrough}) {
  return TextStyle(
    decoration: strikeThrough == null
        ? TextDecoration.none
        : TextDecoration.lineThrough,
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 10,
  );
}

TextStyle textSmallColor(
    {Color? color, required bool boldCondition, bool? strikeThrough}) {
  return TextStyle(
    decoration: strikeThrough == null
        ? TextDecoration.none
        : TextDecoration.lineThrough,
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 12,
  );
}

TextStyle textMediumColor(
    {Color? color, required bool boldCondition, bool? strikeThrough}) {
  return TextStyle(
    decoration: strikeThrough == null
        ? TextDecoration.none
        : TextDecoration.lineThrough,
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 15,
  );
}

TextStyle textLargeColor(
    {Color? color, required bool boldCondition, bool? strikeThrough}) {
  return TextStyle(
    decoration: strikeThrough == null
        ? TextDecoration.none
        : TextDecoration.lineThrough,
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 18,
  );
}

TextStyle textVeryLargeColor(
    {Color? color, required bool boldCondition, bool? strikeThrough}) {
  return TextStyle(
    decoration: strikeThrough == null
        ? TextDecoration.none
        : TextDecoration.lineThrough,
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 20,
  );
}

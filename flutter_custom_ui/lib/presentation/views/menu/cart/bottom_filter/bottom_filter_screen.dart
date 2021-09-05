import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/constants/list_categories.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';

class BottomFilterScreen extends StatelessWidget {
  final colorPallete = ColorsPallete();
  final bool obscureStatus = true;
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Form(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: colorPallete.transparantColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      width: 30,
                      height: 5,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorsPallete().mainRedColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Filter by',
                    style: textMediumColor(
                        boldCondition: true,
                        color: colorPallete.accentRedColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var index = 0;
                          index < listCategories.length;
                          index++)
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              isSelected = index;
                            },
                            child: Chip(
                                padding: EdgeInsets.all(8.0),
                                backgroundColor: isSelected == index
                                    ? colorPallete.mainRedColor
                                    : Colors.grey[300],
                                label: Text(
                                  listCategories[index],
                                  style: textMediumColor(
                                      boldCondition: false,
                                      color: isSelected == index
                                          ? colorPallete.accentBlueColor
                                          : colorPallete.accentRedColor),
                                )),
                          ),
                        )
                    ],
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width / 3 * 2,
                //   margin: EdgeInsets.symmetric(vertical: 8),
                //   child: LineButton(
                //       textButton: 'Sign In',
                //       buttonColor: colorPallete.transparantColor,
                //       lineColor: colorPallete.mainRedColor,
                //       textColor: colorPallete.accentRedColor,
                //       onPress: () => navigateLogin()),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

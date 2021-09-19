import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/controllers/filter/filter_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/constants/list_categories.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/line_button.dart';
import 'package:get/get.dart';

class BottomFilterScreen extends StatelessWidget {
  final colorPallete = ColorsPallete();
  final bool obscureStatus = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilterController());
    return Container(
      color: Color(0xFF737373),
      child: Form(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
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
                                controller.categorySelected(index);
                              },
                              child: GetX<FilterController>(
                                init: FilterController(),
                                builder: (controller) {
                                  return Chip(
                                      padding: EdgeInsets.all(8.0),
                                      backgroundColor:
                                          controller.positionSelected.value ==
                                                  index
                                              ? colorPallete.mainRedColor
                                              : Colors.grey[300],
                                      label: Text(
                                        listCategories[index],
                                        style: textMediumColor(
                                            boldCondition: false,
                                            color: controller.positionSelected
                                                        .value ==
                                                    index
                                                ? colorPallete.accentBlueColor
                                                : colorPallete.accentRedColor),
                                      ));
                                },
                              )),
                        )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: LineButton(
                          textButton: 'Filter',
                          buttonColor: colorPallete.transparantColor!,
                          lineColor: colorPallete.mainRedColor,
                          textColor: colorPallete.accentRedColor,
                          onPress: () => null),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: LineButton(
                          textButton: 'Reset',
                          buttonColor: colorPallete.mainRedColor,
                          lineColor: colorPallete.mainRedColor,
                          textColor: colorPallete.accentBlueColor,
                          onPress: () => controller.categorySelected(0)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/controllers/courier/Courier_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/constants/list_courier.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:get/get.dart';

class BottomCourier extends StatelessWidget {
  final colorPallete = ColorsPallete();
  final courierController = Get.put(CourierController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Form(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: colorPallete.whiteColor,
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
                        color: colorPallete.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'List Courier',
                        style: textMediumColor(
                            boldCondition: true, color: colorPallete.fontColor),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                for (var index = 0; index < listCourier.length; index++)
                  InkWell(
                    onTap: () => setCourier(listCourier[index], context),
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listCourier[index],
                              style: textMediumColor(
                                  boldCondition: true, color: Colors.black),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setCourier(String name, BuildContext context) {
    courierController.setCourier(name);
    Navigator.pop(context);
  }
}

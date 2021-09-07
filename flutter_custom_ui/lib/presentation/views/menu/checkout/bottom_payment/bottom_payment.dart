import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/controllers/payment/payment_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/constants/list_payment.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:get/get.dart';

class BottomPayment extends StatelessWidget {
   final colorPallete = ColorsPallete();
  final paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
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
                        color: colorPallete.mainRedColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'List Payment',
                    style: textMediumColor(
                        boldCondition: true,
                        color: colorPallete.accentRedColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                for (var index = 0; index < listPayment.length; index++)
                  InkWell(
                    onTap: () => setPayment(listPayment[index], context),
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listPayment[index],
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

  void setPayment(String name, BuildContext context) {
    paymentController.setPayment(name);
    Navigator.pop(context);
  }
}
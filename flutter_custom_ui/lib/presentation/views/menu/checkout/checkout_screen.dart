import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/controllers/courier/Courier_controller.dart';
import 'package:flutter_custom_ui/presentation/controllers/payment/payment_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/views/menu/checkout/bottom_courier/bottom_courier.dart';
import 'package:flutter_custom_ui/presentation/views/menu/checkout/bottom_payment/bottom_payment.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  var colorPallete = ColorsPallete();
  var courierController = Get.put(CourierController());
  var paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: textLargeColor(
              boldCondition: true, color: colorPallete.transparantColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Courier',
                style: textLargeColor(
                    boldCondition: true, color: colorPallete.accentRedColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetX<CourierController>(
                    builder: (controller) => Text(
                      controller.nameCourier.value,
                      style: textLargeColor(
                          boldCondition: true, color: Colors.black),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: () => bottomDialogCourier(context))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Payment Method',
                style: textLargeColor(
                    boldCondition: true, color: colorPallete.accentRedColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetX<PaymentController>(
                    builder: (controller) => Text(
                      controller.namePayment.value,
                      style: textLargeColor(
                          boldCondition: true, color: Colors.black),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: () => bottomDialogPayment(context))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void bottomDialogCourier(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return BottomCourier();
        });
  }

  void bottomDialogPayment(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return BottomPayment();
        });
  }
}

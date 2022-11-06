import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/domain/entities/cart_entity.dart';
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
  int totalAmount = 0;
  List<CartEntity>? cartProduct;
  @override
  void initState() {
    super.initState();
    cartProduct = Get.arguments;
    cartProduct!.forEach((element) {
      totalAmount =
          totalAmount + ((element.price - element.discount) * element.qty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: colorPallete.accentColor,
        ),
        title: Text(
          'Checkout',
          style: textLargeColor(
              boldCondition: true, color: colorPallete.fontColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card
            ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Details Cart',
                      style: textLargeColor(
                          boldCondition: true, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Rp. $totalAmount',
                        style: textLargeColor(
                            boldCondition: true, color: Colors.black)),
                  ),
                ],
              ),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product',
                        style: textLargeColor(
                            boldCondition: true, color: colorPallete.fontColor),
                      ),
                      Text(
                        'Total',
                        style: textLargeColor(
                            boldCondition: true, color: colorPallete.fontColor),
                      ),
                    ],
                  ),
                ),
                for (var index = 0; index < cartProduct!.length; index++)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartProduct![index].nameProduct,
                          style: textVeryLargeColor(boldCondition: true),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${cartProduct![index].qty} x ${cartProduct![index].price}",
                              style: textLargeColor(
                                  boldCondition: false, color: Colors.black),
                            ),
                            Text(
                              ((cartProduct![index].price -
                                          cartProduct![index].discount) *
                                      cartProduct![index].qty)
                                  .toString(),
                              style: textLargeColor(
                                  boldCondition: false, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                GetX<CourierController>(
                  builder: (controller) =>
                      textCourier(controller.nameCourier.value),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Courier',
                style: textLargeColor(
                    boldCondition: true, color: colorPallete.fontColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => bottomDialogCourier(context),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)),
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
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
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
                    boldCondition: true, color: colorPallete.fontColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => bottomDialogPayment(context),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)),
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
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () => navigateToSuccess(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: colorPallete.mainColor,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pay your Transaction',
                      style: textLargeColor(
                          boldCondition: true, color: Colors.black),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
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

  void navigateToSuccess() {
    Get.toNamed('/successPayment');
  }

  Widget textCourier(String nameCourier) {
    if (nameCourier == "Choice Courier") {
      return SizedBox();
    } else {
      return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: colorPallete.secondColor,
                height: 5,
              ),
              Text(
                "Courier",
                style: textVeryLargeColor(boldCondition: true),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nameCourier,
                    style: textLargeColor(boldCondition: false),
                  ),
                  Text(
                    priceCourier(nameCourier),
                    style: textLargeColor(
                        boldCondition: false, color: Colors.black),
                  ),
                ],
              ),
            ],
          ));
    }
  }

  String priceCourier(String courier) {
    if (courier == "NinjaCepet") {
      return "9000";
    } else if (courier == "JTN") {
      return "8000";
    } else if (courier == "JetPack") {
      return "7500";
    } else if (courier == "Ojol") {
      return "15000";
    } else if (courier == "POSKu") {
      return "10000";
    } else {
      return "000";
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/domain/entities/cart_entity.dart';
import 'package:flutter_custom_ui/presentation/controllers/cart/cart_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/button_with_icon.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/card/card_cart.dart';
import 'package:get/get.dart';

class BottomCart extends StatelessWidget {
  final int? totalAmount;
  BottomCart({this.totalAmount});

  final colorPallete = ColorsPallete();
  final controller = Get.put(CartController());

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
              child: controller.obx((state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                            width: 30,
                            height: 5,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: ColorsPallete().mainRedColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cart',
                              style: textLargeColor(
                                  boldCondition: true,
                                  color: colorPallete.accentRedColor),
                            ),
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.close))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      for (var index = 0;
                          index < state!.listCart!.length;
                          index++)
                        CardCart(
                          cartProduct: state.listCart![index],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Total : $totalAmount',
                              style: textLargeColor(
                                  boldCondition: true,
                                  color: colorPallete.accentBlueColor),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: ButtonWithIcon(
                                  textButton: 'Check Out',
                                  buttonColor: colorPallete.mainRedColor,
                                  lineColor: colorPallete.mainRedColor,
                                  textColor: colorPallete.transparantColor!,
                                  image:
                                      'lib/presentation/shared/assets/images/ic_arrow_right.svg',
                                  onPress: () => navigateToCheckOut(
                                      context, state.listCart!)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  void navigateToCheckOut(BuildContext context, List<CartEntity> listCart) {
    Navigator.pop(context);
    Get.toNamed('/checkOut', arguments: listCart);
  }
}

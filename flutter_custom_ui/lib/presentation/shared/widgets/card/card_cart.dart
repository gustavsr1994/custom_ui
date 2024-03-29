import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/domain/entities/cart_entity.dart';
import 'package:flutter_custom_ui/presentation/controllers/cart/cart_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:get/get.dart';

class CardCart extends StatelessWidget {
  final CartEntity? cartProduct;
  CardCart({this.cartProduct});

  @override
  Widget build(BuildContext context) {
    var colorPallete = ColorsPallete();
    final controller = Get.put(CartController());
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  cartProduct!.nameProduct,
                  style: textLargeColor(
                      boldCondition: true, color: colorPallete.fontColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Rp ${(cartProduct!.price - cartProduct!.discount) * cartProduct!.qty}',
                      style: textMediumColor(
                          boldCondition: false, color: colorPallete.fontColor),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.minimize_outlined,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            controller.minusQty(cartProduct!);
                          }),
                      Text(cartProduct!.qty.toString()),
                      IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            controller.addQty(cartProduct!);
                          }),
                    ],
                  )
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 0, 0, 8),
              decoration: BoxDecoration(
                color: colorPallete.mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
              ),
              child: IconButton(
                  onPressed: () => null,
                  icon: Icon(
                    Icons.delete,
                    size: 17,
                    color: Colors.red[600],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

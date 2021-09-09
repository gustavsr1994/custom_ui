import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/data/models/product/product_response.dart';
import 'package:flutter_custom_ui/domain/entities/cart_entity.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';

class CardCart extends StatelessWidget {
  final CartEntity cartProduct;
  CardCart({this.cartProduct});

  @override
  Widget build(BuildContext context) {
    var colorPallete = ColorsPallete();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    cartProduct.nameProduct,
                    style: textLargeColor(
                        boldCondition: true,
                        color: colorPallete.accentRedColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Rp ${(cartProduct.price-cartProduct.discount)*cartProduct.qty}',
                    style: textMediumColor(
                        boldCondition: false,
                        color: colorPallete.accentRedColor),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    onPressed: null),
                Text(cartProduct.qty.toString()),
                IconButton(
                    icon: Icon(
                      Icons.minimize_outlined,
                      color: Colors.red,
                    ),
                    onPressed: null),
              ],
            )
          ],
        ),
      ),
    );
  }
}

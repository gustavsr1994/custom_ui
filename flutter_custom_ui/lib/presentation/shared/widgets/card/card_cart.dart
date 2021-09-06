import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/data/models/product/product_response.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:get/get.dart';

class CardCart extends StatelessWidget {
  ProductResponse cartProduct;
  CardCart({this.cartProduct});

  @override
  Widget build(BuildContext context) {
    var colorPallete = ColorsPallete();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                cartProduct.nameProduct,
                style: textLargeColor(
                    boldCondition: true, color: colorPallete.accentRedColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Rp ${cartProduct.price}',
                style: textMediumColor(
                    boldCondition: false, color: colorPallete.accentRedColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

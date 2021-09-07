import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/domain/entities/product_entity.dart';
import 'package:flutter_custom_ui/presentation/controllers/cart/cart_controller.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/line_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardProduct extends StatelessWidget {
  final ProductEntity product;
  CardProduct({this.product});
  @override
  Widget build(BuildContext context) {
    var colorPallete = ColorsPallete();
    final controller = Get.put(CartController());
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        product.urlImage,
                      ),
                      fit: BoxFit.fill,
                    )),
                height: 150,
              ),
              product.discount == 0
                  ? SizedBox()
                  : SvgPicture.asset(
                      'lib/presentation/shared/assets/images/ic_price_tag.svg',
                      color: colorPallete.accentBlueColor,
                      height: 50,
                      width: 40,
                    )
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.nameProduct),
                Text('Price : ${product.price}',
                    style: textMediumColor(
                        boldCondition: false,
                        strikeThrough: product.discount == 0 ? null : true,
                        color: colorPallete.accentRedColor)),
                SizedBox(
                  height: 8,
                ),
                product.discount == 0
                    ? SizedBox()
                    : Text(
                        'Price : ${(product.price - product.discount)}',
                        style: textMediumColor(
                            boldCondition: true,
                            color: colorPallete.accentRedColor),
                      )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            child: LineButton(
              buttonColor: colorPallete.mainRedColor,
              lineColor: colorPallete.mainRedColor,
              textButton: 'Add to Cart',
              textColor: colorPallete.transparantColor,
              onPress: () => controller.addToCart(product),
            ),
          )
          // GetX<CartController>(
          //   builder: (controller) {
          //     controller.listCart.forEach((element) {
          //       if (element == product.codeProduct) {
          //         return SizedBox();
          //       } else {
          //         return Container(
          //           width: MediaQuery.of(context).size.width,
          //           padding: EdgeInsets.all(8),
          //           child: LineButton(
          //             buttonColor: colorPallete.mainRedColor,
          //             lineColor: colorPallete.mainRedColor,
          //             textButton: 'Add to Cart',
          //             textColor: colorPallete.transparantColor,
          //             onPress: () => controller.addToCart(product.codeProduct) ,
          //           ),
          //         );
          //       }
          //     });
          //   },
          // )
        ],
      ),
    );
  }
}

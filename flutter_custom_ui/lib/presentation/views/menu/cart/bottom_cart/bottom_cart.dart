import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/buttons/line_button.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/card/card_cart.dart';

class BottomCart extends StatelessWidget {
  final listCart;
  BottomCart({this.listCart});

  final colorPallete = ColorsPallete();

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
                        color: ColorsPallete().mainRedColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Cart',
                    style: textMediumColor(
                        boldCondition: true,
                        color: colorPallete.accentRedColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                for (var index = 0; index < listCart.length; index++)
                  CardCart(
                    cartProduct: listCart[index],
                  ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: LineButton(
                        textButton: 'Check Out',
                        buttonColor: colorPallete.mainRedColor,
                        lineColor: colorPallete.mainRedColor,
                        textColor: colorPallete.accentBlueColor,
                        onPress: () => null),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

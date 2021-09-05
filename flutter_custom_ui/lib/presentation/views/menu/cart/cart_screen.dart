import 'package:flutter/material.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/colors_pallete.dart';
import 'package:flutter_custom_ui/presentation/shared/common/styles/text_style.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/card/card_product.dart';
import 'package:flutter_custom_ui/presentation/shared/widgets/text_field/text_form_field_search.dart';
import 'package:flutter_custom_ui/presentation/views/menu/cart/bottom_filter/bottom_filter_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var colorPallete = ColorsPallete();
  TextEditingController searchController;
  FocusNode searchFocus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'List Product',
            style: textLargeColor(
                boldCondition: true, color: colorPallete.transparantColor),
          ),
        ),
        body: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormSearch(
                      textController: searchController,
                      keyboardType: TextInputType.text,
                      focusNode: searchFocus,
                      onSubmitted: (term) => null,
                      labelText: 'Search by name',
                      suffixIcon:
                          IconButton(icon: Icon(Icons.search), onPressed: null),
                      obscureText: false,
                      fillColor: colorPallete.transparantColor,
                      validator: null),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                            icon: Icon(Icons.filter_alt),
                            onPressed: () => bottomDialogFilter(context))))
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Expanded(
                  flex: 1,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 10,
                    primary: false,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    itemBuilder: (context, index) => CardProduct(
                      nameProduct: 'Product ke - $index',
                      price: (1000 * index).toString(),
                    ),
                    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  void bottomDialogFilter(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return BottomFilterScreen();
        });
  }
}

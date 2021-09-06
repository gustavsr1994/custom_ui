import 'package:flutter_custom_ui/data/datasources/product_data_source.dart';
import 'package:flutter_custom_ui/data/models/product/product_response.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var listProduct = <ProductResponse>[].obs;
  var listCart = <ProductResponse>[].obs;

  void getAllProduct() async {
    listProduct.value = await ProductDataApi().listProduct();
  }

  void addToCart(ProductResponse product) async {
    listCart.add(product);
    print(listCart.length);
  }
}

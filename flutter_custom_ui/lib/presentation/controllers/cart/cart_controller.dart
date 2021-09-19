import 'package:flutter_custom_ui/domain/entities/cart_entity.dart';
import 'package:flutter_custom_ui/domain/entities/product_entity.dart';
import 'package:flutter_custom_ui/domain/usecase/product_usecase.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var listProduct = <ProductEntity>[].obs;
  var listCart = <CartEntity>[].obs;

  void getAllProduct() async {
    listProduct.value = await ProductUseCaseImpl().listProduct();
  }

  void addToCart(ProductEntity product) async {
    product.statusCard = true;
    int index = listProduct.indexWhere((element) => element.codeProduct == product.codeProduct);
    listProduct[index] = product;
    if (listCart.length == 0) {
      listCart.add(CartEntity(
          codeProduct: product.codeProduct,
          nameProduct: product.nameProduct,
          category: product.category,
          qty: 1,
          price: product.price,
          discount: product.discount,
          urlImage: product.urlImage));
    } else {
      List<CartEntity> cart = listCart
          .where((data) => data.codeProduct == product.codeProduct)
          .toList();
      if (cart.length == 0) {
        listCart.add(CartEntity(
            codeProduct: product.codeProduct,
            nameProduct: product.nameProduct,
            category: product.category,
            qty: 1,
            price: product.price,
            discount: product.discount,
            urlImage: product.urlImage));
      } else {
        var qty = cart[0].qty + 1;
        listCart.removeWhere(
            (element) => element.codeProduct == product.codeProduct);
        listCart.add(CartEntity(
            codeProduct: product.codeProduct,
            nameProduct: product.nameProduct,
            category: product.category,
            qty: qty,
            price: product.price,
            discount: product.discount,
            urlImage: product.urlImage));
      }
    }
  }
}

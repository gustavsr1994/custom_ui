import 'package:flutter_custom_ui/domain/entities/cart_entity.dart';
import 'package:flutter_custom_ui/domain/entities/product_entity.dart';
import 'package:flutter_custom_ui/domain/usecase/product_usecase.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin<DataCart> {
  var listProduct = <ProductEntity>[].obs;
  var listCart = <CartEntity>[].obs;

  void getAllProduct() async {
    change(null, status: RxStatus.loading());
    listProduct.value = await ProductUseCaseImpl().listProduct();
    change(DataCart(listProduct: listProduct, listCart: listCart),
        status: RxStatus.success());
  }

  void addToCart(ProductEntity product) async {
    change(null, status: RxStatus.loading());
    product.statusCard = true;
    int index = listProduct
        .indexWhere((element) => element.codeProduct == product.codeProduct);
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
    change(DataCart(listCart: listCart, listProduct: listProduct),
        status: RxStatus.success());
  }

  void addQty(CartEntity cartEntity) {
    change(null, status: RxStatus.loading());
    var qty = cartEntity.qty + 1;
    listCart.removeWhere(
        (element) => element.codeProduct == cartEntity.codeProduct);
    listCart.add(CartEntity(
        codeProduct: cartEntity.codeProduct,
        nameProduct: cartEntity.nameProduct,
        category: cartEntity.category,
        qty: qty,
        price: cartEntity.price,
        discount: cartEntity.discount,
        urlImage: cartEntity.urlImage));
    change(DataCart(listCart: listCart, listProduct: listProduct),
        status: RxStatus.success());
  }

  void minusQty(CartEntity cartEntity) {
    change(null, status: RxStatus.loading());
    var qty = cartEntity.qty - 1;
    listCart.removeWhere(
        (element) => element.codeProduct == cartEntity.codeProduct);
    listCart.add(CartEntity(
        codeProduct: cartEntity.codeProduct,
        nameProduct: cartEntity.nameProduct,
        category: cartEntity.category,
        qty: qty < 0 ? 0 : qty,
        price: cartEntity.price,
        discount: cartEntity.discount,
        urlImage: cartEntity.urlImage));
    change(DataCart(listCart: listCart, listProduct: listProduct),
        status: RxStatus.success());
  }
}

class DataCart {
  List<ProductEntity>? listProduct;
  List<CartEntity>? listCart;

  DataCart({this.listProduct, this.listCart});
}

import 'package:flutter_custom_ui/data/models/product/product_response.dart';
import 'package:get/get.dart';

abstract class ProductDataSource extends GetConnect {
  Future<List<ProductResponse>> listProduct();
}

class ProductDataApi extends ProductDataSource {
  @override
  Future<List<ProductResponse>> listProduct() async {
    Response response =
        await get('https://trial-firebase-95a60.firebaseio.com/product.json');
    var listProduct = <ProductResponse>[];
    for (var index = 0; index < response.body.length; index++) {
      listProduct.add(ProductResponse.fromJson(response.body[index]));
    }
    return listProduct;
  }
}

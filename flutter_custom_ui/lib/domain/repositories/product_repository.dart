import 'package:flutter_custom_ui/data/datasources/product_data_source.dart';
import 'package:flutter_custom_ui/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> listProduct();
}

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<List<ProductEntity>> listProduct() async {
    var data = await ProductDataApi().listProduct();
    var listProduct = <ProductEntity>[];
    data.forEach((element) {
      listProduct.add(ProductEntity(
          codeProduct: element.codeProduct,
          nameProduct: element.nameProduct,
          category: element.category,
          price: int.parse(element.price),
          discount: element.discount,
          urlImage: element.urlImage,
          statusCard: false));
    });
    return listProduct;
  }
}

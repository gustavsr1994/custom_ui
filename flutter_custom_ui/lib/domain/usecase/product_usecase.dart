import 'package:flutter_custom_ui/domain/entities/product_entity.dart';
import 'package:flutter_custom_ui/domain/repositories/product_repository.dart';

abstract class ProductUseCase {
  Future<List<ProductEntity>> listProduct();
}
class ProductUseCaseImpl extends ProductUseCase {
  @override
  Future<List<ProductEntity>> listProduct() => ProductRepositoryImpl().listProduct();

}
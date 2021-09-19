class CartEntity {
  final String codeProduct;
  final String nameProduct;
  final int price;
  final int discount;
  final String urlImage;
  final String category;
  final int qty;

  CartEntity(
      {required this.codeProduct,
      required this.nameProduct,
      required this.price,
      required this.discount,
      required this.urlImage,
      required this.category,
      required this.qty});
}

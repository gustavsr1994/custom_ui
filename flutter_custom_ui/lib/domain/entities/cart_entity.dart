class CartEntity {
  final String codeProduct;
  final String nameProduct;
  final int price;
  final int discount;
  final String urlImage;
  final String category;
  final int qty;

  CartEntity(
      {this.codeProduct,
      this.nameProduct,
      this.price,
      this.discount,
      this.urlImage,
      this.category,
      this.qty});
}

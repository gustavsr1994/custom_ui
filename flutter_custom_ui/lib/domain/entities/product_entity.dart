class ProductEntity {
  final String codeProduct;
  final String nameProduct;
  final int price;
  final int discount;
  final String urlImage;
  final String category;
  
  ProductEntity(
      {this.codeProduct,
      this.nameProduct,
      this.price,
      this.discount,
      this.urlImage,
      this.category});

  // @override
  // List<Object> get props =>
  //     [codeProduct,
  //     nameProduct,
  //     price,
  //     discount,
  //     urlImage,
  //     category];
}
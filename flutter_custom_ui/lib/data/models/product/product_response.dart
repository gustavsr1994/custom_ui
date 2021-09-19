class ProductResponse {
  late String codeProduct;
  late String nameProduct;
  late String price;
  late int stok;
  late int discount;
  late String urlImage;
  late String category;

  ProductResponse(
      {required this.codeProduct,
      required this.nameProduct,
      required this.price,
      required this.discount,
      required this.stok,
      required this.urlImage,
      required this.category});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    codeProduct = json['codeProduct'];
    nameProduct = json['nameProduct'];
    urlImage = json['urlImage'];
    stok = json['stok'];
    price = json['price'];
    category = json['category'];
    discount = json['discount'];
  }
}

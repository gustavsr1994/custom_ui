class ProductResponse {
  String codeProduct;
  String nameProduct;
  String price;
  int stok;
  int discount;
  String urlImage;
  String category;

  ProductResponse(
      {this.codeProduct,
      this.nameProduct,
      this.price,
      this.discount,
      this.stok,
      this.urlImage,
      this.category});

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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String nameProduct;
  final String price;
  CardProduct({this.nameProduct, this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    'https://image-cdn.medkomtek.com/6pT8edTRVcZzO4YfGXjtuiMB9Rk=/640x640/smart/klikdokter-media-buckets/medias/2132483/original/003102700_1525316788-5-Buah-Ini-Harus-Ada-dalam-Menu-Harian-Anda-By-Alexander-Raths-shutterstock.jpg',
                  ),
                  fit: BoxFit.fill,
                )),
            height: 150,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nameProduct),
                Text('Price : $price'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

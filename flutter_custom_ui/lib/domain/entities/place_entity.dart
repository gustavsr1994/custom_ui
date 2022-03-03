import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPlaceEntity {
  final String name;
  final String fullAddress;
  final double lattitude;
  final double longitude;

  DetailPlaceEntity(
      {required this.name,
      required this.fullAddress,
      required this.lattitude,
      required this.longitude});
}

class PlaceEntity {
  final String namePlace;
  final String idPlace;

  PlaceEntity({required this.namePlace, required this.idPlace});
}

class PlaceModel {
  List<PlaceEntity>? collectionPlace;
  String? name;
  LatLng? position;

  PlaceModel({this.collectionPlace, this.name, this.position});
}

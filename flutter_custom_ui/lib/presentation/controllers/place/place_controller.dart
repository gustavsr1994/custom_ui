import 'package:flutter_custom_ui/domain/entities/place_entity.dart';
import 'package:flutter_custom_ui/domain/repositories/place_repository.dart';
import 'package:flutter_custom_ui/presentation/controllers/map/map_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceController extends GetxController with StateMixin<PlaceModel> {
  var dataPlace = <PlaceModel>{};

  void getListPlace(String keyword) async {
    change(null, status: RxStatus.loading());
    var result = await PlaceRepositoryImpl().getAddressCollection(keyword);
    if (result.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(
          PlaceModel(collectionPlace: result, name: '', position: LatLng(0, 0)),
          status: RxStatus.success());
    }
  }

  Future<LatLng> getDetailPlace(
      String idPlace, List<PlaceEntity> listPlace) async {
    var mapController = Get.put(MapController());
    change(null, status: RxStatus.loading());
    var result = await PlaceRepositoryImpl().getDetailAddress(idPlace);
    if (result.name == "") {
      change(null, status: RxStatus.empty());
      return LatLng(0, 0);
    } else {
      mapController.currentLocation(PlaceModel(
          name: result.name,
          position: LatLng(result.lattitude, result.longitude)));
      return LatLng(result.lattitude, result.longitude);
    }
  }
}

import 'package:flutter_custom_ui/domain/entities/place_entity.dart';
import 'package:get/get.dart';

class MapController extends GetxController with StateMixin<PlaceModel> {
  var dataPlace = <PlaceModel>{};

  void currentLocation(PlaceModel data) async {
    change(null, status: RxStatus.loading());
    change(data, status: RxStatus.success());
  }
}

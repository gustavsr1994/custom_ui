import 'package:get/get.dart';

class CourierController extends GetxController with StateMixin<String> {
  var nameCourier = 'Choice Courier'.obs;

  void setCourier(String name) {
    change(null, status: RxStatus.loading());
    nameCourier.value = name;
    change(nameCourier.value, status: RxStatus.success());
  }
}

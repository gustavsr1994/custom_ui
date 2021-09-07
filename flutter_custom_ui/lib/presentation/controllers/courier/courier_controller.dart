import 'package:get/get.dart';

class CourierController extends GetxController {
  var nameCourier = 'Choice Courier'.obs;

  void setCourier(String name) {
    nameCourier.value = name;
  }
}

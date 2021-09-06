import 'package:get/get.dart';

class FilterController extends GetxController {
  var positionSelected = 0.obs;
  void categorySelected(int position) {
    positionSelected.value = position;
  }
}

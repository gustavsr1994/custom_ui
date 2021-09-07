import 'package:get/get.dart';

class PaymentController extends GetxController {
  var namePayment = 'Choice Payment Method'.obs;

  void setPayment(String name) {
    namePayment.value = name;
  }
}

import 'package:flutter_custom_ui/data/models/absent/absent_model.dart';
import 'package:flutter_custom_ui/domain/entities/absent_entity.dart';
import 'package:flutter_custom_ui/domain/usecase/absent_usecase.dart';
import 'package:get/get.dart';

class AbsentController extends GetxController with StateMixin<AbsentEntity> {
  var dataAbsent =
      AbsentEntity(checkIn: '', checkOut: '', date: '', id: '').obs;
  void getAbsentToday() async {
    change(null, status: RxStatus.loading());
    dataAbsent.value = await AbsentUseCaseImpl().getAbsent();
    change(dataAbsent.value, status: RxStatus.success());
  }

  void submitAbsentToday(AbsentModel dataReq) async {
    change(null, status: RxStatus.loading());
    dataAbsent.value = await AbsentUseCaseImpl().submitAbsent(dataReq);
    change(dataAbsent.value, status: RxStatus.success());
  }
}

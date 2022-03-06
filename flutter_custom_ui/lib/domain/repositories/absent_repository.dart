import 'package:flutter_custom_ui/data/datasources/absent_data_source.dart';
import 'package:flutter_custom_ui/data/models/absent/absent_model.dart';
import 'package:flutter_custom_ui/domain/entities/absent_entity.dart';
import 'package:flutter_custom_ui/presentation/shared/common/utils/date_formatter.dart';

abstract class AbsentRepository {
  Future<AbsentEntity> getAbsent();
  Future<AbsentEntity> submitAbsent(AbsentModel request);
}

class AbsentRepositoryImpl extends AbsentRepository {
  @override
  Future<AbsentEntity> getAbsent() async {
    var now = new DateTime.now();
    var date = DateFormatter().formatBackend(now);
    var data = await AbsentDataApi().getAbsent();
    var result = AbsentEntity(
        checkIn: '--:--',
        checkOut: '--:--',
        date: '-- --- ----',
        id: '00000xxx');
    if (data.date! == date) {
      result = AbsentEntity(
          checkIn: data.checkIn!,
          checkOut: data.checkOut!,
          date: data.date!,
          id: data.name!,
          status: data.checkIn == '--:--'
              ? 'in'
              : data.checkOut == '--:--'
                  ? 'out'
                  : 'finish');
    } else {
      result = AbsentEntity(
          checkIn: '--:--',
          checkOut: '--:--',
          date: data.date!,
          id: data.name!,
          status: 'in');
    }
    return result;
  }

  @override
  Future<AbsentEntity> submitAbsent(AbsentModel request) async {
    var data = await AbsentDataApi().submitAbsent(request);
    var result = AbsentEntity(
        checkIn: '--:--',
        checkOut: '--:--',
        date: '-- --- ----',
        id: '00000xxx');
    if (data.checkOut == '--:--') {
      result = AbsentEntity(
          checkIn: data.checkIn!,
          checkOut: data.checkOut!,
          date: data.date!,
          id: data.name!,
          status: 'out');
    } else {
      result = AbsentEntity(
          checkIn: data.checkIn!,
          checkOut: data.checkOut!,
          date: data.date!,
          id: data.name!,
          status: 'finish');
    }
    return result;
  }
}

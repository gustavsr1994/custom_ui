import 'dart:convert';

import 'package:flutter_custom_ui/data/models/absent/absent_model.dart';
import 'package:get/get.dart';

abstract class AbsentDataSource extends GetConnect {
  Future<AbsentModel> getAbsent();
  Future<AbsentModel> submitAbsent(AbsentModel request);
}

class AbsentDataApi extends AbsentDataSource {
  @override
  Future<AbsentModel> getAbsent() async {
    Response response =
        await get('https://trial-firebase-95a60.firebaseio.com/absent.json');
    var dataAbsent = AbsentModel();
    dataAbsent = AbsentModel.fromJson(response.body);
    return dataAbsent;
  }

  @override
  Future<AbsentModel> submitAbsent(AbsentModel request) async {
    var jsonRequest = jsonEncode(request.toJson());
    print(jsonRequest);
    Response response = await put(
        'https://trial-firebase-95a60.firebaseio.com/absent.json', jsonRequest);
    var dataAbsent = AbsentModel();
    dataAbsent = AbsentModel.fromJson(response.body);
    return dataAbsent;
  }
}

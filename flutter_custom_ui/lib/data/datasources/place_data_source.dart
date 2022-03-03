import 'package:flutter_custom_ui/data/models/place/address_detail_response.dart';
import 'package:flutter_custom_ui/data/models/place/place_response.dart';
import 'package:get/get.dart';

abstract class RegionalDataSource extends GetConnect {
  Future<List<Predictions>> getAddressCollection(String keyword);
  Future<Result> getDetailAddress(String idPlace);
}

class RegionDataApi extends RegionalDataSource {
  @override
  Future<List<Predictions>> getAddressCollection(String keyword) async {
    const apiKey = "AIzaSyCeIHQpjsvbld5aHrtf0V_epaVxeroIyO0";
    String request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$keyword&types=establishment&key=$apiKey';
    Response response = await get(request);
    print("Url : $request");
    var listAddress = <Predictions>[];
    if (response.body != null) {
      PlaceResponse result = PlaceResponse.fromJson(response.body);
      listAddress = result.predictions!;
    }
    return listAddress;
  }

  @override
  Future<Result> getDetailAddress(String idPlace) async {
    const apiKey = "AIzaSyCeIHQpjsvbld5aHrtf0V_epaVxeroIyO0";
    String request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$idPlace&key=$apiKey';
    print("url : $request");
    Response response = await get(request);
    var dataResult = Result();
    if (response.body != null) {
      DetailAddressResponse detailAddressResponse =
          DetailAddressResponse.fromJson(response.body);
      dataResult = detailAddressResponse.result!;
    }
    return dataResult;
  }
}

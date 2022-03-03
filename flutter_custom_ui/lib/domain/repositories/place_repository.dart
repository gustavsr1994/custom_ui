import 'package:flutter_custom_ui/data/datasources/place_data_source.dart';
import 'package:flutter_custom_ui/domain/entities/place_entity.dart';

abstract class PlaceRepository {
  Future<List<PlaceEntity>> getAddressCollection(String keyword);
  Future<DetailPlaceEntity> getDetailAddress(String idPlace);
}

class PlaceRepositoryImpl extends PlaceRepository {
  @override
  Future<List<PlaceEntity>> getAddressCollection(String keyword) async {
    var data = await RegionDataApi().getAddressCollection(keyword);
    var result = <PlaceEntity>[];
    for (var item in data) {
      result.add(
          PlaceEntity(namePlace: item.description!, idPlace: item.placeId!));
    }
    return result;
  }

  @override
  Future<DetailPlaceEntity> getDetailAddress(String idPlace) async {
    var data = await RegionDataApi().getDetailAddress(idPlace);
    var result = DetailPlaceEntity(
        name: data.name!,
        fullAddress: data.formattedAddress!,
        lattitude: data.geometry!.location!.lat!,
        longitude: data.geometry!.location!.lng!);
    return result;
  }
}

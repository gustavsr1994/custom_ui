import 'package:flutter_custom_ui/domain/entities/place_entity.dart';
import 'package:flutter_custom_ui/domain/repositories/place_repository.dart';

abstract class PlaceUseCase {
  Future<List<PlaceEntity>> listPlace(String keyword);
  Future<DetailPlaceEntity> detailPlace(String idPlace);
}

class PlaceUseCaseImpl extends PlaceUseCase {
  @override
  Future<List<PlaceEntity>> listPlace(String keyword) =>
      PlaceRepositoryImpl().getAddressCollection(keyword);

  @override
  Future<DetailPlaceEntity> detailPlace(String idPlace) =>
      PlaceRepositoryImpl().getDetailAddress(idPlace);
}

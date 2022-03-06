import 'package:flutter_custom_ui/data/models/absent/absent_model.dart';
import 'package:flutter_custom_ui/domain/entities/absent_entity.dart';
import 'package:flutter_custom_ui/domain/repositories/absent_repository.dart';

abstract class AbsentUseCase {
  Future<AbsentEntity> getAbsent();
  Future<AbsentEntity> submitAbsent(AbsentModel request);
}

class AbsentUseCaseImpl extends AbsentUseCase {
  @override
  Future<AbsentEntity> getAbsent() => AbsentRepositoryImpl().getAbsent();

  @override
  Future<AbsentEntity> submitAbsent(AbsentModel request) =>
      AbsentRepositoryImpl().submitAbsent(request);
}

import 'package:vr_iscool/core/shared/domain/usecases/get_list_usecase.dart';
import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/repositories/registration_get_list_repository.dart';
import 'package:vr_iscool/modules/registration_module/domain/typedefs/registration_get_list_result.dart';

class RegistrationGetListUsecaseImpl
    implements GetListUsecase<RegistrationGetListResult, RegistrationEntity> {
  final RegistrationGetListRepository _repository;

  RegistrationGetListUsecaseImpl(this._repository);

  @override
  RegistrationGetListResult call(List<RegistrationEntity> entities) {
    return _repository(entities);
  }
}

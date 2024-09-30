import 'package:vr_iscool/core/shared/domain/usecases/delete_usecase.dart';
import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/repositories/registration_delete_repository%20copy.dart';
import 'package:vr_iscool/modules/registration_module/domain/typedefs/registration_entity_result.dart';

class RegistrationDeleteUsecaseImpl
    implements DeleteUsecase<RegistrationEntityResult, RegistrationEntity> {
  final RegistrationDeleteRepository _topRegistrationDeleteRepository;

  RegistrationDeleteUsecaseImpl(this._topRegistrationDeleteRepository);

  @override
  RegistrationEntityResult call(RegistrationEntity entity) {
    return _topRegistrationDeleteRepository(entity);
  }
}

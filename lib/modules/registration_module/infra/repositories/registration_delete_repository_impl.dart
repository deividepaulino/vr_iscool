import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/repositories/registration_delete_repository%20copy.dart';
import 'package:vr_iscool/modules/registration_module/domain/typedefs/registration_entity_result.dart';
import 'package:vr_iscool/modules/registration_module/infra/datasources/registration_delete_datasource.dart';

class RegistrationDeleteRepositoryImpl implements RegistrationDeleteRepository {
  final RegistrationDeleteDataSource _registrationdDeleteDataSource;

  RegistrationDeleteRepositoryImpl(this._registrationdDeleteDataSource);

  @override
  RegistrationEntityResult call(RegistrationEntity registrationdEntity) {
    return _registrationdDeleteDataSource(registrationdEntity);
  }
}

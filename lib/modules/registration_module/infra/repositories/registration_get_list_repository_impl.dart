import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/repositories/registration_get_list_repository.dart';
import 'package:vr_iscool/modules/registration_module/domain/typedefs/registration_get_list_result.dart';
import 'package:vr_iscool/modules/registration_module/infra/datasources/registration_get_list_datasource.dart';

class RegistrationGetListRepositoryImpl
    implements RegistrationGetListRepository {
  final RegistrationGetListDataSource _registrationdGetDataSource;

  RegistrationGetListRepositoryImpl(this._registrationdGetDataSource);

  @override
  RegistrationGetListResult call(List<RegistrationEntity> entities) {
    return _registrationdGetDataSource(entities);
  }
}

import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/typedefs/registration_get_list_result.dart';

abstract class RegistrationGetListDataSource {
  RegistrationGetListResult call(List<RegistrationEntity> entities);
}

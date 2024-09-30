import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/typedefs/registration_entity_result.dart';

abstract class RegistrationDeleteRepository {
  RegistrationEntityResult call(
    RegistrationEntity topRegistrationEntity,
  );
}

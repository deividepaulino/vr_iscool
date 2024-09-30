import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/domain/errors/registration_exception.dart';

typedef RegistrationGetListResult
    = AsyncResult<List<RegistrationEntity>, RegistrationException>;

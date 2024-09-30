import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/errors/student_exception.dart';

typedef StudentEntityResult = AsyncResult<StudentEntity, StudentException>;

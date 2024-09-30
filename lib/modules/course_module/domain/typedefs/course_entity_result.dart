import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/errors/course_exception.dart';

typedef CourseEntityResult = AsyncResult<CourseEntity, CourseException>;

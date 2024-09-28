import 'package:result_dart/result_dart.dart';
import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/domain/errors/top_course_exception.dart';

typedef TopCourseGetListResult
    = AsyncResult<List<TopCourseEntity>, TopCourseException>;

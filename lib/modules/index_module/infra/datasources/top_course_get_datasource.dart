import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/domain/typedefs/top_course_entity_result.dart';

abstract class TopCourseGetDataSource {
  TopCourseEntityResult call(TopCourseEntity topCoursedEntity);
}

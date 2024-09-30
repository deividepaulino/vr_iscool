import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';

abstract class CourseDeleteDataSource {
  CourseEntityResult call(CourseEntity topCoursedEntity);
}

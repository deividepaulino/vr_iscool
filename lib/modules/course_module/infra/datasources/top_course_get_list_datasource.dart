import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_get_list_result.dart';

abstract class TopCourseGetListDataSource {
  CourseGetListResult call(List<CourseEntity> entities);
}

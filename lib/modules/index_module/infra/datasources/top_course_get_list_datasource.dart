import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/domain/typedefs/top_course_get_list_result.dart';

abstract class TopCourseGetListDataSource {
  TopCourseGetListResult call(List<TopCourseEntity> entities);
}

import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/top_course_get_list_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_get_list_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/top_course_get_list_datasource.dart';

class TopCourseGetListRepositoryImpl implements TopCourseGetListRepository {
  final TopCourseGetListDataSource _topCoursedGetDataSource;

  TopCourseGetListRepositoryImpl(this._topCoursedGetDataSource);

  @override
  CourseGetListResult call(List<CourseEntity> entities) {
    return _topCoursedGetDataSource(entities);
  }
}

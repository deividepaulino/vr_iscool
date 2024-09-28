import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/domain/repositories/top_course_get_list_repository.dart';
import 'package:vr_iscool/modules/index_module/domain/typedefs/top_course_get_list_result.dart';
import 'package:vr_iscool/modules/index_module/infra/datasources/top_course_get_list_datasource.dart';

class TopCourseGetListRepositoryImpl implements TopCourseGetListRepository {
  final TopCourseGetListDataSource _topCoursedGetDataSource;

  TopCourseGetListRepositoryImpl(this._topCoursedGetDataSource);

  @override
  TopCourseGetListResult call(List<TopCourseEntity> entities) {
    return _topCoursedGetDataSource(entities);
  }
}

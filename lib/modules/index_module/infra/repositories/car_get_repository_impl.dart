import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/domain/repositories/top_course_get_repository.dart';
import 'package:vr_iscool/modules/index_module/domain/typedefs/top_course_entity_result.dart';
import 'package:vr_iscool/modules/index_module/infra/datasources/top_course_get_datasource.dart';

class TopCourseGetRepositoryImpl implements TopCourseGetRepository {
  final TopCourseGetDataSource _topCoursedGetDataSource;

  TopCourseGetRepositoryImpl(this._topCoursedGetDataSource);

  @override
  TopCourseEntityResult call(TopCourseEntity topCoursedEntity) {
    return _topCoursedGetDataSource(topCoursedEntity);
  }
}

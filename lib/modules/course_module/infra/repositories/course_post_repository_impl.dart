import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_post_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_post_datasource.dart';

class CoursePostRepositoryImpl implements CoursePostRepository {
  final CoursePostDataSource _coursedPostDataSource;

  CoursePostRepositoryImpl(this._coursedPostDataSource);

  @override
  CourseEntityResult call(CourseEntity coursedEntity) {
    return _coursedPostDataSource(coursedEntity);
  }
}

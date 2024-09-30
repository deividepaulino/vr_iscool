import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_delete_repository%20copy.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_delete_datasource.dart';

class CourseDeleteRepositoryImpl implements CourseDeleteRepository {
  final CourseDeleteDataSource _coursedDeleteDataSource;

  CourseDeleteRepositoryImpl(this._coursedDeleteDataSource);

  @override
  CourseEntityResult call(CourseEntity coursedEntity) {
    return _coursedDeleteDataSource(coursedEntity);
  }
}

import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_get_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_get_datasource.dart';

class CourseGetRepositoryImpl implements CourseGetRepository {
  final CourseGetDataSource _coursedGetDataSource;

  CourseGetRepositoryImpl(this._coursedGetDataSource);

  @override
  CourseEntityResult call(CourseEntity coursedEntity) {
    return _coursedGetDataSource(coursedEntity);
  }
}

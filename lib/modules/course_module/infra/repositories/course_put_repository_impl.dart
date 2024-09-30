import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_put_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_put_datasource.dart';

class CoursePutRepositoryImpl implements CoursePutRepository {
  final CoursePutDataSource _coursedPutDataSource;

  CoursePutRepositoryImpl(this._coursedPutDataSource);

  @override
  CourseEntityResult call(CourseEntity coursedEntity) {
    return _coursedPutDataSource(coursedEntity);
  }
}

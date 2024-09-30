import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_get_list_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_get_list_result.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_get_list_datasource.dart';

class CourseGetListRepositoryImpl implements CourseGetListRepository {
  final CourseGetListDataSource _coursedGetDataSource;

  CourseGetListRepositoryImpl(this._coursedGetDataSource);

  @override
  CourseGetListResult call(List<CourseEntity> entities) {
    return _coursedGetDataSource(entities);
  }
}

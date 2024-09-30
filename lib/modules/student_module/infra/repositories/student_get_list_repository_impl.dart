import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_get_list_repository.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_get_list_result.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_get_list_datasource.dart';

class StudentGetListRepositoryImpl implements StudentGetListRepository {
  final StudentGetListDataSource _studentdGetDataSource;

  StudentGetListRepositoryImpl(this._studentdGetDataSource);

  @override
  StudentGetListResult call(List<StudentEntity> entities) {
    return _studentdGetDataSource(entities);
  }
}

import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_get_repository.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_get_datasource.dart';

class StudentGetRepositoryImpl implements StudentGetRepository {
  final StudentGetDataSource _studentdGetDataSource;

  StudentGetRepositoryImpl(this._studentdGetDataSource);

  @override
  StudentEntityResult call(StudentEntity studentdEntity) {
    return _studentdGetDataSource(studentdEntity);
  }
}

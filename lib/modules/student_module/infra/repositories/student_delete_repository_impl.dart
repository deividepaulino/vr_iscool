import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_delete_repository%20copy.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_delete_datasource.dart';

class StudentDeleteRepositoryImpl implements StudentDeleteRepository {
  final StudentDeleteDataSource _studentdDeleteDataSource;

  StudentDeleteRepositoryImpl(this._studentdDeleteDataSource);

  @override
  StudentEntityResult call(StudentEntity studentdEntity) {
    return _studentdDeleteDataSource(studentdEntity);
  }
}

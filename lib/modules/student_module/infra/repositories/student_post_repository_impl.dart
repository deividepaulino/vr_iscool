import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_post_repository.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_post_datasource.dart';

class StudentPostRepositoryImpl implements StudentPostRepository {
  final StudentPostDataSource _studentdPostDataSource;

  StudentPostRepositoryImpl(this._studentdPostDataSource);

  @override
  StudentEntityResult call(StudentEntity studentdEntity) {
    return _studentdPostDataSource(studentdEntity);
  }
}

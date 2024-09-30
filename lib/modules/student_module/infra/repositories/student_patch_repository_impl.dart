import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_Patch_repository.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_patch_datasource.dart';

class StudentPatchRepositoryImpl implements StudentPatchRepository {
  final StudentPatchDataSource _studentdPatchDataSource;

  StudentPatchRepositoryImpl(this._studentdPatchDataSource);

  @override
  StudentEntityResult call(StudentEntity studentdEntity) {
    return _studentdPatchDataSource(studentdEntity);
  }
}

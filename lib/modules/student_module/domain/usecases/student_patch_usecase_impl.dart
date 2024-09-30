import 'package:vr_iscool/core/shared/domain/usecases/Patch_usecase.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_Patch_repository.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';

class StudentPatchUsecaseImpl
    implements PatchUsecase<StudentEntityResult, StudentEntity> {
  final StudentPatchRepository _topStudentPatchRepository;

  StudentPatchUsecaseImpl(this._topStudentPatchRepository);

  @override
  StudentEntityResult call(StudentEntity entity) {
    return _topStudentPatchRepository(entity);
  }
}

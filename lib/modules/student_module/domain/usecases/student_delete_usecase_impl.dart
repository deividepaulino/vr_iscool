import 'package:vr_iscool/core/shared/domain/usecases/delete_usecase.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_delete_repository%20copy.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';

class StudentDeleteUsecaseImpl
    implements DeleteUsecase<StudentEntityResult, StudentEntity> {
  final StudentDeleteRepository _topStudentDeleteRepository;

  StudentDeleteUsecaseImpl(this._topStudentDeleteRepository);

  @override
  StudentEntityResult call(StudentEntity entity) {
    return _topStudentDeleteRepository(entity);
  }
}

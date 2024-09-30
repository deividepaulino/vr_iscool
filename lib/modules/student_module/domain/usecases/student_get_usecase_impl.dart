import 'package:vr_iscool/core/shared/domain/usecases/get_usecase.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_get_repository.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';

class StudentGetUsecaseImpl
    implements GetUsecase<StudentEntityResult, StudentEntity> {
  final StudentGetRepository _topStudentGetRepository;

  StudentGetUsecaseImpl(this._topStudentGetRepository);

  @override
  StudentEntityResult call(StudentEntity entity) {
    return _topStudentGetRepository(entity);
  }
}

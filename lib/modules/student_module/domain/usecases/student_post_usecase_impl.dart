import 'package:vr_iscool/core/shared/domain/usecases/post_usecase.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_post_repository.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_entity_result.dart';

class StudentPostUsecaseImpl
    implements PostUsecase<StudentEntityResult, StudentEntity> {
  final StudentPostRepository _topStudentPostRepository;

  StudentPostUsecaseImpl(this._topStudentPostRepository);

  @override
  StudentEntityResult call(StudentEntity entity) {
    return _topStudentPostRepository(entity);
  }
}

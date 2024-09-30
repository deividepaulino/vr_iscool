import 'package:vr_iscool/core/shared/domain/usecases/get_list_usecase.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/domain/repositories/student_get_list_repository.dart';
import 'package:vr_iscool/modules/student_module/domain/typedefs/student_get_list_result.dart';

class StudentGetListUsecaseImpl
    implements GetListUsecase<StudentGetListResult, StudentEntity> {
  final StudentGetListRepository _repository;

  StudentGetListUsecaseImpl(this._repository);

  @override
  StudentGetListResult call(List<StudentEntity> entities) {
    return _repository(entities);
  }
}
